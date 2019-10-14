# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds GetUsers functionality
  class GetUsers < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetUsers
    @max_limit = 100

    def initialize(options, app)
      @event = :get_users
      @telemetry_name = :l_obj
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_USERS
    end

    def parameters(*_args)
      parameters = super

      parameters
    end

    def path
      '/' + [
        'v1',
        'objects',
        @subscribe_key,
        'users'
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_GET_USERS,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response
        },

        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_GET_USERS,
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
