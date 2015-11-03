# Toplevel Pubnub module.
module Pubnub
  # Holds SetState functionality
  class SetState < SingleEvent
    include Celluloid
    include Pubnub::Validator::SetState

    def initialize(options, app)
      @event = :set_state
      super
      app.apply_state(self)
    end

    private

    def parameters
      parameters = super
      parameters.merge!({ :state => encode_state(@state)})
      parameters.merge!({ 'channel-group' => format_channel_group(@group).join(',') }) unless @group.blank?
      parameters
    end

    def path
      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'channel',
          Formatter.channels_for_url(@channel),
          'uuid',
          @app.uuid,
          'data'
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
          channel: parsed_response['channel'],
          payload: parsed_response['payload'],
          service: parsed_response['service'],
          message: parsed_response['message'],
          uuid:    parsed_response['uuid'],
          status:  parsed_response['status']
      )
    end
  end
end
