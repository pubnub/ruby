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
      @start = options[:start]
      @end = if options[:end].nil?
               @max_limit
             else
               @end = options[:end]
             end
      @limit = options[:limit]
      @count = if options[:count].nil?
                 false
               else
                 options[:count]
               end
      @include = options[:include]
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_USERS
    end

    def parameters(*_args)
      parameters = super
      parameters[:start] = @start if @start
      #parameters[:end] = @end if @end && !@start
      parameters[:count] = @count if @count
      #parameters[:limit] = @limit if @limit && @limit != @max_limit
      parameters[:include] = @include if @include

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
