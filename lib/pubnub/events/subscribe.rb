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
      @state = options[:state]

    end

    def fire(app)
      app.update_timetoken(0)
      add_state(@state, app) if @state
      super
    end

    def validate!
      super
      # Check channels
      # raise ArgumentError.new(:object => self, :message => 'Subscribe requires :channel, :channels or :channel_group argument') unless @channel || @channel_group
      #
      # # Check callback
      # raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async subscribe') if !@http_sync && @callback.blank?

    end

    private

    def add_state(state, app)
      app.env[:state]          = {} unless app.env[:state]
      app.env[:state][@origin] = {} unless app.env[:state][@origin]
      app.env[:state][@origin][@channel] = state
    end
  end
end
