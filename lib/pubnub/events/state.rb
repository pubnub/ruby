# Toplevel Pubnub module.
module Pubnub
  # Holds state functionality
  class State < SingleEvent
    include Celluloid

    private

    def initialize(options, app)
      super
      @uuid_looking_for = options[:uuid]
      @uuid             = app.uuid
    end

    private

    def parameters
      parameters = super
      parameters.merge!(
          'channel-group' => format_channel_group(@group)
                                 .join(',')
      ) unless @group.blank?
      parameters
    end

    def path
      '/' + [
        'v2',
        'presence',
        'sub_key',
        @subscribe_key,
        'channel',
        channels_for_url(@channel),
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
          channel: parsed_response['channel'],
          payload: parsed_response['payload'],
          service: parsed_response['service'],
          message: parsed_response['message'],
          uuid:    parsed_response['uuid'],
          status:  parsed_response['status']
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: response_message(parsed_response)
      )
    end
  end
end
