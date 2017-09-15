# Toplevel Pubnub module.
module Pubnub
  # Holds time functionality
  class Time < SingleEvent
    include Celluloid
    include Pubnub::Validator::Time

    def initialize(options, app)
      @event = :time
      @telemetry_name = :l_time
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_TIME
    end

    def path
      '/time/0'
    end

    def timetoken(parsed_response)
      parsed_response.first
    rescue
      nil
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
  end
end
