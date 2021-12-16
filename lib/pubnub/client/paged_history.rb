# frozen_string_literal: true

# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds paged_history event logic
    module PagedHistory
      # Fetch messages as long as one of criteria won't be met.
      # Messages returned as single envelope.
      def all_history_messages(options = {}, &block)
        channel = options.fetch(:channel)
        # Time frame between which messages should be fetched.
        start_tt = options.fetch(:start, nil)
        end_tt = options.fetch(:end, nil)
        page_size = options.fetch(:page_size, 100)          # How many messages per-request should be fetched.
        reverse = options.fetch(:reverse, false)            # Order in which messages should be retrieved if :end not set.
        include_token = options.fetch(:include_token, true) # Whether timetoken should be included with message or not.
        maximum = options.fetch(:max, 500)                  # Maximum number of messages which should be fetched.
        callback = options.fetch(:callback, block)

        reverse = false unless end_tt.nil? # Disable revers if closed time interval specified.
        maximum = nil unless end_tt.nil? # Disable maximum messages count if closed time interval specified.

        if options[:http_sync]
          sync_all_history_messages(channel, include_token, page_size, reverse, maximum, callback, start: start_tt, end: end_tt)
        else
          async_all_history_messages(options)
        end
      end

      def paged_history(options = {}, &block)
        channel = options.fetch(:channel)
        page = options.fetch(:page, 1)                      # How many mages should be fetched with specified limit.
        limit = options.fetch(:limit, 100)                  # How many messages per page should be fetched.
        include_token = options.fetch(:include_token, false) # Whether timetoken should be included with message or not.
        callback = options.fetch(:callback, block)
        # Time frame between which messages should be fetched.
        start_tt = options.fetch(:start, nil)
        end_tt = options.fetch(:end, nil)

        if options[:http_sync]
          sync_paged_history(channel, page, limit, include_token, callback, start: start_tt, end: end_tt)
        else
          async_paged_history(options)
        end
      end

      private

      def sync_all_history_messages(channel, include_token, page_size, reverse, maximum, callback, timetokens)
        next_timetoken = timetokens[:start]
        messages_timetokens = timetokens.dup
        final_envelope = nil
        keep_fetching = true
        messages = []

        while keep_fetching
          envelope = history(
            channel: channel,
            include_token: include_token,
            count: page_size,
            reverse: reverse,
            start: next_timetoken,
            end: timetokens[:end],
            http_sync: true
          )

          # Terminate fetch because last attempt failed.
          if envelope.status[:category] != :ack
            final_envelope = envelope
            break
          end

          result_data = envelope.result[:data]
          result_messages = result_data[:messages]
          break if result_messages.empty?

          if reverse || timetokens[:end]
            messages_timetokens[:start] = result_data[:start].to_i if messages.empty?
            messages_timetokens[:end] = result_data[:end].to_i
            messages.concat(result_messages)
          else
            messages_timetokens[:end] = result_data[:end].to_i if messages.empty?
            messages_timetokens[:start] = result_data[:start].to_i
            messages.unshift(*result_messages)
          end

          keep_fetching = result_messages.length == page_size
          keep_fetching = messages.length < maximum if keep_fetching && maximum && maximum > 0

          if keep_fetching
            next_timetoken = reverse ? result_data[:end].to_i : result_data[:start].to_i
            next_timetoken = result_data[:end].to_i unless timetokens[:end].nil?
          end
        end

        # Create envelop if no error should be reported.
        final_envelope = envelope_with_messages(messages, messages_timetokens) if final_envelope.nil?

        callback&.call final_envelope
        final_envelope
      end

      # Retrieve results page-by-page (callback called for each page).
      def sync_paged_history(channel, page, limit, include_token, callback, timetokens)
        envelopes = []
        page.times do |_i|
          envelope = history(
            channel: channel,
            include_token: include_token,
            http_sync: true,
            count: limit,
            start: timetokens[:start],
            end: timetokens[:end]
          )

          break if envelope.result[:data][:messages].empty?

          envelopes.push envelope
          timetokens[:start] = envelope.result[:data][:start].to_i
          # No need to iterate further if there is no more messages.
          break if envelope.result[:data][:messages].length < limit
        end

        call_callback(envelopes, callback)
      end

      def async_paged_history(options)
        Concurrent::Future.execute do
          sync_options = options.dup
          sync_options[:http_sync] = true
          paged_history(sync_options)
        end
      end

      def async_all_history_messages(options)
        Concurrent::Future.execute do
          sync_options = options.dup
          sync_options[:http_sync] = true
          all_history_messages(sync_options)
        end
      end

      def call_callback(envelopes, callback)
        if callback
          envelopes.each do |envelope|
            callback.call envelope
          end
        end
        envelopes
      rescue StandardError => e
        Pubnub.logger.error('Pubnub::Client') { "Error while calling callback #{e.inspect}" }
      end

      def envelope_with_messages(messages, timetokens)
        Pubnub::Envelope.new(
          event: :history,
          event_options: nil,
          timetoken: nil,
          status: {
            code: 200,
            client_request: nil,
            server_response: nil,

            category: Pubnub::Constants::STATUS_ACK,
            error: false,
            auto_retried: false,

            data: nil,
            current_timetoken: nil,
            last_timetoken: nil,
            subscribed_channels: nil,
            subscribed_channel_groups: nil,
            config: nil
          },
          result: {
            code: 200,
            operation: Pubnub::Constants::OPERATION_HISTORY,
            client_request: nil,
            server_response: nil,
            data: { messages: messages, end: timetokens[:end], start: timetokens[:start] }
          }
        )
      end
    end
  end
end
