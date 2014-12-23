# Toplevel Pubnub module
module Pubnub
  # Holds channel_registration functionality
  class ChannelRegistration
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent

    def initialize(options, app)
      @group  = options[:group]
      @action = options[:action]
      # @cloak  = options[:cloak]
      super

      @channel = nil if @channel.size == 1 && @channel.first.empty?
      format_group if @group
    end

    private

    def format_group
      if @group.to_s.count(':') > 0
        @namespace_id, @group_id = @group.to_s.split(':')
      else
        @namespace_id = nil
        @group_id     = @group.to_s
      end
    end

    def parameters
      parameters = super
      # parameters.merge!({cloak:  @cloak})             if @cloak
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
      body = ''
      case @action
      when :list_groups
        body << [
          'channel-group'
        ].join('/')
      when :list_namespaces
        body << [
          'namespace'
        ].join('/')

      when :get
        body << [
          ('namespace' unless @namespace_id.blank?),
          @namespace_id,
          'channel-group',
          @group_id
        ].delete_if(&:blank?).join('/')

      when :add
        body << [
          ('namespace' unless @namespace_id.blank?),
          @namespace_id,
          'channel-group',
          @group_id
        ].delete_if(&:blank?).join('/')

      when :remove
        body << [
          ('namespace' unless @namespace_id.blank?),
          @namespace_id,
          ('channel-group' unless @group_id.blank?),
          @group_id,
          ('remove' if @channel.blank?)
        ].delete_if(&:blank?).join('/')

      when :set_cloak
        body << [
          ('namespace' unless @namespace_id.blank?),
          @namespace_id,
          'channel-group',
          @group_id
        ].delete_if(&:blank?).join('/')

      else
        fail ArgumentError.new(
               object: self,
               message: 'ChannelRegistration requires proper :action key'
            ), 'ChannelRegistration requires proper :action key'
      end

      head + body
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
