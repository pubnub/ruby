module Pubnub
  class Subscription
    attr_accessor :channel, :callback

    def initialize(options)

      @channel = options[:channel]
      @callback = options[:callback]
    end

    def fire_callback_for(envelope)
      $log.debug "CALLING SUBSCRIPTION CALLBACK FOR CHANNEL #{@channel}" if envelope.channel == @channel

      @callback.call envelope if envelope.channel == @channel
      $log.debug "AFTER CALLING SUBSCRIPTION CALLBACK FOR CHANNEL #{@channel}"

    end

    def ==(other)
      (@channel == other.get_channel && @callback == other.callback && @error_callback == other.error_callback)
    end

    def get_channel
      @channel
    end
  end
end