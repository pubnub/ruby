require 'pubnub/configuration'
require 'pubnub/parser'
require 'pubnub/envelope'
require 'pubnub/crypto'
require 'pubnub/uuid'
require 'pubnub/exceptions'
require 'pubnub/event'
require 'pubnub/formatter'
require 'pubnub/validator'
require 'pubnub/pam'

module Pubnub
  class Client
    include Configuration

    attr_reader :env
    attr_accessor :single_event_connections_pool, :subscribe_event_connections_pool, :uuid, :async_events

    EVENTS = %w(publish subscribe presence leave history here_now audit grant revoke time heartbeat)
    #VERSION = Pubnub::VERSION

    EVENTS.each do |event_name|
      require File.join('pubnub', 'events', event_name)
    end

    EVENTS.each do |event_name|
      define_method event_name do |params, &block|
        params[:callback] = block if params[:callback].nil?
        event = Pubnub.const_get(classify_method(event_name)).new(params, self)
        $logger.debug('Created event ' + event.class.to_s)
        event.fire(self)
      end
    end
    alias_method :unsubscribe, :leave

    def initialize(options)
      validate!(options)
      setup_app(options)
      # From this moment we have to use @env in that method instead of options
      create_connections_pools(@env)
      create_subscriptions_pools(@env)
      start_event_machine(@env)
    end

    def shutdown(stop_em = false)
      @single_event_connections_pool.each do |origin, conn|
        conn.shutdown_in_all_threads
        conn = nil
      end
      @single_event_connections_pool = Hash.new

      @subscribe_event_connections_pool.each do |origin, conn|
        conn.shutdown_in_all_threads
        conn = nil
      end
      @subscribe_event_connections_pool = Hash.new

      @env[:callback_pool] = Hash.new
      @env[:subscriptions] = Hash.new

      EM.stop if stop_em

      $logger.info('Bye!')
    end

    def start_respirator
      $logger.debug('Pubnub::Client#start_respirator | fired')
      if @env[:heartbeat]
        $logger.debug('Pubnub::Client#start_respirator | starting')

        if @env[:heartbeat] != @env[:respirator].interval
          $logger.debug('Pubnub::Client#start_respirator | destroy old respirator')
          @env[:respirator].cancel
          @env[:respirator] = nil
        end if @env[:respirator]

        @env[:respirator] = EM.add_periodic_timer((@env[:heartbeat].to_i/2) - 1) do
          @env[:subscriptions].each do |origin, subscribe|
            $logger.debug('Pubnub::Client#start_respirator | BUM')
            EM.defer { heartbeat(:channel => subscribe.get_channels){ |e| $logger.debug('Pubnub::Client#start_respirator | bum') } }
          end
        end unless @env[:respirator]

        $logger.debug('Pubnub::Client#start_respirator | started')
      end
    end

    def start_subscribe(override = false)

      start_event_machine
      start_respirator if @env[:heartbeat]

      if override
        $logger.debug('Pubnub::Client#start_subscribe | Override')
        @env[:subscribe_railgun].cancel
        @env[:subscribe_railgun] = nil
        @env[:wait_for_response].each do |k,v|
          @env[:wait_for_response][k] = false
        end
      end

      @env[:wait_for_response] = Hash.new unless @wait_for_response
      @env[:subscribe_railgun] = EM.add_periodic_timer(PERIODIC_TIMER_INTERVAL) do
        begin
          @env[:subscriptions].each do |origin, subscribe|
            unless @env[:wait_for_response][origin]
              @env[:wait_for_response][origin] = true

              $logger.debug('Async subscription running')
              $logger.debug("origin: #{origin}")
              $logger.debug("timetoken: #{@env[:timetoken]}")

              EM.defer do
                subscribe.start_event(self) if subscribe
                # @env[:wait_for_response][origin] = false # moved to Event
              end

            end
          end
        rescue => e
          $logger.error(e)
          $logger.error(e.backtrace)
        end
      end unless @env[:subscribe_railgun]
    end

    def subscription_running?
      @env[:subscribe_railgun] && !@env[:subscriptions].empty? ? true : false
    end

    def create_subscriptions_pools(env)
      @env[:subscriptions]        = Hash.new
      @env[:callbacks_pool]       = Hash.new
      @env[:error_callbacks_pool] = Hash.new
    end

    def update_timetoken(timetoken)
      @env[:timetoken] = timetoken.to_i
      $logger.debug("Pubnub::Client#update_timetoken | Current timetoken is eq #{@env[:timetoken]}")
    end

    def set_uuid(uuid)
      leave_all unless @env[:subscriptions].empty?
      @env[:uuid] = uuid
      start_subscribe(true) unless @env[:subscriptions].empty?
    end
    alias_method :session_uuid=, :set_uuid
    alias_method :uuid=, :set_uuid

    def set_auth_key(auth_key)
      leave_all unless @env[:subscriptions].empty?
      @env[:auth_key] = auth_key
      start_subscribe(true) unless @env[:subscriptions].empty?
    end
    alias_method :auth_key=, :set_auth_key

    def set_heartbeat(heartbeat = nil)
      if heartbeat
        @env[:heartbeat] = heartbeat
      end
      @env[:heartbeat]
    end
    alias_method :heartbeat=, :set_heartbeat

    def get_heartbeat
      @env[:heartbeat]
    end

    def set_cipher_key(cipher_key)
      @env[:cipher_key] = cipher_key
    end
    alias_method :cipher_key=, :set_cipher_key

    def start_railgun
      if @env[:railgun]
        $logger.debug('Pubnub::Client#start_railgun | Railgun already initialized')
      else
        $logger.debug('Pubnub::Client#start_railgun | Initializing railgun')
        @env[:railgun] = EM.add_periodic_timer(0.01) do
          @async_events.each do |event|
            EM.defer do
              event.fire(self) unless event.fired
            end
          end
          @async_events.delete_if {|event| event.finished }
        end
      end
    end

    private

    def leave_all
      @env[:subscriptions].each do |origin, subscribe|
        leave(
            :origin => origin,
            :channel => subscribe.get_channels.map{|c| c.to_s}.join(','),
            :http_sync => true,
            :skip_remove => true
        )

        subscribe.set_timetoken(0)
      end
    end

    def start_event_machine(options = nil)
      $logger.debug 'Pubnub::Client#start_event_machine | starting EM in new thread'
      if defined?(Thin)
        $logger.debug('Pubnub::Client#start_event_machine | We\'re running on thin')
      else
        $logger.debug('Pubnub::Client#start_event_machine | We aren\'t running on thin')
      end
      if EM.reactor_running?
        $logger.debug 'Pubnub::Client#start_event_machine | EM already running'
      else
        Thread.new { EM.run {} }
        $logger.debug 'Pubnub::Client#start_event_machine | EM started in new thread'
      end
    end

    def setup_app(options)
      $logger = options[:logger] || Logger.new('pubnub.log')
      @env = symbolize_options_keys(options)
      @env = set_default_values(@env)
      @async_events = Array.new
      $logger.debug("\n\nCreated new Pubnub::Client instance")
    end

    def create_connections_pools(options)
      @subscribe_event_connections_pool = Hash.new
      @single_event_connections_pool    = Hash.new
    end

    def set_default_values(env)
      defaults = {
          :error_callback             => DEFAULT_ERROR_CALLBACK,
          :connect_callback           => DEFAULT_CONNECT_CALLBACK,
          :ssl                        => DEFAULT_SSL,
          :timetoken                  => DEFAULT_TIMETOKEN,
          :uuid                       => UUID.new.generate,
          :port                       => DEFAULT_CONNECTION_PORT,
          :origin                     => DEFAULT_ORIGIN,
          :subscribe_timeout          => DEFAULT_SUBSCRIBE_TIMEOUT,
          :timeout                    => DEFAULT_NON_SUBSCRIBE_TIMEOUT,
          :max_retries                => MAX_RETRIES,
          :non_subscribe_timeout      => DEFAULT_NON_SUBSCRIBE_TIMEOUT,
          :reconnect_max_attempts     => DEFAULT_RECONNECT_ATTEMPTS,
          :reconnect_retry_interval   => DEFAULT_RECONNECT_INTERVAL,
          :reconnect_response_timeout => DEFAULT_RECONNECT_RESPONSE_TIMEOUT,
          :ttl                        => DEFAULT_TTL,
          :secret_key                 => 0
      }

      # Let's fill missing keys with default values
      $logger.debug('Setting default values')
      defaults.each do |key,default_value|
        env[key] = default_value if @env[key].nil?
      end

      env
    end

    def symbolize_options_keys(options)
      $logger.debug('Symbolizing options keys')
      symbolized_options = {}
      options.each_key { |k| symbolized_options.merge!({ k.to_sym => options[k] }) }
      symbolized_options
    end

    def classify_method(method)
      method.split('_').map{ |w| w.capitalize }.join
    end

    def validate!(parameters)
      raise InitializationError.new(:object => self, :message => 'Origin parameter is not valid. Should be type of String')                  unless parameters[:origin].is_a?(String) || parameters[:origin].blank?
      raise InitializationError.new(:object => self, :message => 'Missing required :subscribe_key parameter')                                unless parameters[:subscribe_key]
      raise InitializationError.new(:object => self, :message => 'Subscribe key parameter is not valid. Should be type of String or Symbol') unless [String, Symbol].include?(parameters[:subscribe_key].class)
      raise InitializationError.new(:object => self, :message => 'Publish key parameter is not valid. Should be type of String or Symbol')   unless [String, Symbol].include?(parameters[:publish_key].class) || parameters[:publish_key].blank?
    end

  end
end
