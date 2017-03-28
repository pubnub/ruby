# Toplevel Pubnub module.
module Pubnub
  # Event module holds most basic and required infrastructure for every pubnub
  # event, there are also SingleEvent module and SubscribeEvent module
  class Event
    attr_reader :origin, :callback, :channel, :channel_group, :fresh_clone,
                :open_timeout, :read_timeout, :idle_timeout, :group,
                :presence_callback, :wildcard_channel, :ssl, :state,
                :given_options, :with_presence

    alias_method :channels, :channel
    alias_method :channel_groups, :channel_group

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
      Pubnub.logger.debug('Pubnub::Event') { '#send_request called' }

      sender = request_dispatcher
      Pubnub.logger.debug('Pubnub::Event') { '#send_request got sender' }

      if compressed_body.empty?
        sender.get(uri.to_s)
      else
        sender.post(uri.to_s, body: compressed_body)
      end
    rescue => error
      error
    end

    def uri
      sa_signature = super_admin_signature unless parameters.include?(:signature)

      uri = @ssl ? 'https://' : 'http://'
      uri += @origin
      uri += path
      uri += '?' + Formatter.params_hash_to_url_params(parameters)
      uri += "&signature=#{sa_signature}" if sa_signature
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

    def super_admin_signature
      return unless @app.env[:secret_key]

      message = [
          @app.env[:subscribe_key],
          @app.env[:publish_key],
          path,
          variables_for_signature
      ].join("\n")

      message = message.gsub(/[!~*'()]/) { |char| '%' + char.ord.to_s(16).upcase }

      URI.encode_www_form_component(Base64.encode64(
          OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'),
                               @app.env[:secret_key].to_s, message)
      ).strip).gsub('+', '%20')
    end

    def variables_for_signature
      parameters(true).map do |k, v|
        if %w(meta ortt).include?(k.to_s)
          encoded_value = URI.encode_www_form_component(v.to_json).gsub('+', '%20')
          "#{k}=#{encoded_value}"
        elsif %w(t state filter-expr).include?(k.to_s)
          "#{k}=#{v}"
        else
          "#{k}=#{URI.encode_www_form_component(v.to_s).gsub('+', '%20')}"
        end
      end.sort.join('&')
    end

    def secure_call(cb, arg)
      cb.call arg
    rescue => error
      Pubnub.logger.error('Pubnub::Event') { "Error while calling callback #{error.inspect}" }
    end

    def format_channels
      @channel =  Formatter.format_channel(@channel || @channels)
      @channel += Formatter.format_presence_channel(@presence)
      @channel += Formatter.format_presence_channel(@channel || @channels) if @with_presence
      @wildcard_channel = @channel.select { |e| e.index('.*') } || []
    end

    def fire_callbacks(envelope)
      Pubnub.logger.debug('Pubnub::Event') { "Firing callbacks for #{self.class}" }
      secure_call @callback, envelope if @callback
      envelope
    end

    def parameters(_set_signature = false)
      required = {
        pnsdk: @app.sdk_version
      }

      empty_if_blank = {
        auth: @auth_key,
        uuid: @app.env[:uuid]
      }

      required.merge!({timestamp: @timestamp}) if @app.env[:secret_key] && ![:grant, :revoke, :audit].include?(@event)

      empty_if_blank.delete_if { |_k, v| v.blank? }

      required.merge(empty_if_blank)
    end

    def handle(response, request)
      Pubnub.logger.debug('Pubnub::Event') { 'Event#handle' }
      @envelopes = format_envelopes response, request
    end

    def format_envelopes(response, request)
      if response.is_a? HTTPClient::ReceiveTimeoutError
        return error_envelope(nil, response, request: request, response: response)
      elsif response.is_a? OpenSSL::SSL::SSLError
        return error_envelope(nil, response, request: request, response: response)
      else
        parsed_response, error = Formatter.parse_json(response.body)
      end

      error = response if parsed_response && response.code.to_i != 200

      if error
        error_envelope(parsed_response, error, request: request, response: response)
      else
        valid_envelope(parsed_response, request: request, response: response)
      end
    end

    def create_variables_from_options(options)
      variables = %w(channel channels message http_sync callback
                     ssl cipher_key secret_key auth_key
                     publish_key subscribe_key timetoken
                     open_timeout read_timeout idle_timeout heartbeat
                     group action read write manage ttl presence start
                     end count reverse presence_callback store skip_validate
                     state channel_group channel_groups compressed meta customs include_token
                     replicate with_presence cipher_key_selector)

      options = options.each_with_object({}) { |option, obj| obj[option.first.to_sym] = option.last }

      variables.each { |variable| instance_variable_set('@' + variable, options[variable.to_sym]) unless variable.nil? }

      return if @event != :subscribe && @event != :presence

      @open_timeout = options[:s_open_timeout]
      @read_timeout = options[:s_read_timeout]
      @idle_timeout = options[:s_idle_timeout]
    end

    def format_group
      @group = (@channel_group || @channel_groups) if (@channel_group || @channel_groups) && @group.blank?
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

    def encode_parameter(parameter, format_json = true)
      parameter = format_json ? parameter.to_json : parameter
      URI.encode_www_form_component(parameter).gsub('+', '%20')
    end

    def compute_cipher_key(data)
      ck = @compute_cipher_key || @cipher_key || @app.env[:cipher_key_selector] || @app.env[:cipher_key].to_s
      return ck unless ck.respond_to?(:call)
      ck.call(data)
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
      case error
        when JSON::ParserError
          error_category = Pubnub::Constants::STATUS_NON_JSON_RESPONSE
          code = req_res_objects[:response].code
        when HTTPClient::ReceiveTimeoutError
          error_category = Pubnub::Constants::STATUS_TIMEOUT
          code = 408
        when OpenSSL::SSL::SSLError
          error_category = Pubnub::Constants::SSL_ERROR
          code = nil
        else
          error_category = Pubnub::Constants::STATUS_ERROR
          code = req_res_objects[:response].code
      end

      Pubnub::ErrorEnvelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: nil,
          status: {
              code: code,
              operation: current_operation,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: nil,
              category: error_category,
              error: true,
              auto_retried: false,

              config: get_config
          }
      )
    end
  end
end
