# Toplevel Pubnub module.
module Pubnub
  # Holds history functionality
  class History < SingleEvent
    include Celluloid
    include Pubnub::Validator::History

    def initialize(options, app)
      @event = :history
      @telemetry_name = :l_hist
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_HISTORY
    end

    def timetoken(message)
      message['timetoken'] if @include_token
    end

    def message(message)
      if @include_token
        message['message']
      else
        message
      end
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue
      nil
    end

    def path
      '/' + [
        'v2',
        'history',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
      ].join('/')
    end

    def parameters(*_args)
      params = super
      params.merge!(start:   @start)       if @start
      params.merge!(end:     @end)         if @end
      params.merge!(count:   @count)       if @count
      params.merge!(reverse: 'true')       if @reverse
      params.merge!(include_token: 'true') if @include_token
      params
    end

    def valid_envelope(parsed_response, req_res_objects)
      messages = parsed_response[0]

      if (@cipher_key || @app.env[:cipher_key] || @cipher_key_selector || @app.env[:cipher_key_selector]) && messages
        cipher_key = compute_cipher_key(parsed_response)
        crypto = Crypto.new(cipher_key)
        messages = messages.map { |message| JSON.parse(crypto.decrypt(message), quirks_mode: true) }
      end

      start = parsed_response[1]
      finish = parsed_response[2]

      Pubnub::Envelope.new(
        event:         @event,
        event_options: @given_options,
        timetoken:     nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          data: nil,
          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config

        },
        result: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_HISTORY,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: {
            messages: messages,
            end: finish,
            start: start
          }
        }
      )
    end
  end
end
