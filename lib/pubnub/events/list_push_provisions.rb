# Toplevel Pubnub module
module Pubnub
  # Push related event
  class ListPushProvisions < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::Push

    def initialize(options, app)
      @event = current_operation
      @params = options
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_LIST_PUSH_PROVISIONS
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue StandardError
      nil
    end

    def path
      '/' + [
        'v1',
        'push',
        'sub-key',
        @subscribe_key,
        'devices',
        @params.fetch(:push_token)
      ].join('/')
    end

    def parameters(*_args)
      params = super
      params.merge!(@params.select { |p, _| required_params.include?(p) })
      params
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          data: nil,
          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config
        },
        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response
        }
      )
    end
  end
end
