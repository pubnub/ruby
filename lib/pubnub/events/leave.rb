# Toplevel Pubnub module
module Pubnub
  # Holds leave functionality
  class Leave
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent

    def fire
      begin
        @app.env[:subscription_pool][@origin]
            .mailbox << Message::RemoveSubscription.new(self)
      rescue => error
        raise error, error.message unless error.class == NoMethodError
      end

      super
    end

    private

    def path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        @channel.join(','),
        'leave'
      ].join('/')
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code != '200'

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    [valid_envelope(parsed_response)]
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def valid_envelope(parsed_response)
      Envelope.new(
          parsed_response: parsed_response,
          action:          parsed_response['action'],
          message:         parsed_response['message'],
          uuid:            parsed_response['uuid'],
          status:          parsed_response['status'],
          service:         parsed_response['service']
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: response_message(parsed_response),
          channel:          @channel.first,
          timetoken:        timetoken(parsed_response)
      )
    end
  end
end
