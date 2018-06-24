# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds SubscribeEvent functionality connected with heartbeat
    module Heartbeat
      private

      def restart_heartbeat
        stop_heartbeat
        consider_heartbeat
      end

      def stop_heartbeat
        Pubnub.logger.debug('Pubnub') { "#{self.class}#stop_heartbeat" }

        Concurrent::Actor.kill(@heart) if @heart
        @heart = nil
      end

      def consider_heartbeat
        return unless @heartbeat && !@http_sync && !@heart

        Pubnub.logger.debug('Pubnub') { "#{self.class}#fire_heartbeat" }

        @heart = Heart.new(app: @app, heartbeat: @heartbeat, channel: @channel)
        @heart.async.start_beating
      end
    end
  end
end
