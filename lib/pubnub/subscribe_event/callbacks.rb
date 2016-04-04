# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds methods connectend with callback calling
    module Callbacks
      private

      def setup_cb_pools
        @g_cb_pool ||= {} # group
        @c_cb_pool ||= {} # channel
        @wc_cb_pool ||= {} # wildcard
      end

      def fire_callbacks(envelopes)
        if @http_sync
          super
        else
          Pubnub.logger.debug('Pubnub') { "Firing callbacks for #{self.class}" }
          fire_async_callbacks(envelopes)
        end
        envelopes
      end

      def fire_async_callbacks(envelopes)
        binding.pry

        envelopes.each do |envelope|
          try_group_cb(envelope)
          try_wildcard_presence_cb(envelope)
          try_wildcard_cb(envelope)
          try_normal_cb(envelope)
        end
      end

      def try_group_cb(envelope)
        return unless envelope.group && @g_cb_pool[envelope.group]
        secure_call(@g_cb_pool[envelope.group], envelope)
      end

      def try_wildcard_presence_cb(envelope)
        return unless envelope.wildcard_channel && envelope.channel.index('-pnpres')
        secure_call(@wc_cb_pool[envelope.wildcard_channel + '-pnpres'], envelope)
      end

      def try_wildcard_cb(envelope)
        return unless envelope.wildcard_channel && !envelope.channel.index('-pnpres')
        secure_call(@wc_cb_pool[envelope.wildcard_channel], envelope)
      end

      def try_normal_cb(envelope)
        secure_call(@c_cb_pool[envelope.channel], envelope)
      end

      def add_channel_cb_to_cb_pools
        @channel.each do |channel|
          @c_cb_pool[channel] = @callback
        end
      end

      def add_group_cb_to_cb_pools
        @group.each do |group|
          @g_cb_pool[group] = @callback
        end
      end

      def add_wc_channel_cb_to_cb_pools
        @wildcard_channel.each do |wc|
          @wc_cb_pool[wc] = @callback
          @wc_cb_pool[wc + '-pnpres'] = @presence_callback
        end
      end
    end
  end
end
