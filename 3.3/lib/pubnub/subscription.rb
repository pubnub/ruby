module Pubnub
  class Subscription
    @@channels            = Array.new
    @@instances_collector = Array.new

    attr_accessor :channels, :callback

    def initialize(options, &block)

      @@instances_collector << self
      @channels = options[:channel].split(',')
      @callback = options[:callback]
      @callback = block if block_given?
      add_self_to_subscription
    end

    def ==(other)
      (@channels == other.get_channels && @callback == other.callback)
    end

    def get_channels
      @channels
    end

    def self.get_channels
      @@channels
    end

    def is_subscribed_to?(channel)
      @channels.include?(channel)
    end

    def self.is_subscribed_to?(channel)
      @@channels.include?(channel)
    end

    def add_self_to_subscription
      @channels.each do |channel|
       @@channels << channel unless Subscription.is_subscribed_to? channel
      end
    end

    def remove_from_subscription(channel)
      @channels.delete_if{|c| c == channel}
    end

    def self.remove_from_subscription(channel)
      puts 'one'
      if Subscription.is_subscribed_to? channel
        puts 'two'
        @@channels.delete_if{|c| c == channel}
      end
      puts 'three'
      Subscription.clean_subscriptions channel
      puts 'eleven'
    end

    def self.channels_for_url
      @@channels.join(',')
    end

    def self.all_offspring
      @@instances_collector
    end

    def self.fire_callbacks_for(envelope)
      Subscription.all_offspring.each do |subscription|
        subscription.callback.call(envelope) if subscription.is_subscribed_to? envelope.channel
      end
    end

    def self.clean_subscriptions(channel)
      puts 'five'
      @@instances_collector.each do |subscription|
        puts 'six'
        subscription.remove_from_subscription channel
      end
      puts 'seven'
      @@instances_collector.delete_if{ |subscription| subscription.get_channels.empty? }
      puts 'eight'
    end
  end
end