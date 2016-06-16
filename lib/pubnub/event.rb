# Toplevel Pubnub module.
module Pubnub
  # Event module holds most basic and required infrastructure for every pubnub
  # event, there are also SingleEvent module and SubscribeEvent module
  class Event
    attr_reader :origin, :callback, :channel, :fresh_clone,
                :open_timeout, :read_timeout, :idle_timeout, :group,
                :presence_callback, :wildcard_channel, :ssl, :state,
                :given_options

    alias_method :channels, :channel

    def initialize(options, app)
      @app = app
      @given_options = options
      env = app.env.clone
      env.delete(:state)
      create_variables_from_options(env.merge(options))
      @origin = @app.current_origin
      format_channels
      format_group
      set_timestamp
      validate!
      Pubnub.logger.debug('Pubnub::Event') { "Initialized #{self.class}" }
    end

    def fire
      Pubnub.logger.debug('Pubnub::Event') { "Fired event #{self.class}" }

      response = send_request

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    ensure
      terminate unless @stay_alive
    end

    def send_request(compressed_body = '')
      sender = request_dispatcher
      if compressed_body.empty?
        sender.get(uri.to_s)
      else
        sender.post(uri.to_s, body: compressed_body)
      end
    rescue => error
      error
    end

    def uri
      uri = @ssl ? 'https://' : 'http://'
      uri += @origin
      uri += path
      uri += '?' + Formatter.params_hash_to_url_params(parameters)
      Pubnub.logger.debug('Pubnub::Event') { "Requested URI: #{uri}" }
      URI uri
    end

    def finalized?
      @finalized || @stop
    end

    def sync?
      @http_sync ? true : false
    end

    private

    def secure_call(cb, arg)
      cb.call arg
    rescue => error
      Pubnub.logger.error('Pubnub::Event') { "Error while calling callback #{error.inspect}" }
    end

    def format_channels
      @channel = Formatter.format_channel(@channel || @channels)
      @channel += Formatter.format_presence_channel(@presence)
      @wildcard_channel = @channel.select { |e| e.index('.*') } || []
    end

    def fire_callbacks(envelope)
      Pubnub.logger.debug('Pubnub::Event') { "Firing callbacks for #{self.class}" }
      secure_call @callback, envelope if @callback
      envelope
    end

    def parameters
      required = {
        pnsdk: "PubNub-Ruby/#{Pubnub::VERSION}"
      }

      empty_if_blank = {
        auth: @auth_key,
        uuid: @app.env[:uuid]
      }

      empty_if_blank.delete_if { |_k, v| v.blank? }

      required.merge(empty_if_blank)
    end

    def handle(response, request)
      Pubnub.logger.debug('Pubnub::Event') { 'Event#handle' }
      @envelopes = format_envelopes response, request
    end

    def connection
      @app.connection_for(self)
    end

    def create_variables_from_options(options)
      variables = %w(channel channels message http_sync callback
                     ssl cipher_key secret_key auth_key
                     publish_key subscribe_key timetoken
                     open_timeout read_timeout idle_timeout heartbeat
                     group action read write manage ttl presence start
                     end count reverse presence_callback store skip_validate
                     state channel_group compressed meta customs include_token
                     replicate)

      options = options.each_with_object({}) { |option, obj| obj[option.first.to_sym] = option.last }

      variables.each { |variable| instance_variable_set('@' + variable, options[variable.to_sym]) unless variable.nil? }

      return if @event != :subscribe && @event != :presence

      @open_timeout = options[:s_open_timeout]
      @read_timeout = options[:s_read_timeout]
      @idle_timeout = options[:s_idle_timeout]
    end

    def format_group
      @group = @channel_group if @channel_group && @group.blank?
      @group = Formatter.format_group(@group)

      if @group.first.to_s.count(':') > 0
        @namespace_id, @group_id = @group.first.to_s.split(':')
      else
        @namespace_id = nil
        @group_id = @group.first.to_s
      end
    end

    def set_timestamp
      @timestamp = current_time
    end

    def current_time
      ::Time.now.to_i
    end

    def encode_parameter(parameter)
      URI.encode_www_form_component(parameter.to_json).gsub('+', '%20')
    end

    def error_message(parsed_response)
      parsed_response['message']
    rescue
      nil
    end

    def get_config
      {
        tls:      @app.env[:ssl],
        uuid:     @app.env[:uuid],
        auth_key: @app.env[:auth_key],
        origin:   @app.current_origin
      }
    end

    def error_envelope(_parsed_response, error, req_res_objects)
      Pubnub::ErrorEnvelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_HEARTBEAT,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: nil,
          category: (error ? Pubnub::Constants::STATUS_NON_JSON_RESPONSE : Pubnub::Constants::STATUS_ERROR),
          error: true,
          auto_retried: false,

          config: get_config
        }
      )
    end
  end
end
