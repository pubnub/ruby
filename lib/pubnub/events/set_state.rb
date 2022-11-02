# Toplevel Pubnub module.
module Pubnub
  # Holds SetState functionality
  class SetState < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::SetState

    def initialize(options, app)
      @event = :set_state
      @telemetry_name = :l_pres
      super
      app.apply_state(self)
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_SET_STATE
    end

    def parameters(*_args)
      parameters = super
      parameters[:state] = encode_parameter(@state)
      parameters['channel-group'] = format_channel_group(@group).join(',') unless @group.blank?
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
        Formatter.encode(@app.user_id),
        'data'
      ].join('/')
    end

    def valid_envelope(_parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_SET_STATE,
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
