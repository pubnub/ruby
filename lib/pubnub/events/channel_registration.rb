# Toplevel Pubnub module.
module Pubnub
  # Holds channel_registration functionality
  class ChannelRegistration < SingleEvent
    include Celluloid
    include Pubnub::Validator::ChannelRegistration

    def initialize(options, app)
      @event = :channel_registration
      super
      @action = @action.to_sym unless @action.nil?
    end

    private

    def parameters
      parameters = super
      if @action == :add && !@channel.blank?
        parameters.merge!(add: @channel.join(','))
      end

      if @action == :remove && !@channel.blank?
        parameters.merge!(remove: @channel.join(','))
      end

      parameters
    end

    def path
      head = "/v1/channel-registration/sub-key/#{@subscribe_key}/"

      body = case @action
             when :list_groups then
               body_list_groups
             when :list_namespaces then
               body_list_namespaces
             when :get then
               body_get
             when :add then
               body_add
             when :remove then
               body_remove
             else
               raise_action_key_error
             end

      head + body
    end

    def raise_action_key_error
      fail ArgumentError.new(
        object: self,
        message: 'ChannelRegistration requires proper :action key'
      ), 'ChannelRegistration requires proper :action key'
    end

    def body_list_groups
      [
        'channel-group'
      ].join('/')
    end

    def body_list_namespaces
      [
        'namespace'
      ].join('/')
    end

    def body_get
      [
        ('namespace' unless @namespace_id.blank?),
        @namespace_id,
        'channel-group',
        @group_id
      ].delete_if(&:blank?).join('/')
    end

    def body_add
      [
        ('namespace' unless @namespace_id.blank?),
        @namespace_id,
        'channel-group',
        @group_id
      ].delete_if(&:blank?).join('/')
    end

    def body_remove
      [
        ('namespace' unless @namespace_id.blank?),
        @namespace_id,
        ('channel-group' unless @group_id.blank?),
        @group_id,
        ('remove' if @channel.blank?)
      ].delete_if(&:blank?).join('/')
    end

    def format_envelopes(response, request)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

      if error
        error_envelope(parsed_response, error, request: request, response: response)
      else
        valid_envelope(parsed_response, request: request, response: response)
      end
    end

    def valid_envelope(parsed_response, req_res_objects)
      # {"status"=>200, "message"=>"OK", "service"=>"channel-registry", "error"=>false}
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects [:response].code,
          operation: define_operation,
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
        },

        result: {
          data: parsed_response['payload'],
          code: req_res_objects[:response].code,
          operation: define_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response]
        }
      )
    end

    def error_envelope(parsed_response, error, req_res_objects)
      Pubnub::ErrorEnvelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: nil,
          status: {
              code: req_res_objects[:response].code,
              operation: define_operation,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: nil,
              category: (error ? Pubnub::Constants::STATUS_NON_JSON_RESPONSE : Pubnub::Constants::STATUS_ERROR),
              error: true,
              auto_retried: false,

              current_timetoken: nil,
              last_timetoken: nil,
              subscribed_channels: nil,
              subscribed_channel_groups: nil,

              config: get_config
          }
      )
    end

    def define_operation
      case @action
      when :add
        Pubnub::Constants::OPERATION_CHANNEL_GROUP_ADD
      when :remove
        Pubnub::Constants::OPERATION_CHANNEL_GROUP_REMOVE
      when :get
        Pubnub::Constants::OPERATION_LIST_ALL_CHANNELS_IN_CHANNEL_GROUP
      when :list_groups
        Pubnub::Constants::OPERATION_LIST_ALL_CHANNEL_GROUPS
      end
    end
  end
end
