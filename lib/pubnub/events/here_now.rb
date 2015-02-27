module Pubnub
  class HereNow
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super
      @channel = @channel.first
      @allow_multiple_channels = false
      @event = 'here_now'
    end

    def validate!
      super

      # check channel
      raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String, Symbol')       unless [String, Symbol, NilClass].include?(@channel.class)

      unless @channel_group.blank?
        # check channel_group
        raise ArgumentError.new(:object => self, :message => 'Invalid channel group format! Should be type of: String, Symbol') unless [String, Symbol, NilClass].include?(@channel_group.class)

        # check channel_group
        # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.count(':') != 1
      end
    end

    private

    def path(app)
      unless @channel.blank?
        '/' + [
            'v2',
            'presence',
            'sub-key',
            @subscribe_key,
            'channel',
            @channel
        ].join('/')
      else
        Pubnub.logger.debug(:pubnub){'Global here_now'}
        '/' + [
            'v2',
            'presence',
            'sub-key',
            @subscribe_key,
            ('channel' if @channel_group),
            (',' if @channel_group)
        ].join('/')
      end
    end

    def parameters(app)
      parameters = super(app)
      parameters.merge!({'channel-group' => format_channel_group(@channel_group, false).join(',')}) unless @channel_group.blank?
      parameters
    end

    def format_envelopes(response, app, error)
      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :parsed_response => parsed_response,
              :payload => (parsed_response['payload'] if parsed_response),
              :service => (parsed_response['service'] if parsed_response),
              :message => (parsed_response['message'] if parsed_response),
              :status  => (parsed_response['status']  if parsed_response)
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes
    end
  end
end
