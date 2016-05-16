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
        event: @event,
        event_options: @given_options,
        timetoken: timetoken(parsed_response),
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
          operation: Pubnub::Constants::OPERATION_TIME,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response]


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
              operation: Pubnub::Constants::OPERATION_HEARTBEAT,
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
