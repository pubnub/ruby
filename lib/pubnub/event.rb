require 'pubnub/event/signature'
require 'pubnub/event/formatter'

# Toplevel Pubnub module.
module Pubnub
  # Event module holds most basic and required infrastructure for every pubnub
  # event, there are also SingleEvent module and SubscribeEvent module
  class Event
    attr_reader :origin, :callback, :channel, :channel_group, :fresh_clone,
                :open_timeout, :read_timeout, :idle_timeout, :group,
                :presence_callback, :wildcard_channel, :ssl, :state,
                :given_options, :with_presence

    alias channels channel
    alias channel_groups channel_group

    include Signature
    include EFormatter

    def initialize(options, app)
      @app = app
      @given_options = options
      env = app.env.clone
      env.delete(:state)
      create_variables_from_options(env.merge(options))
      @origin = @app.current_origin
      format_channels if enable_format_channels?
      format_group if enable_format_group?
      set_timestamp
      validate!
      telemetry = @app.telemetry_for(@telemetry_name)
      @compressed_body = nil
      @current_telemetry = telemetry ? telemetry.round(3) : nil
      Pubnub.logger.debug('Pubnub::Event') { "Initialized #{self.class}" }
    end

    def fire
      Pubnub.logger.debug('Pubnub::Event') { "Fired event #{self.class}" }

      response = send_request

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    def send_request(compressed_body = '', header = {})
      Pubnub.logger.debug('Pubnub::Event') { '#send_request called' }

      @compressed_body = compressed_body
      sender = request_dispatcher
      Pubnub.logger.debug('Pubnub::Event') { '#send_request got sender' }

      telemetry_time_start = ::Time.now.to_f
      response = case operation_http_method
                 when "get"
                   sender.get(uri.to_s, header: header)
                 when "post"
                   sender.post(uri.to_s, body: compressed_body, header: header)
                 when "patch"
                   sender.patch(uri.to_s, body: compressed_body, header: header)
                 else
                   sender.delete(uri.to_s, header: header)
                 end

      begin
        @app.record_telemetry(@telemetry_name, telemetry_time_start, ::Time.now.to_f)
      rescue StandardError => error
        Pubnub.logger.warn('Pubnub::Event') { "Couldn't record telemetry because of #{error}\n#{error.backtrace.join("\n")}" }
      end

      response
    rescue StandardError => error
      Pubnub.logger.error('Pubnub::Event') { error }
      error
    end

    def uri(memo = true)
      unless is_a? SubscribeEvent
        return @uri = uri(false) if memo
        return @uri if @uri
      end

      sa_signature = super_admin_signature(operation_http_method, @compressed_body) unless parameters.include?(:signature)

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

    def enable_format_channels?
      true
    end

    def enable_format_group?
      true
    end

    def operation_http_method
      case @event
      when Pubnub::Constants::OPERATION_DELETE, Pubnub::Constants::OPERATION_REMOVE_CHANNEL_METADATA, Pubnub::Constants::OPERATION_REMOVE_UUID_METADATA
        "delete"
      when Pubnub::Constants::OPERATION_SET_UUID_METADATA, Pubnub::Constants::OPERATION_SET_CHANNEL_METADATA,
           Pubnub::Constants::OPERATION_SET_CHANNEL_MEMBERS, Pubnub::Constants::OPERATION_SET_MEMBERSHIPS,
           Pubnub::Constants::OPERATION_REMOVE_CHANNEL_MEMBERS, Pubnub::Constants::OPERATION_REMOVE_MEMBERSHIPS
        "patch"
      else
        if @compressed_body.nil? || @compressed_body.empty?
          "get"
        else
          "post"
        end
      end
    end

    def secure_call(cb, arg)
      cb.call arg
    rescue StandardError => error
      Pubnub.logger.error('Pubnub::Event') { "Error while calling callback #{error.inspect}" }
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
        uuid: @app.env[:uuid],
        @telemetry_name => @current_telemetry
      }

      empty_if_blank[@telemetry_name] = nil if @app.env[:no_telemetry]

      required[:timestamp] = @timestamp if @app.env[:secret_key] && !%i[grant revoke audit].include?(@event)

      empty_if_blank.delete_if { |_k, v| v.blank? }
      required.merge(empty_if_blank)
    end

    def handle(response, request)
      Pubnub.logger.debug('Pubnub::Event') { 'Event#handle' }
      @envelopes = format_envelopes response, request
    end

    def create_variables_from_options(options)
      variables = %w[channel channels message http_sync callback
                     ssl cipher_key random_iv secret_key auth_key
                     publish_key subscribe_key timetoken
                     open_timeout read_timeout idle_timeout heartbeat
                     group action read write delete manage ttl presence start
                     end count limit reverse presence_callback store skip_validate
                     state channel_group channel_groups compressed meta customs include_token
                     replicate with_presence cipher_key_selector include_meta join update get
                     add remove push_token push_gateway environment topic authorized_uuid uuids
                   ]

      options = options.each_with_object({}) { |option, obj| obj[option.first.to_sym] = option.last }

      variables.each { |variable| instance_variable_set('@' + variable, options[variable.to_sym]) unless variable.nil? }

      return if @event != :subscribe && @event != :presence

      @open_timeout = options[:s_open_timeout]
      @read_timeout = options[:s_read_timeout]
      @idle_timeout = options[:s_idle_timeout]
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

    def compute_random_iv(data)
      ck = @compute_random_iv || @random_iv || @app.env[:random_iv_selector] || @app.env[:random_iv].to_s
      return ck unless ck.respond_to?(:call)
      ck.call(data)
    end

    def error_message(parsed_response)
      parsed_response['message']
    rescue StandardError
      nil
    end

    def get_config
      {
        tls: @app.env[:ssl],
        uuid: @app.env[:uuid],
        auth_key: @app.env[:auth_key],
        origin: @app.current_origin
      }
    end

    def error_envelope(_parsed_response, error, req_res_objects)
      case error
      when JSON::ParserError
        error_category = Pubnub::Constants::STATUS_NON_JSON_RESPONSE
        code = req_res_objects[:response].code
      when HTTPClient::TimeoutError
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
