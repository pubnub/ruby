# Toplevel Pubnub module.
module Pubnub
  # Holds state functionality
  class State < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::State

    def initialize(options, app)
      @event = :state
      @telemetry_name = :l_pres
      @uuid_looking_for = options[:uuid] || options['uuid']
      super
      @uuid = app.uuid
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_STATE
    end

    def parameters(*_args)
      parameters = super
      parameters.merge!(
        'channel-group' => @group.join(',')
      ) unless @group.blank?
      parameters
    end

    def path
      '/' + [
        'v2',
        'presence',
        'sub_key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
        'uuid',
        Formatter.encode(@uuid_looking_for)
      ].join('/')
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
          operation: Pubnub::Constants::OPERATION_GET_STATE,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: {
            state: parsed_response['payload'],
            channel: parsed_response['channel']
          }
        }
      )
    end
  end
end
