module Pubnub
  class Subscribe
    include Pubnub::Event
    include Pubnub::SubscribeEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @event = 'subscribe'
      @allow_multiple_channels = true

    end

    def validate!
      super
      # Check channels
      raise ArgumentError.new(:object => self), 'Subscribe requires :channel or :channels argument' unless @channel

      # check callback
      raise ArgumentError.new(:object => self), 'Callback parameter is required while using async subscribe' if !@http_sync && @callback.blank?

    end

    private

    def path(app)
      path = URI.escape("/subscribe/#{@subscribe_key}/#{channels_for_url(@channel)}/0/#{@timetoken}").gsub(/\?/,'%3F')
    end

    def timetoken(parsed_response)
      parsed_response[1] if parsed_response.is_a? Array
    end

    def format_envelopes(response, app, error)

      $logger.debug('Subscribe#format_envelopes')

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      $logger.debug('Subscribe#format_envelopes | Response parsed')

      envelopes = Array.new
      if error
        $logger.debug('Subscribe#format_envelopes | Error')
        envelopes << Envelope.new(
            {
                :channel           => @channel,
                :timetoken         => timetoken(parsed_response)
            },
            app
        )
      elsif parsed_response[0].empty? && parsed_response.flatten.size == 1
        $logger.debug('Subscribe#format_envelopes | Timetoken')
        envelopes << Envelope.new(
            {
                :channel           => @channel.first,
                :response_message  => parsed_response,
                :timetoken         => timetoken(parsed_response),
                :timetoken_update  => true
            },
            app
        )
      else
        $logger.debug('Subscribe#format_envelopes | Not timetoken update')
        parsed_response[0].size.times do |i|
          if parsed_response[2].is_a? Array
            channel = parsed_response[2][i]
          else
            channel = @channel.first
          end
          $logger.debug('Subscribe#format_envelopes | Channel created')

          $logger.debug("#{parsed_response}")

          envelopes << Envelope.new(
              {
                  :message           => parsed_response.first[i],
                  :channel           => channel,
                  :response_message  => parsed_response,
                  :timetoken         => timetoken(parsed_response)
              },
              app
          )

          $logger.debug('Subscribe#format_envelopes | Envelopes created')

        end
      end

      $logger.debug('Subscribe#format_envelopes | envelopes created')

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end