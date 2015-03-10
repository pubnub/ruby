# Toplevel Pubnub module
module Pubnub
  class SubscribeEvent < Event
    # Holds methods connected with channels and cg removal
    module Removing
      def remove_groups(event)
        event.group.each do |group|
          remove_group group
          remove_g_cb group
        end
      end

      def remove_channels(event)
        event.channel.each do |channel|
          remove_channel channel
          remove_c_cb channel
        end
      end

      def remove(event)
        Pubnub.logger.debug('Pubnub') { "#{self.class}#remove" }
        kill_requester

        remove_channels(event)
        remove_groups(event)

        if @channel.empty? && @group.empty?
          finish
        else
          restart_heartbeat if @heart
        end
      end

      private

      def kill_requester
        @app.kill_requester(@origin, :subscribe_event)
      end

      def remove_g_cb(group)
        @g_cb_pool[group] = nil
      end

      def remove_c_cb(channel)
        @c_cb_pool[channel] = nil
        @e_cb_pool[channel] = nil
      end

      def remove_group(group)
        @group.delete(group)
      end

      def remove_channel(channel)
        @channel.delete(channel)
      end

      def finish
        Pubnub.logger.debug('Pubnub') { 'Stopping subscription' }
        stop_heartbeat if @heart
        kill_requester
        @finalized = true
        @app.env[:subscription_pool][@origin] = nil
        terminate
      end
    end
  end
end
