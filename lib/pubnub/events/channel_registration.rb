# Toplevel Pubnub module.
module Pubnub
  # Holds channel_registration functionality
  class ChannelRegistration < SingleEvent
    include Celluloid

    private

    def parameters
      parameters = super
      if @action == :add    && !@channel.blank?
        parameters.merge!(add:    @channel.join(','))
      end

      if @action == :remove && !@channel.blank?
        parameters.merge!(remove: @channel.join(','))
      end

      parameters
    end

    def path
      head = "/v1/channel-registration/sub-key/#{@subscribe_key}/"

      body = case @action
             when :list_groups then body_list_groups
             when :list_namespaces then body_list_namespaces
             when :get then body_get
             when :add then body_add
             when :remove then body_remove
             else raise_action_key_error
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

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code != '200'

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    [valid_envelope(parsed_response)]
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def valid_envelope(parsed_response)
      Envelope.new(
          parsed_response: parsed_response,
          payload: parsed_response['payload'],
          service: parsed_response['service'],
          message: parsed_response['message'],
          status:  parsed_response['status'],
          error:   parsed_response['error']
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: response_message(parsed_response)
      )
    end
  end
end
