# Toplevel Pubnub module.
module Pubnub
  # Holds heartbeat functionality
  class Heartbeat < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::Heartbeat
    include Pubnub::Formatter

    def initialize(options, app)
      @telemetry_name = :l_pres
      @event = :heartbeat
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_HEARTBEAT
    end

    def path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
        'heartbeat'
      ].join('/')
    end

    def parameters(*_args)
      parameters = super
      parameters[:state] = encode_state(@app.env[:state][@origin]) if @app.env[:state] && @app.env[:state][@origin]
      parameters[:heartbeat] = @heartbeat
      parameters['channel-group'] = @group.join(',') unless @group.blank?
      parameters
    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end

    def valid_envelope(_parsed_response, req_res_objects)
      # {"status": 200, "message": "OK", "service": "Presence"}
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_HEARTBEAT,
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
