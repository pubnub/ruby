# Toplevel Pubnub module.
module Pubnub
  # Holds leave functionality
  class Leave < SingleEvent
    include Celluloid
    include Pubnub::Validator::Leave

    def initialize(options, app)
      @event = :leave
      super
    end

    def fire
      @app.subscriber.remove_subscription(self)
      @app.subscriber.reset
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
        Formatter.channels_for_url(@channel),
        'leave'
      ].join('/')
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

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
