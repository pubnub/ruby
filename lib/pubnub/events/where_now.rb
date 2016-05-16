# Toplevel Pubnub module.
module Pubnub
  # Holds where_now functionality
  class WhereNow < SingleEvent
    include Celluloid
    include Pubnub::Validator::WhereNow

    def initialize(options, app)
      super
      @uuid_looking_for = options[:uuid] || options['uuid']
      @uuid             = app.uuid
      @event            = :where_now
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

    def format_envelopes(response, request)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

      if error
        error_envelope(parsed_response, error, request: request, response: response)
      else
        valid_envelope(parsed_response, request: request, response: response)
                   end
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event:         @event,
        event_options: @given_options,
        timetoken:     nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: nil,
          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config

        },
        result: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_WHERE_NOW,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: {
            state: parsed_response['state'],
            channels: parsed_response['channels']
          }
        }
      )
    end

    def error_envelope(_parsed_response, error, req_res_objects)
      Pubnub::ErrorEnvelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: nil,
          status: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_WHERE_NOW,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: nil,
              category: (error ? Pubnub::Constants::STATUS_NON_JSON_RESPONSE : Pubnub::Constants::STATUS_ERROR),
              error: true,
              auto_retried: false,

              current_timetoken: nil,
              last_timetoken: nil,
              subscribed_channels: nil,
              subscribed_channel_groups: nil,

              config: get_config
          }
      )
    end
  end
end
