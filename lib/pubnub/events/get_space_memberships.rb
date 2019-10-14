# Toplevel Pubnub module.
module Pubnub
  # Holds GetSpaceMemberships functionality
  class GetSpaceMemberships < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetSpaceMemberships
    @max_limit = 100

    def initialize(options, app)
      @event = :get_space_memberships
      @telemetry_name = :l_obj
      @start = options[:start]
      if options[:end] == nil
        @end = @max_limit
      else
        @end = options[:end]
      end
      @limit = options[:limit]
      if options[:count] == nil
        @count = false
      else
        @count = options[:count]
      end
      @include = options[:include]
      @user_id = options[:user_id]
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_SPACE_MEMBERSHIPS
    end

    def parameters(*_args)
      parameters = super
      parameters[:start] = @start if @start
      parameters[:end] = @end if @end && !@start
      parameters[:count] = @count if @count
      parameters[:limit] = @limit if @limit != @max_limit
      parameters[:include] = @include if @include

      parameters
    end

    def path
      '/' + [
          'v1',
          'objects',
          @subscribe_key,
          'users',
          @user_id,
          'spaces'
      ].join('/')
    end

    def valid_envelope(_parsed_response, req_res_objects)
      Pubnub::Envelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: nil,

          result: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_GET_SPACE_MEMBERSHIPS,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: _parsed_response,
          },

          status: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_GET_SPACE_MEMBERSHIPS,
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
