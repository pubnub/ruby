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

      @wildcard_channel = @channel.select{ |e| e.index('.') } || []
      @channel -= @wildcard_channel
    end

    def fire(app)
      app.update_timetoken(0)
      add_state(@state, app) if @state
      super
    end

    def validate!
      super
      # Check channels
      raise ArgumentError.new(:object => self, :message => 'Subscribe requires :channel, :channels or :group argument') if @channel.blank? && @channel_group.blank?

      # Check callback
      raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async subscribe') if !@http_sync && @callback.blank?

      # Channel group
      if @channel_group.class == Array
        @channel_group.each do |cg|
          # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if cg.count(':') != 1
        end
      elsif !@channel_group.blank?
        number_of_groups = @channel_group.to_s.split(',').size # In case it will be given as csv
        # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.to_s.count(':') != number_of_groups
      end
    end

    private

    def add_state(state, app)
      app.env[:state]          = {} unless app.env[:state]
      app.env[:state][@origin] = {} unless app.env[:state][@origin]
      @channel.each do |channel|
        app.env[:state][@origin][channel] = state
      end
      @channel_group.each do |channel_group|
        app.env[:state][@origin][channel_group] = state
      end
    end
  end
end
