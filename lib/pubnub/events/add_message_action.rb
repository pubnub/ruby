# Toplevel Pubnub module.
module Pubnub
  # Holds add message action functionality
  class AddMessageAction < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::AddMessageAction

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_msga
      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::Add Message Action') { "Fired event #{self.class}" }
      type_payload = { type: @type, value: @value}
      body = Formatter.format_message(type_payload, '', false, false)

      response = send_request(body, { "Content-Type": 'application/json' })

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_ADD_MESSAGE_ACTION
    end

    def path
      '/' + [
        'v1',
        'message-actions',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel),
        'message',
        @message_timetoken,
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      data = parsed_response['data']

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
            type: data['type'],
            value: data['value'],
            uuid: data['uuid'],
            action_timetoken: data['actionTimetoken'].to_i,
            message_timetoken: data['messageTimetoken'].to_i
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