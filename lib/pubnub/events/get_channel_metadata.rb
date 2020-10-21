# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds GetChannelMetadata functionality
  class GetChannelMetadata < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetChannelMetadata

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @channel = options[:channel]

      if options[:include]
        @include = "custom" unless [0, '0', false].include?(options[:include][:custom])
      end

      # Single entity creation should return it's 'custom' field by default.
      @include = "custom" if @include.nil?
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_CHANNEL_METADATA
    end

    def parameters(signature = false)
      parameters = super(signature)
      parameters[:include] = @include

      parameters
    end

    def path
      '/' + [
        'v2',
        'objects',
        @subscribe_key,
        'channels',
        Formatter.channels_for_url(@channel)
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response
        },

        status: {
          code: req_res_objects[:response].code,
          operation: current_operation,
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
