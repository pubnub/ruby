# Toplevel Pubnub module.
module Pubnub
  # Holds history functionality
  class History < SingleEvent
    include Concurrent::Async
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

    def meta(message)
      message['meta'] if @include_meta
    end

    def message(message)
      if @include_token || @include_meta
        message['message']
      else
        message
      end
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue StandardError
      nil
    end

    def path
      '/' + [
        'v2',
        'history',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel)
      ].join('/')
    end

    def parameters(*_args)
      params = super
      params[:start] = @start if @start
      params[:end] = @end if @end
      params[:count] = @count if @count
      params[:reverse] = 'true' if @reverse
      params[:include_token] = 'true' if @include_token
      params[:include_meta] = 'true' if @include_meta
      params
    end

    def decrypt_history(message, crypto)
      if @include_token || @include_meta
        message['message'] = JSON.parse(crypto.decrypt(message['message']), quirks_mode: true)

        message
      else
        JSON.parse(crypto.decrypt(message), quirks_mode: true)
      end
    end

    def valid_envelope(parsed_response, req_res_objects)
      messages = parsed_response[0]

      # TODO: Uncomment code below when cryptor implementations will be added.
      # if crypto_module && messages
      #   crypto = crypto_module
      #   messages = messages.map { |message| decrypt_history(message, crypto) }
      # end
      if (@cipher_key || @app.env[:cipher_key] || @cipher_key_selector || @app.env[:cipher_key_selector]) && messages
        cipher_key = compute_cipher_key(parsed_response)
        random_iv = compute_random_iv(parsed_response)
        crypto = Cryptor.new(cipher_key, random_iv)
        messages = messages.map { |message| decrypt_history(message, crypto) }
      end

      start = parsed_response[1]
      finish = parsed_response[2]

      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
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
