module Pubnub
  class ChannelRegistration
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      @group  = options[:group]
      @action = options[:action]
      @cloak  = options[:cloak]
      super

      @channel = nil if @channel.size == 1 && @channel.first.empty?
      format_group if @group

      @event = 'channel_registration'
    end

    private

    def validate!
      # Callback
      raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async channel_registration') if !@http_sync && @callback.blank?

      # Channel group
      if @channel_group.class == Array
        @channel_group.each do |cg|
          # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if cg.count(':') != 1
        end
      elsif !@channel_group.blank?
        number_of_groups = @channel_group.to_s.split(',').size # In case it will be given as csv
        # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.to_s.count(':') != number_of_groups
      end
    end

    def format_group
      if @group.to_s.count(':') > 0
        @namespace_id, @group_id = @group.to_s.split(':')
      else
        @namespace_id = nil
        @group_id     = @group.to_s
      end
    end

    def parameters(app)
      parameters = super(app)
      parameters.merge!({cloak:  @cloak})             if @cloak
      parameters.merge!({add:    @channel.join(',')}) if @action == :add    && !@channel.blank?
      parameters.merge!({remove: @channel.join(',')}) if @action == :remove && !@channel.blank?
      parameters
    end

    def path(app)
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
          ].delete_if { |e| e.blank? }.join('/')

        when :add
          body << [
              ('namespace' unless @namespace_id.blank?),
              @namespace_id,
              'channel-group',
              @group_id
          ].delete_if { |e| e.blank? }.join('/')

        when :remove
          body << [
              ('namespace' unless @namespace_id.blank?),
              @namespace_id,
              ('channel-group' unless @group_id.blank?),
              @group_id,
              ('remove' if @channel.blank?)
          ].delete_if { |e| e.blank? }.join('/')

        when :set_cloak
          body << [
              ('namespace' unless @namespace_id.blank?),
              @namespace_id,
              'channel-group',
              @group_id
          ].delete_if { |e| e.blank? }.join('/')

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
