# Toplevel Pubnub module
module Pubnub
  # Holds time functionality
  class Time < SingleEvent
    include Celluloid

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
          message:          timetoken(parsed_response),
          response_message: timetoken(parsed_response),
          timetoken:        timetoken(parsed_response)
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: parsed_response,
          timetoken:        timetoken(parsed_response)
      )
    end
  end
end
