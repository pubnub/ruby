module Pubnub
  class WhereNow
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      @uuid_looking_for = options[:uuid]
      @uuid = app.uuid
      @event = 'where_now'
      super
    end

    def validate!
      super

      # check uuid
      raise ArgumentError.new(:object => self, :message => 'where_now requires :uuid argument') unless @uuid_looking_for
    end

    private

    def path(app)
      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'uuid',
          @uuid_looking_for
      ].join('/')
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
