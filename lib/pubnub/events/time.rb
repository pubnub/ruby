module Pubnub
  class Time
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super
      @channel = @channel.first
      @event = 'time'
      @doesnt_require_callback = true
    end

    def validate!
      super
      # check callback
      raise ArgumentError.new(:object => self), 'Callback parameter is required while using async time' if !@http_sync && @callback.blank?

    end

    private

    def path(app)
      '/time/0'
    end

    def timetoken(parsed_response)
      parsed_response.first if parsed_response.is_a? Array
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :message           => timetoken(parsed_response),
              :response_message  => timetoken(parsed_response),
              :timetoken         => timetoken(parsed_response)
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

  end
end