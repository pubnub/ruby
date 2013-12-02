module Pubnub
  module Subscription
    include Pubnub::Configuration

    attr_reader :subscribed_channel_list, :callback_list

    def self.valid_channels?(channels)
      return false unless [String, Symbol, Integer].include?(channels.class)
      if channels.class == Array
        channels.each {|c| return false unless [String, Symbol].include?(c) }
      end
      true
    end

    # Check if channel isn't already subscribed, if not, adds channel to channels list and add callback
    # to callbacks list. In meantime starts event machine reactor and periodic timer for subscription
    # if not running
    # TODO: Isn't there a little mess with channels?
    def preform_subscribe(options)
      setup_connections(options)

      options[:channel] ||= options[:channels]
      options[:channel].split(',').join(',') if options[:channel].is_a? String

      if options[:http_sync] # Synchronized action
        unless envelope = perform_subscribe_request(options) # Performing request and checking if it's successful
          retry_subscribe_request(options)
        end
      else # Asynchronized action
        [options[:channel].to_s.split(',')].flatten.each do |channel|
          unless channel_already_on_list?(options[:origin], channel)
            register_channel(options[:origin], channel)
            register_callback(options[:origin], channel, options[:callback])
          end
        end

        start_subscription_timer(options) unless subscription_running?

      end

      envelope
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

    def format_envelopes(response, pubsub_operation, cipher_key = nil, msg = nil)
      Pubnub::Envelope.format_from_string_with_json(response, pubsub_operation, cipher_key, msg)
    end

    # Performs subscribe request
    def perform_subscribe_request(options)
      response = fire_subscribe_request(options)
      $logger.debug 'Got response'
      if (200..206).include?(response.status) && Pubnub::Parser.valid_json?(response.body) # We've got some successful response
        $logger.debug 'Status 2xx and valid JSON'
        envelopes = format_envelopes(                                        # Let's format envelopes
            response.body,
            :subscribe,
            options[:cipher_key]
        )
        handle_envelopes(                                                    # Calling callbacks
          options[:origin],
          fix_empty_channels(                                                # Fixing empty channels if happen
            envelopes,                                                       # Formatted Envelopes
            options[:channel],                                               # Channel if set in options
            options[:origin]
          ),
          options[:callback]                                                 # Passing callback or nil
        )
        envelopes                                                            # Success, we don't need to retry
      else                                                                   # Crap! There's something wrong!
        $logger.debug 'Status non-2xx or invalid JSON'
        envelopes = format_envelopes(response.body, :error, options[:cipher_key], 'Response message not usable')
        handle_error_response(envelopes)
        false                                                                # We have to retry
      end
      # Do not add here anything or you will break returned value (see above)
    end

    # Fires subscribe request and returns response object with envelopes located at .env[:envelopes]
    def fire_subscribe_request(options)
      $logger.debug 'Setting path'
      if options[:http_sync]
        path = subscription_path(
            options[:subscribe_key],
            options[:channel],
            options[:timetoken]
        )

      else
        path = subscription_path(
            options[:subscribe_key],
            channels_for_subscribe(options[:origin]),
            @env[:timetoken]
        )

      end

      $logger.debug 'Firing subscribe request'
      begin
        @subscribe_connections_pool[options[:origin]].get do |request|
          request.path = path
          request.params = { :uuid => @session_uuid }
          request.options = {
              :timeout      => options[:subscribe_timeout],
              :open_timeout => options[:subscribe_timeout]
          }
        end
      rescue Exception => e
        binding.pry
      end
    end

    def retry_subscribe_request(options, retry_attempts = 0)
      unless retry_attempts > options[:max_retries]
        retry_attempts += 1
        unless perform_subscribe_request(options)
          $logger.debug('Retrying')
          retry_subscribe_request(options, retry_attempts)
        end
      else

      end
    end

    # Sets channel for envelope without channel
    # It happens when we're subscribed to one channel only
    def fix_empty_channels(envelopes, channel = nil, origin = nil)
      envelopes.each do |e|
        if e.have_message_without_channel?
          e.set_channel (channel || channels_for_subscribe(origin))
        end
      end

      envelopes
    end

    # Handles returned envelopes
    def handle_envelopes(origin, envelopes, callback = nil)
      $logger.debug('Handling envelopes')
      update_timetoken envelopes.first.timetoken
      unless envelopes.size == 1 && envelopes.first.timetoken_update?
        envelopes.each do |envelope|
          EM.next_tick { fire_callback_for(origin, envelope, callback) }
        end
      end
    end

    # Finds proper callback for envelope and calls it
    def fire_callback_for(origin, envelope, callback = nil)
      $logger.debug('Firing callback')
      #binding.pry
      if callback
        callback.call envelope
      else
        @callback_list[origin][envelope.channel.to_sym].call envelope
      end
    end

    # Returns currently subscribed channels as string string separated by commas
    def channels_for_subscribe(origin)
      @subscribed_channel_list[origin].join(',')
    end

    # Add given callback to callback list which is hash where key is channel (as a symbol) and value
    # is given callback
    def register_callback(origin, channel, callback)
      $logger.debug("Registering callback for channel #{channel}")
      if @callback_list.nil?
        @callback_list = Hash.new
        @callback_list[origin] = { channel.to_sym => callback }
      else
        @callback_list[origin].merge!({ channel.to_sym => callback })
      end
    end

    # Check if given channel is already subscribed
    def channel_already_on_list?(origin, channel)
      is_channel_on_list = (@subscribed_channel_list.nil? || @subscribed_channel_list[origin].nil?) ? false : @subscribed_channel_list.include?(channel.to_s)
      $logger.debug("Checking if channel #{channel} @ #{origin} is on the list? #{is_channel_on_list.to_s}")

      is_channel_on_list
    end

    # Adds given channel to channel list array
    def register_channel(origin, channel)
      $logger.debug("Registering #{channel} @ #{origin}")
      @subscribed_channel_list = Hash.new if @subscribed_channel_list.nil?

      if @subscribed_channel_list[origin]
        @subscribed_channel_list[origin] << channel.to_s
      else
        @subscribed_channel_list[origin] = [channel.to_s]
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