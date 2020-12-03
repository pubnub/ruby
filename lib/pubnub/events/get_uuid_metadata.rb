# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds GetUuidMetadata functionality
  class GetUuidMetadata < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetUuidMetadata

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @uuid = options[:uuid].nil? ? app.env[:uuid] : options[:uuid]

      if options[:include]
        @include = "custom" unless [0, '0', false].include?(options[:include][:custom])
      end

      # Single entity creation should return it's 'custom' field by default.
      @include = "custom" if @include.nil?
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_UUID_METADATA
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
        'uuids',
        Formatter.encode(@uuid)
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      data = parsed_response['data']
      metadata = Hash.new
      data.each{ |k,v| metadata[k.to_sym] = v }
      metadata[:updated] = Date._parse(metadata[:updated]) unless metadata[:updated].nil?

      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: metadata
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
