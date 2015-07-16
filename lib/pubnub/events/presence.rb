module Pubnub
  class Presence
    include Pubnub::Event
    include Pubnub::SubscribeEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @channel       = @channel.map       {|c| c + '-pnpres'}
      @channel_group = @channel_group.map {|c| c + '-pnpres'}
      @event = 'presence'
      @allow_multiple_channels = true
      @wildcard_channel = @channel.select{ |e| e.index('.') } || []
      @channel -= @wildcard_channel
    end

    def fire(app)
      app.update_timetoken(0)
      super
    end

    def validate!
      super

      # Check channels
      # raise ArgumentError.new(:object => self, :message => 'Presence requires :channel, :channels or :channel_group argument')               unless @channel || @channel_group
      # raise ArgumentError.new(:object => self, :message => 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both') unless valid_channel?

    end

    private


  end
end
