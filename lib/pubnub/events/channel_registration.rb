module Pubnub
  class ChannelRegistration
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      @namespace = options[:namespace]
      @group     = options[:group]
      @channel   = options[:channel]
      @action    = options[:action]
      @cloak     = options[:cloak]
      super

      # We need to set empty channel [""] as nil
      @channel.delete_if(&:blank?)
      @channel = nil if @channel.blank?

      @allow_multiple_channels = true
      @event = 'channel_registration'
    end

    def validate!
      super
      # Possible combination
      # [:get] -> # Get all namespaces
      # [namespace, :get] -> # Get all channel group names
      # [namespace, group, :get] -> Get all channels for a given channel group
      # [namespace, group, channels, :add] -> Add channel(s) to group
      # [namespace, group, channels, :remove] -> Remove channel(s) from group
      # [namespace, group, :remove] -> Remove group (and all channels)
      # [namespace, :remove] -> Remove namespace (and all group names and all channels)

      case @action
        when :namespaces

        when :groups

        when :get
          if !@channel.blank? || (@namespace.blank? || !@group.blank?) || !@cloak.blank?
            fail ArgumentError.new(:object => self, :message => 'Given options for ChannelRegistration:get are invalid'), 'Given options for ChannelRegistration:get are invalid'
          end

        when :add
          if @namespace.blank? || @group.blank? || @channel.blank?
            fail ArgumentError.new(:object => self, :message => 'Given options for ChannelRegistration:add are invalid'), 'Given options for ChannelRegistration:add are invalid'
          end

        when :remove
          if !@cloak.blank? || @namespace.blank? || (!@channel.blank? && @group.blank?)
            fail ArgumentError.new(:object => self, :message => 'Given options for ChannelRegistration:remove are invalid'), 'Given options for ChannelRegistration:add are invalid'
          end

        when :set_cloak
          if @cloak.blank? || @namespace.blank? || @group.blank? || !@channel
            fail ArgumentError.new(:object => self, :message => 'Given options for ChannelRegistration:remove are invalid'), 'Given options for ChannelRegistration:remove are invalid'
          end

        else
          fail ArgumentError.new(:object => self, :message => 'ChannelRegistration requires proper :action key'), 'ChannelRegistration requires proper :action key'

      end

    end

    private

    def parameters(app)
      parameters = super(app)
      parameters.merge!({cloak:  @cloak})   if @cloak
      parameters.merge!({add:    @channel}) if @action == :add    && @channel
      parameters.merge!({remove: @channel}) if @action == :remove && @channel
      parameters
    end

    def path(app)
      head = "/v1/channel-registration/sub-key/#{@subscribe_key}/"
      body = ''
      case @action
        when :namespaces

        when :groups

        when :get
          body << [
            ('namespace' if @namespace),
            @namespace,
            ('channel-group' if (@namespace || @group)),
            @group
          ].delete_if(&:blank?).join('/')
        when :add
          body << [

          ].join('/')
        when :remove
          body << [].join('/')
        when :set_cloak
          body << [].join('/')
        else
          fail ArgumentError.new(:object => self, :message => 'ChannelRegistration requires proper :action key'), 'ChannelRegistration requires proper :action key'
      end

      head + body
    end


    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new({
                                    :parsed_response => parsed_response,
                                    :payload => (parsed_response['payload'] if parsed_response),
                                    :service => (parsed_response['service'] if parsed_response),
                                    :message => (parsed_response['message'] if parsed_response),
                                    :status  => (parsed_response['status']  if parsed_response),
                                    :error   => (parsed_response['error']   if parsed_response)
                                }, app)

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end
  end
end
