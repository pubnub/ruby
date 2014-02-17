module Pubnub
  class Publish
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @channel = @channel.first
      @event = 'publish'
      @allow_multiple_channels = false

    end

    def validate!
      super
      # check message
      raise ArgumentError.new(:object => self), 'Publish requires :message argument' unless @message

      # check channel/channels
      raise ArgumentError.new(:object => self), 'Publish requires :channel or :channels argument' unless @channel
      raise ArgumentError.new(:object => self), 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both' unless valid_channel?
    end

    private

    def path(app)
      '/' + [
          'publish',
          @publish_key,
          @subscribe_key,
          if !@auth_key.blank? then @secret_key else '0' end,
          @channel,
          '0',
          format_message(@message)
      ].join('/')
    end

    def timetoken(parsed_response)
      parsed_response[2] if parsed_response.is_a? Array
    end

    def response_message(parsed_response)
      parsed_response[1] if parsed_response.is_a? Array
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
        {
            :message           => @message,
            :published_message => @message,
            :channel           => @channel,
            :response_message  => response_message(parsed_response),
            :timetoken         => timetoken(parsed_response)
        },
        app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end