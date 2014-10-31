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
      parameters.merge!({:state => encode_state(app.env[:state][@origin])}) if app.env[:state] && app.env[:state][@origin]
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