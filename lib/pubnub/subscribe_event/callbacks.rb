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
          fire_sync_callbacks(envelopes)
        else
          Pubnub.logger.debug('Pubnub') { "Firing callbacks for #{self.class}" }
          fire_async_callbacks(envelopes)
        end

        request_message_count_exceeded(envelopes.size, envelopes.first.status[:server_response]) if envelopes.size >= @app.env[:request_message_count_threshold] && @app.env[:request_message_count_threshold] != 0

        envelopes
      end

      def request_message_count_exceeded(_size, response)
        @app.subscriber.announce_status(announcement_type: Pubnub::Constants::STATUS_REQUEST_MESSAGE_COUNT_EXCEEDED,
                                        event: @event,
                                        given_options: @given_options,
                                        response: response,
                                        request: uri)
      end

      def fire_sync_callbacks(envelopes)
        envelopes.each do |envelope|
          fire_respective_callback_for envelope
        end
      end

      def fire_respective_callback_for(envelope)
        if !envelope.is_a?(ErrorEnvelope) && envelope.result[:data] && !envelope.result[:data][:subscribed_channel].index('*') && envelope.result[:data][:actual_channel].index('-pnpres') && @presence_callback
          secure_call @presence_callback, envelope
        else
          secure_call @callback, envelope
        end
      end

      def fire_async_callbacks(envelopes)
        @app.subscriber.fire_async_callbacks(envelopes)
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
