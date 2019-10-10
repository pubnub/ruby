# Toplevel Pubnub module.
module Pubnub
  # Holds GetSpace functionality
  class GetSpace < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetSpace

    def initialize(options, app)
      @event = :get_space
      @telemetry_name = :l_obj
      @space_id = options[:space_id]
      @include = options[:include]
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_SPACE
    end

    def parameters(*_args)
      parameters = super
      parameters[:include] = @include if @include
      parameters
    end

    def path
      '/' + [
          'v1',
          'objects',
          @subscribe_key,
          'spaces',
          @space_id
      ].join('/')
    end

    def valid_envelope(_parsed_response, req_res_objects)
      Pubnub::Envelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: nil,

          result: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_GET_SPACE,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: _parsed_response,
          },

          status: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_GET_SPACE,
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
