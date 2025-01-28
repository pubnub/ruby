# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds GetAllUuidMetadata functionality
  class GetAllUuidMetadata < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetAllUuidMetadata

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @limit = [options[:limit], 100].min unless options[:limit].nil?
      @sort = options[:sort].join(',') if options[:sort] && !options[:sort].empty?
      @filter = options[:filter] if options[:filter] && !options[:filter].empty?
      @start = options[:start] if options[:start] && !options[:start].empty?
      @end = options[:end] if options[:start] && !options[:end].empty?

      @include = []
      if options[:include]
        include = options[:include]
        @include.push('type') unless include[:type].nil? || [0, '0', false].include?(include[:type])
        @include.push('status') unless include[:status].nil? || [0, '0', false].include?(include[:status])
        @include.push('custom') unless include[:custom].nil? || [0, '0', false].include?(include[:custom])
        @include_count = [0, '0', false].include?(include[:count]) ? '0' : '1' unless include[:count].nil?
      end

      # Collections by default return number of available entries.
      @include_count = '1' if @include_count.nil?

      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GET_ALL_UUID_METADATA
    end

    def parameters(signature = false)
      parameters = super(signature)
      parameters[:limit] = @limit unless @limit.nil?
      parameters[:sort] = @sort unless @sort.nil?
      parameters[:filter] = @filter unless @filter.nil?
      parameters[:start] = @start unless @start.nil?
      parameters[:end] = @end if @end && !@start
      parameters[:count] = @include_count unless @include_count.nil?
      parameters[:include] = @include.sort.join(',') unless @include.empty?

      parameters
    end

    def path
      '/' + [
        'v2',
        'objects',
        @subscribe_key,
        'uuids'
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      uuids_metadata = parsed_response['data'].map do |uuid_metadata|
        metadata = {}
        uuid_metadata.each { |k, v| metadata[k.to_sym] = v }
        metadata[:updated] = Date._parse(metadata[:updated]) unless metadata[:updated].nil?
        metadata
      end

      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: {
            metadata: uuids_metadata,
            totalCount: parsed_response['totalCount'],
            next: parsed_response['next'],
            prev: parsed_response['prev']
          }
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
