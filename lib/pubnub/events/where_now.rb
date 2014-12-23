# Toplevel Pubnub module
module Pubnub
  # Holds where_now functionality
  class WhereNow
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent

    def initialize(options, app)
      @uuid_looking_for = options[:uuid]
      @uuid = app.uuid
      super
    end

    private

    def path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'uuid',
        @uuid_looking_for
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
          payload:         parsed_response['payload'],
          service:         parsed_response['service'],
          message:         parsed_response['message'],
          status:          parsed_response['status']
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
