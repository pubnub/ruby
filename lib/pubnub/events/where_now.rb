# Toplevel Pubnub module.
module Pubnub
  # Holds where_now functionality
  class WhereNow < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::WhereNow

    def initialize(options, app)
      super
      @telemetry_name = :l_pres
      @uuid_looking_for = options[:uuid] || options['uuid']
      @uuid = app.uuid
      @event = :where_now
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_WHERE_NOW
    end

    def path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'uuid',
        Formatter.encode(@uuid_looking_for)
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
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

          data: parsed_response['payload']
        }
      )
    end
  end
end
