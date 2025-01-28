# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds SetUuidMetadata functionality
  class SetUuidMetadata < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::SetUuidMetadata

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @uuid = options[:uuid].nil? ? app.user_id : options[:uuid]

      # Clean up user-provided metadata object from nils.
      @metadata = options[:metadata].delete_if { |_k, v| v.blank? } unless options[:metadata].nil?

      @include = []
      if options[:include]
        include = options[:include]
        @include.push('type') unless include[:type].nil? || [0, '0', false].include?(include[:type])
        @include.push('status') unless include[:status].nil? || [0, '0', false].include?(include[:status])
        @include.push('custom') unless include[:custom].nil? || [0, '0', false].include?(include[:custom])
      end

      # Single entity creation should return it's 'custom' field by default.
      @include = ['custom'] if @include.empty?

      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::SetUuidMetadata') { "Fired event #{self.class}" }

      body = Formatter.format_message(@metadata, nil, false)
      response = send_request(body)

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_SET_UUID_METADATA
    end

    def parameters(signature = false)
      parameters = super(signature)
      parameters[:include] = @include.sort.join(',') unless @include.empty?
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
      metadata = {}
      data.each { |k, v| metadata[k.to_sym] = v }
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
