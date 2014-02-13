module Pubnub
  class Presence
    include Pubnub::Event
    include Pubnub::SubscribeEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @channel = @channel.map {|c| c + '-pnpres'}
      @event = 'presence'
      @allow_multiple_channels = true

    end

    def validate!
      super

      # Check channels
      raise ArgumentError.new(:object => self), 'Presence requires :channel or :channels argument' unless @channel
      raise ArgumentError.new(:object => self), 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both' unless valid_channel?

    end

    private

    def path(app)
      path = URI.escape("/subscribe/#{@subscribe_key}/#{channels_for_url(@channel)}/0/#{@timetoken}").gsub(/\?/,'%3F')
    end

    def timetoken(parsed_response)
      parsed_response[1] if parsed_response.is_a? Array
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      if error
        envelopes << Envelope.new(
            {
                :channel           => @channel,
                :timetoken         => timetoken(parsed_response)
            },
            app
        )
      elsif parsed_response[0].empty? && parsed_response.flatten.size == 1
        envelopes << Envelope.new(
            {
                :channel           => @channel,
                :response_message  => parsed_response,
                :timetoken         => timetoken(parsed_response),
                :timetoken_update  => true
            },
            app
        )
      else
        parsed_response[0].size.times do |i|
          if parsed_response[2].is_a? Array
            channel = parsed_response[2][i]
          else
            channel = @channel.first
          end

          envelopes << Envelope.new(
              {
                  :message           => parsed_response.first[i],
                  :channel           => channel_from_response(parsed_response),
                  :response_message  => parsed_response,
                  :timetoken         => timetoken(parsed_response)
              },
              app
          )
        end
      end

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

  end
end