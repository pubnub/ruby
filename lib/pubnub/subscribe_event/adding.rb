# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds methods connected with channels and cg adding
    module Adding
      def add_groups(event)
        event.group.each do |group|
          add_group group
          add_g_cb group, event.callback
        end
      end

      def add_channels(event)
        event.channel.each do |channel|
          add_channel channel
          add_c_cb channel, event.callback
        end
      end

      def add(event)
        Pubnub.logger.debug('Pubnub') { "#{self.class}#add" }
        @app.kill_request_dispatcher(@origin, :subscribe_event)

        add_channels(event)
        add_groups(event)

        restart_heartbeat if @heart
      end

      private

      def add_g_cb(group, cb)
        @g_cb_pool[group] = cb
      end

      def add_c_cb(channel, cb)
        @c_cb_pool[channel] = cb
      end

      def add_group(group)
        @group << group
      end

      def add_channel(channel)
        @channel << channel
      end
    end
  end
end
