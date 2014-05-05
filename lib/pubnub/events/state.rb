module Pubnub
  class State
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super
      raise ArgumentError.new(:object => self, :message => 'State requires :uuid argument') if options[:uuid].blank?

      @uuid_looking_for = options[:uuid]
      @uuid = app.uuid
    end

    def validate!
      super

      # check channel/channels
      raise ArgumentError.new(:object => self, :message => 'State requires :channel argument') unless @channel
      raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String or Symbol') unless @channel.is_a?(String) or @channel.is_a?(Symbol)
    end

    private

    def path(app)
      '/' + [
          'v2',
          'presence',
          'sub_key',
          @subscribe_key,
          'channel',
          @channel,
          'uuid',
          @uuid_looking_for
      ].join('/')
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
        {
            :channel => @channel,
            :payload => response[:payload]      
        },
        app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end