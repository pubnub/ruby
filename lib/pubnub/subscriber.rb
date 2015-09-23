# Toplevel Pubnub module.
module Pubnub
  class Subscriber
    attr_reader :channels, :groups, :wildcard_channels, :callbacks, :current_subscription_id, :current_subscription
    attr_accessor :ssl

    def initialize(app)
      @app = app
      @channels, @groups, @wildcard_channels = [], [], []
      @callbacks = {channels: {}, groups: {}, wildcard_channels: {}}
    end

    def add_subscription(event)
      @ssl = event.ssl

      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Adding subscription to Subscriber' }
      @channels          += event.channel
      @groups            += event.group
      @wildcard_channels += event.wildcard_channel

      @callbacks[:channels].merge!          event.c_cb_pool
      @callbacks[:groups].merge!            event.g_cb_pool
      @callbacks[:wildcard_channels].merge! event.wc_cb_pool
      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Added subscription to Subscriber' }
    end

    def remove_subscription(event)
      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Removing subscription from Subscriber' }

      @channels          -= event.channel
      @groups            -= event.group
      @wildcard_channels -= event.wildcard_channel

      event.channel.each do |channel|
        @callbacks[:channels].delete_if { |k,_v| k.to_sym == channel.to_sym}
      end

      event.group.each do |group|
        @callbacks[:groups].delete_if { |k,_v| k.to_sym == group.to_sym}
      end

      event.wildcard_channel.each do |wildcard_channel|
        @callbacks[:wildcard_channels].delete_if { |k,_v| k.to_sym == wildcard_channels.to_sym}
      end
      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Removed subscription from Subscriber' }
    end

    def reset
      remove_current_subscription
      return if @channels.empty? && @groups.empty? && @wildcard_channels.empty?
      build_subscription
      start_subscription
    end

    private

    def build_subscription
      @current_subscription = Subscribe.new({ssl: @ssl}, @app)
      @current_subscription_id = @current_subscription.bare_object.object_id
      @current_subscription.build(callbacks: @callbacks,
                                  channels: @channels,
                                  groups: @groups,
                                  wildcard_channels: @wildcard_channels)
    end

    def remove_current_subscription
      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Removing current subscription' }
      return nil if @current_subscription_id.nil?
      @current_subscription.async.terminate
      @current_subscription    = nil
      @current_subscription_id = nil
      @app.timetoken = nil
    end

    def start_subscription
      Pubnub.logger.debug('Pubnub::Subscriber'){ 'Starting subscription' }
      raise 'Cannot start subscription without builded @current_subscription' if @current_subscription.nil?
      @current_subscription.future.fire
    end
  end
end