module Pubnub
  module Subscription
    include Pubnub::Configuration

    attr_reader :subscribed_channel_list, :callback_list

    def self.valid_channels?(channels)
      return false unless [String, Symbol, Integer, Array].include?(channels.class)
      if channels.class == Array
        channels.each {|c| return false unless [String, Symbol, Integer].include?(c.class) }
      end
      true
    end

    def self.format_channels(channels)
      if channels.is_a? Array
        channels.map{|c| c.to_s}.join(',')
      elsif channels.is_a? String
        channels.split(',').join(',')
      else
        channels.to_s
      end
      end

    def self.format_channels_for_presence(channels)
      if channels.is_a? Array
        channels.map{|c| c.to_s + '-pnpres'}.join(',')
      elsif channels.is_a? String
        channels.split(',').map{|c| c + '-pnpres'}.join(',')
      else
        channels.to_s + '-pnpres'
      end
    end


    # Check if channel isn't already subscribed, if not, adds channel to channels list and add callback
    # to callbacks list. In meantime starts event machine reactor and periodic timer for subscription
    # if not running
    # TODO: Isn't there a little mess with channels?
    def preform_subscribe(options)
      setup_connections(options)

      if options[:http_sync] # Synchronized action
        unless envelope = preform_subscribe_request(options) # preforming request and checking if it's successful
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
      run_em
      @wait_for_response = false
      @subscription_request_timers = Hash.new unless @subscription_request_timers
      @subscription_request_timers[options[:origin]] = EM.add_periodic_timer(PERIODIC_TIMER_INTERVAL) do
        $logger.debug('Subscription timer started')
        unless @wait_for_response
          @wait_for_response = true

          unless preform_subscribe_request(options)
            retry_subscribe_request(options)
          end

          @wait_for_response = false
        end

        if @subscribed_channel_list[options[:origin]].empty?
          @subscription_request_timer[options[:origin]].cancel
          @subscription_request_timer[options[:origin]] = nil
        end

      end
    end

    def format_envelopes(response, pubsub_operation, cipher_key = nil, msg = nil)
      Pubnub::Envelope.format_from_string_with_json(response, pubsub_operation, cipher_key, msg, @env)
    end

    # preforms subscribe request
    def preform_subscribe_request(options)
      response = fire_subscribe_request(options)
      $logger.debug 'Got response'
      if (200..206).include?(response.status) && Pubnub::Parser.valid_json?(response.body) # We've got some successful response
        $logger.debug 'Status 2xx and valid JSON'
        envelopes = format_envelopes(                                        # Let's format envelopes
            response,
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
          options[:callback],                                                # Passing callback or nil
          options[:http_sync]
        )
        envelopes                                                            # Success, we don't need to retry
      elsif !Pubnub::Parser.valid_json?(response.body)
        envelopes = Pubnub::JSONParseError.new(
            :response => response,
            :message => [0, 'Invalid JSON in response.'].to_json,
            :operation => options[:operation],
            :env => @env,
            :options => options
        ).to_envelope

        handle_error_response(envelopes)
        false
      else
        envelopes = Pubnub::ResponseError.new(
            :message => [0, 'Non 2xx server response'].to_json,
            :response => response,
            :operation => options[:operation],
            :env => @env,
            :options => options
        ).to_envelope

        handle_error_response(envelopes)
        false
      end

      #else                                                                   # Crap! There's something wrong!
      #  binding.pry
      #  $logger.debug 'Status non-2xx or invalid JSON'
      #  envelopes = format_envelopes(response, :error, options[:cipher_key], 'Response message not usable')
      #  handle_error_response(envelopes)
      #  false                                                                # We have to retry
      #end
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
      #begin
      #  binding.pry
        @subscribe_connections_pool[options[:origin]].get do |request|
          request.path = path
          request.params = variables_for_subscribe(options)
          request.options = {
              :timeout      => options[:subscribe_timeout],
              :open_timeout => options[:subscribe_timeout]
          }
        end
      #rescue Exception => e
      #  binding.pry
      #end
    end

    def variables_for_subscribe(options)
      auth = options[:auth_key] || nil
      vars = { :uuid => options[:uuid] }
      vars.merge!({ :auth => auth })
      vars.merge!({ :pnsdk => "PubNub-Ruby/#{Pubnub::VERSION}" })
      vars
    end

    def retry_subscribe_request(options, retry_attempts = 1)
      if retry_attempts <= options[:max_retries]
        unless preform_subscribe_request(options)
          $logger.debug('Retrying')
          retry_subscribe_request(options, retry_attempts + 1)
        end
      else
        $logger.debug('Reached max retries')
        false
      end
    end

    # Sets channel for envelope without channel
    # It happens when we're subscribed to one channel only
    def fix_empty_channels(envelopes, channel = nil, origin = nil)
      puts 'FIXING EMPTY CHANNELS'
      puts "e: #{envelopes}"
      puts "c: #{channel}"
      puts "o: #{origin}"
      puts "cfs: #{channels_for_subscribe(origin)}"
      envelopes.each do |e|
        if e.have_message_without_channel?
          e.set_channel (channel || channels_for_subscribe(origin))
        end
      end

      envelopes
    end

    # Handles returned envelopes
    def handle_envelopes(origin, envelopes, callback = nil, http_sync = nil)
      $logger.debug('Handling envelopes')
      update_timetoken envelopes.first.timetoken
      unless envelopes.size == 1 && envelopes.first.timetoken_update?
        envelopes.each_with_index do |envelope, i|
          envelope.first = true if i == 0
          envelope.last  = true if i == envelopes.size-1
          Thread.new { fire_callback_for(origin, envelope, callback) if callback || !http_sync }
          #fire_callback_for(origin, envelope, callback) if callback || !http_sync
        end
      end
    end

    # Finds proper callback for envelope and calls it
    def fire_callback_for(origin, envelope, callback = nil)
      $logger.debug('Firing callback')
      if callback
        callback.call envelope
      else
        @callback_list[origin][envelope.channel.to_s].call envelope
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
        @callback_list[origin] = { channel.to_s => callback }
      else
        @callback_list[origin].merge!({ channel.to_s => callback })
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