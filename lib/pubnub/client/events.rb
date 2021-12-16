# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds generator for all events
    module Events
      EVENTS = %w[publish subscribe presence leave history here_now audit grant grant_token revoke_token delete_messages
                  revoke time heartbeat where_now set_state state channel_registration message_counts signal
                  add_channels_to_push list_push_provisions remove_channels_from_push remove_device_from_push
                  set_uuid_metadata set_channel_metadata remove_uuid_metadata remove_channel_metadata
                  get_uuid_metadata get_all_uuid_metadata get_channel_metadata get_all_channels_metadata
                  get_channel_members get_memberships set_channel_members set_memberships
                  remove_memberships remove_channel_members].freeze

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
            Concurrent::Future.execute { event.fire }
          end
        end
      end

      alias unsubscribe leave
      alias get_state state

      def fire(options, &block)
        publish(options.merge(store: false, replicate: false), &block)
      end
    end
  end
end
