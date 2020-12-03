# Toplevel Pubnub module
module Pubnub
  # Push related event
  class RemoveDeviceFromPush < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::RemoveDeviceFromPush

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_push
      super
      # `environment` should
      @environment ||= 'development' if @push_gateway.eql? 'apns2'
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_REMOVE_DEVICE_FROM_PUSH
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue StandardError
      nil
    end

    def path
      if @push_gateway.eql? 'apns2'
        '/' + [
          'v2',
          'push',
          'sub-key',
          @subscribe_key,
          'devices-apns2',
          @push_token,
          'remove'
        ].join('/')
      else
        '/' + [
          'v1',
          'push',
          'sub-key',
          @subscribe_key,
          'devices',
          @push_token,
          'remove'
        ].join('/')
      end
    end

    def parameters(*_args)
      params = super
      params[:type] = @push_gateway unless @push_gateway.eql? 'apns2'
      params[:environment] = @environment if @push_gateway.eql? 'apns2'
      params[:topic] = @topic if @push_gateway.eql? 'apns2'
      params
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          operation: current_operation,
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
