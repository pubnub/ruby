# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds paged_history event logic
    module PagedHistory
      def paged_history(options = {}, &block)
        channel = options.fetch(:channel)
        page = options.fetch(:page, 1)
        limit = options.fetch(:limit, 100)
        callback = options.fetch(:callback, block)
        sync = options[:http_sync]
        start_tt = options.fetch(:start)
        end_tt = options.fetch(:end)
      if sync
          sync_paged_history(channel, page, limit, callback, start: start_tt, end: end_tt)
        else
          async_paged_history(options)
        end
      end

      private

      def sync_paged_history(channel, page, limit, callback, timetokens)
        envelopes = []
        page.times do |i|
          envelopes << history(
            channel: channel,
            http_sync: true,
            count: limit,
            start: timetokens[:start],
            end: timetokens[:end]
          )
          envelopes.flatten!
          timetokens[:end] = envelopes.last.history_start.to_i
          envelopes = [] unless i == page - 1
        end

        call_callback(envelopes, callback)
      end

      def async_paged_history(options)
        Concurrent::Future.new do
          sync_options = options.dup
          sync_options[:http_sync] = true
          paged_history(sync_options, &block)
        end
      end

      def call_callback(envelopes, callback)
        envelopes.flatten!
        if callback
          envelopes.each do |envelope|
            secure_call callback, envelope
          end
        end
        envelopes
      end
    end
  end
end
