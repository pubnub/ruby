# Toplevel Pubnub module.
module Pubnub
  # Module that holds subscriber logic
  class Subscriber
    attr_reader :channels, :groups, :wildcard_channels, :callbacks, :current_subscription_id, :current_subscription
    attr_accessor :ssl

    def initialize(app)
      @app = app
      @channels = []
      @groups = []
      @wildcard_channels = []
      @callbacks = { channels: {}, groups: {}, wildcard_channels: {} }
    end

    def add_subscription(event)
      @ssl = event.ssl
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Adding subscription to Subscriber' }
      add_channels event
      add_groups event
      add_wildcard_channels event
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Added subscription to Subscriber' }
    end

    def remove_subscription(event)
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removing subscription from Subscriber' }
      remove_channels event
      remove_groups event
      remove_wildcard_channels event
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removed subscription from Subscriber' }
    end

    def reset
      remove_current_subscription
      return if @channels.empty? && @groups.empty? && @wildcard_channels.empty?
      build_subscription
      start_subscription
    end

    private

    def add_channels(event)
      @channels += event.channel
      @callbacks[:channels].merge! event.c_cb_pool
    end

    def add_groups(event)
      @groups += event.group
      @callbacks[:groups].merge! event.g_cb_pool
    end

    def add_wildcard_channels(event)
      @wildcard_channels += event.wildcard_channel
      @callbacks[:wildcard_channels].merge! event.wc_cb_pool
    end

    def remove_channels(event)
      @channels -= event.channel
      event.channel.each { |channel| @callbacks[:channels].delete_if { |k, _v| k.to_sym == channel.to_sym } }
    end

    def remove_groups(event)
      @groups -= event.group
      event.group.each { |group| @callbacks[:groups].delete_if { |k, _v| k.to_sym == group.to_sym } }
    end

    def remove_wildcard_channels(event)
      @wildcard_channels -= event.wildcard_channel
      event.wildcard_channel.each do |_wildcard_channel|
        @callbacks[:wildcard_channels].delete_if { |k, _v| k.to_sym == wildcard_channels.to_sym }
      end
    end

    def build_subscription
      @current_subscription = Subscribe.new({ ssl: @ssl }, @app)
      @current_subscription_id = @current_subscription.bare_object.object_id
      @current_subscription.build(callbacks: @callbacks,
                                  channels: @channels,
                                  groups: @groups,
                                  wildcard_channels: @wildcard_channels)
    end

    def remove_current_subscription
      return if @current_subscription_id.nil?
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removing current subscription' }
      @current_subscription.async.terminate
      @current_subscription    = nil
      @current_subscription_id = nil
      @app.timetoken = nil
    end

    def start_subscription
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Starting subscription' }
      fail 'Cannot start subscription without builded @current_subscription' if @current_subscription.nil?
      @current_subscription.future.fire
    end
  end
end
