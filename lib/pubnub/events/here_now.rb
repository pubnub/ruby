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
      raise ArgumentError.new(:object => self, :message => 'History requires :channel argument') unless @channel
      raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String, Symbol') unless [String, Symbol].include?(@channel.class)

    end

    private

    def path(app)
      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'channel',
          @channel
      ].join('/')
    end

    def format_envelopes(response, app, error)
      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :message           => parsed_response,
              :channel           => @channel,
              :response_message  => parsed_response
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes
    end
  end
end