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
      raise ArgumentError.new(:object => self, :message => 'Subscribe requires :channel or :channels argument') unless @channel

      # Check callback
      raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async subscribe') if !@http_sync && @callback.blank?

    end

    private

    def add_state(state, app)
      state.each do |k,v|
        app.set_state(v,k,@origin)
      end
    end
  end
end