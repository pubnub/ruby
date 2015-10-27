# Toplevel Pubnub module.
module Pubnub
  # Holds here_now functionality
  class HereNow < SingleEvent
    include Celluloid
    include Pubnub::Validator::HereNow

    def initialize(options, app)
      @event = :here_now
      super
    end

    private

    def path
      if @channel.first.blank?
        global_path
      else
        channel_path
      end
    end

    def channel_path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        @channel
      ].join('/')
    end

    def global_path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        ('channel' unless @group.blank?),
        (',' unless @group.blank?)
      ].delete_if(&:nil?).join('/')
    end

    def parameters
      parameters = super
      parameters.merge!(
        'channel-group' => @group.join(',')
      ) unless @group.blank?
      parameters
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
        payload:         parsed_response['payload'],
        service:         parsed_response['service'],
        message:         parsed_response['message'],
        status:          parsed_response['status'],
        uuids:           parsed_response['uuids']
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
