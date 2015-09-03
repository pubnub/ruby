# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds generator for all events
    module PagedHistory
      def paged_history(options = {}, &block)
        channel  = options[:channel]
        page     = options[:page]      || 1
        limit    = options[:limit]     || 100
        callback = options[:callback]  || block
        sync     = options[:http_sync] ? true : false
        start_tt = options[:start]     || nil
        end_tt   = options[:end]       || nil

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

            unless i == page - 1
              envelopes = []
            end
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
