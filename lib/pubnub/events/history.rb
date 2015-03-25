# Toplevel Pubnub module.
module Pubnub
  # Holds history functionality
  class History < SingleEvent
    include Celluloid

    private

    def timetoken(parsed_response)
      parsed_response[2]
    rescue
      nil
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
        @channel
      ].join('/')
    end

    def parameters
      params = super
      params.merge!(start:   @start) if @start
      params.merge!(end:     @end) if @end
      params.merge!(count:   @count) if @count
      params.merge!(reverse: 'true') if @reverse
      params
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code != '200'

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    valid_envelopes(parsed_response)
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def valid_envelopes(parsed_response)
      parsed_response.first.map do |message|
        Envelope.new(parsed_response:  parsed_response,
                     message:          message,
                     channel:          @channel.first,
                     response_message: response_message(parsed_response),
                     timetoken:        timetoken(parsed_response),
                     history_start:    parsed_response[1],
                     history_end:      parsed_response[2])
      end
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
