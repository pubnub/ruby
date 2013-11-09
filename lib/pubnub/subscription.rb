module Pubnub
  module Subscription
    include Pubnub::Configuration

    attr_reader :subscribed_channel_list, :callback_list

    # Check if channel isn't already subscribed, if not, adds channel to channels list and add callback
    # to callbacks list. In meantime starts event machine reactor and periodic timer for subscription
    # if not running
    # TODO: Isn't there a little mess with channels?
    def preform_subscribe(options)
      options[:channel] ||= options[:channels]
      options[:channel].split(',').join(',') if options[:channel].is_a? String

      if options[:http_sync] # Synchronized action
        unless perform_subscribe_request(options) # Performing request and checking if it's successful
          retry_subscribe_request(options)
        end
      else # Asynchronized action
        [options[:channel].split(',')].flatten.each do |channel|
          unless channel_already_on_list?(channel)
            register_channel(channel)
            register_callback(channel, options[:callback])
          end
        end

        start_subscription_timer(options) unless subscription_running?

      end
    end

    private

    # Updates env[:timetoken] with given timetoken (unless timetoken is in the past)
    def update_timetoken(timetoken)
      @env[:timetoken] = timetoken if timetoken > @env[:timetoken]
    end

    # Creates event machine timer for subscription requests.
    def start_subscription_timer(options)
      $logger.debug('Starting subscription timer')
      @wait_for_response = false
      @subscription_request_timer = EM.add_periodic_timer(PERIODIC_TIMER_INTERVAL) do
        $logger.debug('Subscription timer started')
        unless @wait_for_response
          @wait_for_response = true

          unless perform_subscribe_request(options)
            retry_subscribe_request(options)
          end

          @wait_for_response = false
        end

        if @subscribed_channel_list.empty?
          @subscription_request_timer.stop
          @subscription_request_timer = nil
        end

      end
      EM.next_tick { }
    end

    def format_envelopes(response, pubsub_operation, cipher_key = nil)
      Pubnub::Envelope.format_from_string_with_json(response, pubsub_operation, cipher_key)
    end

    # Performs subscribe request
    def perform_subscribe_request(options)
      response = fire_subscribe_request(options)

      if (200..206).include? response.status                                 # We've got some successful response
        envelopes = format_envelopes(                                        # Let's format envelopes
            response.body,
            :subscribe,
            options[:cipher_key]
        )
        handle_envelopes(                                                    # Calling callbacks
          fix_empty_channels(                                                # Fixing empty channels if happen
            envelopes,                                                       # Formatted Envelopes
            options[:channel]                                                # Channel if set in options
          ),
          options[:callback]                                                 # Passing callback or nil
        )
        true                                                                 # Success, we don't need to retry
      else                                                                   # Crap! There's something wrong!
        handle_error_response(
            format_envelopes(response.body, :error)
        )
        false                                                                # We will have to retry
      end
      # Do not add here anything or you will break returned value (see above)
    end

    # Fires subscribe request and returns response object with envelopes located at .env[:envelopes]
    def fire_subscribe_request(options)
      if options[:http_sync]
        path = subscription_path(
            options[:subscribe_key],
            options[:channel],
            options[:timetoken]
        )

      else
        path = subscription_path(
            options[:subscribe_key],
            channels_for_subscribe,
            @env[:timetoken]
        )

      end

      @subscribe_connection.get(
          origin(options) + path,
          { :uuid => @session_uuid }
      )
    end

    def retry_subscribe_request(options, retry_attempts = 0)
      unless retry_attempts > MAX_RETRIES
        retry_attempts += 1
        unless perform_subscribe_request(options)
          retry_subscribe_request(options, retry_attempts)
        end
      end
    end

    # Sets channel for envelope without channel
    # It happens when we're subscribed to one channel only
    def fix_empty_channels(envelopes, channel = nil)
      envelopes.each do |e|
        if e.have_message_without_channel?
          e.set_channel (channel || channels_for_subscribe)
        end
      end

      envelopes
    end

    # Handles returned envelopes
    def handle_envelopes(envelopes, callback = nil)
      $logger.debug('Handling envelopes')
      update_timetoken envelopes.first.timetoken
      unless envelopes.size == 1 && envelopes.first.timetoken_update?
        envelopes.each do |envelope|
          EM.next_tick { fire_callback_for(envelope, callback) }# TODO: uncomment this after fixing tests
          #fire_callback_for(envelope, callback)
        end
      end
    end

    # Finds proper callback for envelope and calls it
    def fire_callback_for(envelope, callback = nil)
      $logger.debug('Firing callback')
      if callback
        callback.call envelope
      else
        @callback_list[envelope.channel.to_sym].call envelope
      end
    end

    # Returns currently subscribed channels as string string separated by commas
    def channels_for_subscribe
      @subscribed_channel_list.join(',')
    end

    # Add given callback to callback list which is hash where key is channel (as a symbol) and value
    # is given callback
    def register_callback(channel, callback)
      $logger.debug("Registering callback for channel #{channel}")
      if @callback_list.nil?
        @callback_list = { channel.to_sym => callback }
      else
        @callback_list.merge!({ channel.to_sym => callback })
      end
    end

    # Check if given channel is already subscribed
    def channel_already_on_list?(channel)
      is_channel_on_list = @subscribed_channel_list.nil? ? false : @subscribed_channel_list.include?(channel.to_s)
      $logger.debug("Checking if channel #{channel} is on the list? #{is_channel_on_list.to_s}")

      is_channel_on_list
    end

    # Adds given channel to channel list array
    def register_channel(channel)
      $logger.debug("Registering #{channel}")
      if @subscribed_channel_list
        @subscribed_channel_list << channel.to_s
      else
        @subscribed_channel_list = [channel.to_s]
      end
    end

    # returns state of @subscription_running
    def subscription_running?
      @subscription_running
    end

    # returns path for subscription request
    def subscription_path(subscribe_key, channels, timetoken)
      path = URI.escape("/subscribe/#{subscribe_key}/#{channels}/0/#{timetoken}").gsub(/\?/,'%3F')
      $logger.debug("Generating subscription path:#{path}")
      path

    end
  end
end