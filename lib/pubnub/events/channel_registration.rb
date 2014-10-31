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

    def format_group
      @namespace_id, @group_id = @group.split(':')
    end

    def parameters(app)
      parameters = super(app)
      parameters.merge!({cloak:  @cloak})             if @cloak
      parameters.merge!({add:    @channel.join(',')}) if @action == :add    && @channel
      parameters.merge!({remove: @channel.join(',')}) if @action == :remove && @channel
      parameters
    end

    def path(app)

      # Per Sub-key/namespace channel registration

      # # Get all namespaces
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace
      # OK

      # # Get all channel group names
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group
      # OK

      # # Get all channels for a given channel group
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>
      # OK

      # # Set the source cloak flag (defaults to True)
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>?cloak=[True|False|1|0]
      # OK

      # # Add channel(s) to group
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>?add=ch1,ch2
      # OK

      # # Can add channels and set source cloak flag simultaneously
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>?add=ch1,ch2&cloak=False
      # OK

      # # Remove channel(s) from group
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>?remove=ch1,ch2
      # OK

      # # Remove group (and all channels)
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/channel-group/<group_name>/remove
      # OK

      # # Remove namespace (and all group names and all channels)
      # GET /v1/channel-registration/sub-key/<sub_key>/namespace/<namespace_id>/remove
      # OK

      # Per Sub-key channel registration

      # # Get all channel group names
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group
      # OK

      # # Get all channels for a group
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group/<group_name>
      # OK

      # # Set the source cloak flag (defaults to True)
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group/<group_name>?cloak=[True|False|1|0]
      # OK

      # # Add channel(s) to a group
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group/<group_name>?add=ch1,ch2
      # OK

      # # Remove channel(s) from a group
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group/<group_name>?remove=ch1,ch2
      # OK

      # # Remove a group (and all channels)
      # GET /v1/channel-registration/sub-key/<sub_key>/channel-group/<group_name>/remove
      # OK

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
              ('remove' if @channel.nil?)
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
