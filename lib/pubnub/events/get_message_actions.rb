# Toplevel Pubnub module.
module Pubnub
  # Holds get message actions functionality
  class GetMessageActions < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GetMessageActions

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_msga
      super
    end

    private

    def parameters(*_args)
      parameters = super
      parameters['start'] = @start unless @start.nil?
      parameters['end'] = @end unless @end.nil?
      parameters['limit'] = @limit unless @limit.nil?
      parameters
    end

    def current_operation
      Pubnub::Constants::OPERATION_GET_MESSAGE_ACTIONS
    end

    def path
      '/' + [
        'v1',
        'message-actions',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel)
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      actions = parsed_response['data'].map do |v|
        v['message_timetoken'] = v['messageTimetoken'].to_i
        v['action_timetoken'] = v['actionTimetoken'].to_i
        v.delete_if { |key| %w[messageTimetoken actionTimetoken].include? key }
        v.transform_keys(&:to_sym)
      end

      more = parsed_response.key?('more') ? parsed_response['more'].transform_keys(&:to_sym) : {}
      more.delete :url unless more.empty?

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
            message_actions: actions,
            more: more.empty? ? nil : more
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