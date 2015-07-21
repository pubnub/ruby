# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds generator for all events
    module Events
      EVENTS = %w(publish subscribe presence leave history here_now audit grant
                  revoke time heartbeat where_now state channel_registration)

      # Require events classes and dynamically define methods for them
      EVENTS.each do |event_name|
        require File.join(
                  'lib',
                  'pubnub',
                  'events',
                  event_name
                )

        define_method event_name do |options = {}, &block|
          options[:callback] = block if options[:callback].nil?
          event = Pubnub.const_get(
              Formatter.classify_method(event_name)
          ).new(options, self)

          if options[:http_sync]
            event.fire
          elsif event.is_a? SubscribeEvent
            if @env[:subscription_pool][event.origin].nil?
              Pubnub.logger.debug('Pubnub') { 'First subscription' }
              @env[:subscription_pool][event.origin] = event
              event.future.fire
            else
              Pubnub.logger.debug('Pubnub') { 'Subscription already running' }
              @env[:subscription_pool][event.origin].add(event)
              @env[:subscription_pool][event.origin].future.fire
              event.terminate
            end
          else
            event.future.fire
          end
        end
      end
    end
  end
end
