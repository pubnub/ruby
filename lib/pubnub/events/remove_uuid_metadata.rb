# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds RemoveUuidMetadata functionality
  class RemoveUuidMetadata < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::RemoveUuidMetadata

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @uuid = options[:uuid].nil? ? app.env[:uuid] : options[:uuid]
      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::RemoveUuidMetadata') { "Fired event #{self.class}" }

      body = Formatter.format_message(@data, @cipher_key, false)
      response = send_request(body)

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_REMOVE_UUID_METADATA
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
