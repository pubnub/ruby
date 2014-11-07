module Pubnub
  class Heartbeat
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super
      @event = 'heartbeat'
      @allow_multiple_channels = true
      @doesnt_require_callback = true
    end

    def fire(app)
      super
    end

    private

    def validate!
      super
      # Check channels
      raise ArgumentError.new(:object => self, :message => 'Heartbeat requires :channel, :channels or :group argument') if @channel.blank? && @channel_group.blank?

      # Check callback
      raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async heartbeat') if !@http_sync && @callback.blank?

      # Channel group
      if @channel_group.class == Array
        @channel_group.each do |cg|
          raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if cg.count(':') != 1
        end
      elsif !@channel_group.blank?
        number_of_groups = @channel_group.to_s.split(',').size # In case it will be given as csv
        raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.to_s.count(':') != number_of_groups
      end
    end

    def path(app)
      if @channel == [''] || @channel.blank?
        channel = [',']
      else
        channel = @channel
      end

      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'channel',
          channel.join(','),
          'heartbeat'
      ].join('/')
    end

    def parameters(app)
      parameters = super(app)
      parameters.merge!({:state => encode_state(app.env[:state][@origin])})                        if app.env[:state] && app.env[:state][@origin]
      parameters.merge!({:heartbeat => app.env[:heartbeat]})                                       if app.env[:heartbeat]
      parameters.merge!({'channel-group' => format_channel_group(@channel_group, true).join(',')}) unless @channel_group.blank?
      parameters
    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :message           => parsed_response,
              :response_message  => parsed_response
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

  end
end