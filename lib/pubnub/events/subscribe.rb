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

  end
end