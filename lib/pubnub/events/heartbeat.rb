# Toplevel Pubnub module
module Pubnub
  # Holds heartbeat functionality
  class Heartbeat
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter

    private

    def path
      if @channel == [''] || @channel.blank?
        channel = [',']
      else
        channel = @channel
      end

      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        channel.join(','),
        'heartbeat'
      ].join('/')
    end

    def parameters
      parameters = super
      if @app.env[:state] && @app.env[:state][@origin]
        parameters.merge!(state: encode_state(@app.env[:state][@origin]))
      end
      parameters.merge!(heartbeat: @heartbeat)
      parameters.merge!(
          'channel-group' => format_channel_group(@channel_group, true)
                                 .join(',')
      ) unless @channel_group.blank?
      parameters
    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
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
          message: parsed_response,
          response_message: parsed_response
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
