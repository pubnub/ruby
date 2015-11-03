# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds generator for all events
    module Events
      EVENTS = %w(publish subscribe presence leave history here_now audit grant
                  revoke time heartbeat where_now set_state state channel_registration)

      EVENTS.each do |event_name|
        define_method event_name do |options = {}, &block|
          options[:callback] = block if options[:callback].nil?
          event = Pubnub.const_get(
            Formatter.classify_method(event_name)
          ).new(options, self)

          if options[:http_sync]
            event.fire
          elsif event.is_a? SubscribeEvent
            @subscriber.add_subscription(event)
            @subscriber.reset
          else
            event.future.fire
          end
        end
      end
    end
  end
end
