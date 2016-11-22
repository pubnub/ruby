# Toplevel Pubnub module.
module Pubnub
  # Holds leave functionality
  class Leave < SingleEvent
    include Celluloid
    include Pubnub::Validator::Leave

    def initialize(options, app)
      @event = :leave
      super
    end

    def fire
      @app.subscriber.remove_subscription(self)
      @app.subscriber.reset
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_PRESENCE_LEAVE
    end

    def path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
        'leave'
      ].join('/')
    end

    def parameters(*_args)
      params = super
      params.merge!('channel-group' => @group.join(',')) unless @group.empty?
      params
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: parsed_response['status'],
          operation: Pubnub::Constants::OPERATION_PRESENCE_LEAVE,
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
