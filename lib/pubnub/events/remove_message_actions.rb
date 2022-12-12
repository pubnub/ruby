# Toplevel Pubnub module.
module Pubnub
  # Holds get message actions functionality
  class RemoveMessageAction < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::RemoveMessageAction

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_msga
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_REMOVE_MESSAGE_ACTION
    end

    def path
      '/' + [
        'v1',
        'message-actions',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
        'message',
        @message_timetoken,
        'action',
        @action_timetoken
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response['data']
        },

        status: {
          code: req_res_objects[:response].code,
          operation: current_operation,
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
        }
      )
    end
  end
end