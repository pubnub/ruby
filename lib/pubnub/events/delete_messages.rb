# Toplevel Pubnub module.
module Pubnub
  # Holds delete functionality
  class DeleteMessages < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::Delete

    def initialize(options, app)
      @event = :delete
      @telemetry_name = :l_hist
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_DELETE
    end

    def parameters(signature = false)
      {
        start: @start,
        end: @end
      }.reject { |_, value| value.blank? }.merge(super(signature))
    end

    def path
      '/' + [
        'v3',
        'history',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.format_channel(@channel, true)
      ].join('/')
    end

    def valid_envelope(_parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_DELETE,
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
