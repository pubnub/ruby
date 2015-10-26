# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds paged_history event logic
    module PagedHistory
      def paged_history(options = {}, &block)
        channel  = options.fetch(:channel)
        page     = options.fetch(:page, 1)
        limit    = options.fetch(:limit, 100)
        callback = options.fetch(:callback, block)
        sync     = options[:http_sync]
        start_tt = options.fetch(:start)
        end_tt   = options.fetch(:end)

        current_start_tt = start_tt

        if sync
          envelopes = []
          page.times do |i|
            Pubnub.logger.debug('Pubnub::Client') { "\n\nFetching page no. #{i}" }
            Pubnub.logger.debug('Pubnub::Client') { "Current start tt #{current_start_tt}\n" }
            envelopes << history(channel: channel, http_sync: true, count: limit, start: current_start_tt, end: end_tt)
            envelopes.flatten!

            Pubnub.logger.debug('Pubnub::Client') { "\n\nHistroy start: #{envelopes.last.history_start}" }
            Pubnub.logger.debug('Pubnub::Client') { "History end: #{envelopes.last.history_end}\n" }
            current_start_tt = envelopes.last.history_start.to_i

            envelopes = [] unless i == page - 1
          end

          envelopes.flatten!
          envelopes.each do |envelope|
            callback.call envelope
          end if callback
          envelopes
        else
          Celluloid::Future.new do
            sync_options = options.dup
            sync_options[:http_sync] = true
            paged_history(sync_options, &block)
          end
        end
      end
    end
  end
end
