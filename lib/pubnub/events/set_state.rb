module Pubnub
  class SetState
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super
      @state = options[:state]

      app.env[:state] = Hash.new          if app.env[:state].nil?
      app.env[:state][@origin] = Hash.new if app.env[:state][@origin].nil?
      @channel.each do |channel|
        app.env[:state][@origin][channel.to_s] = @state
      end

      @allow_multiple_channels = true
      @event = 'set_state'
    end

    def validate!
      super
      # check state
      raise 'You can set state only as hash' unless (@state.is_a?(Hash) || @state.is_a?(NilClass))

      # check channel/channels
      # raise ArgumentError.new(:object => self, :message => 'SetState requires :channel or :channels argument') unless @channel
      # raise ArgumentError.new(:object => self, :message => 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both') unless valid_channel?
    end

    private

    def parameters(app)
      parameters = super(app)
      parameters.merge!({ :state => encode_state(@state)})
      parameters.merge!({ :channel_group => format_channel_group(@channel_group).join(',') }) unless @channel_group.blank?
      parameters
    end

    def path(app)
      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'channel',
          channels_for_url(@channel),
          'uuid',
          app.env[:uuid],
          'data'
      ].join('/')
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new({
          :parsed_response => parsed_response,
          :payload => (parsed_response['payload'] if parsed_response),
          :service => (parsed_response['service'] if parsed_response),
          :message => (parsed_response['message'] if parsed_response),
          :status  => (parsed_response['status']  if parsed_response)
      }, app)

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end
  end
end
