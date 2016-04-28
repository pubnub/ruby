# Toplevel Pubnub module.
module Pubnub
  # Holds time functionality
  class Time < SingleEvent
    include Celluloid
    include Pubnub::Validator::Time

    def initialize(options, app)
      @event = :time
      super
    end

    private

    def path
      '/time/0'
    end

    def timetoken(parsed_response)
      parsed_response.first
    rescue
      nil
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    [valid_envelope(parsed_response)]
                  end

      envelopes
    end

    def valid_envelope(parsed_response)
      Envelope.new(
        event: @event,
        event_options: @given_options,
        parsed_response: parsed_response,
        message:          timetoken(parsed_response),
        response_message: timetoken(parsed_response),
        timetoken:        timetoken(parsed_response)
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
        event: @event,
        event_options: @given_options,
        error:            error,
        response_message: parsed_response,
        timetoken:        timetoken(parsed_response)
      )
    end
  end
end
