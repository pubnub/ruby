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

    EVENTS = %w(publish subscribe presence leave history here_now audit grant revoke time)
    VERSION = Pubnub::VERSION

    EVENTS.each do |event_name|
      require File.join('pubnub', 'events', event_name)
    end

    EVENTS.each do |event_name|
      define_method event_name do |params, &block|
        params[:callback] = block if params[:callback].nil?
        event = Pubnub.const_get(classify_method(event_name)).new(params, self)
        $logger.debug('Created event ' + event.class.to_s)
        if params[:http_sync]
          event.fire(self)
        else
          #start_event_machine(@env)
          #EM.defer do
          #  @async_events << event
          #  start_railgun(@env)
          #end
          EM.defer {
            begin
              event.fire(self)
            rescue => e
              puts e
            end
          }
        end
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

    def start_subscribe(overwrite = false)

      if overwrite
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
            unless @env[:wait_for_response][origin] == true
              @env[:wait_for_response][origin] = true

              $logger.debug('Async subscription running')
              $logger.debug("ORIGIN #{origin}")
              $logger.debug("SUBSCRIBE #{subscribe}")
              subscribe.start_event(self) if subscribe

              @env[:wait_for_response][origin] = false
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
    end

    def set_uuid(uuid)
      @env[:uuid] = uuid
    end
    alias_method :session_uuid=, :set_uuid

    def set_cipher_key(cipher_key)
      @env[:cipher_key] = cipher_key
    end
    alias_method :cipher_key=, :set_cipher_key

    def start_railgun
      if @env[:railgun]
        $logger.debug('Pubnub::Client#start_event_machine | Railgun already initialized')
      else
        $logger.debug('Pubnub::Client#start_event_machine | Initializing railgun')
        @env[:railgun] = EM.add_periodic_timer(0.05) do
          @async_events.each do |event|
            event.fire(self) unless event.fired
          end
          @async_events.delete_if {|event| event.finished }
        end
      end
    end

    private

    def start_event_machine(options)
      $logger.debug 'Pubnub::Client#start_event_machine | starting EM in new thread'
      Thread.new { EM.run {} } if !EM.reactor_running? && !defined?(Thin)
      if EM.reactor_running?
        $logger.debug 'Pubnub::Client#start_event_machine | EM already running'
      else
        $logger.debug 'Pubnub::Client#start_event_machine | EM started'
      end
    end

    def setup_app(options)
      $logger = options[:logger] || Logger.new('pubnub.log')
      @env = symbolize_options_keys(options)
      @env = set_default_values(@env)
      @async_events = Array.new
      $logger.debug('Created Pubnub::Client.app')
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
          :ttl                        => DEFAULT_TTL
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
      raise InitializationError.new(:object => self), 'Origin parameter is not valid. Should be type of String'                  unless parameters[:origin].is_a?(String) || parameters[:origin].blank?
      raise InitializationError.new(:object => self), 'Missing required :subscribe_key parameter'                                unless parameters[:subscribe_key]
      raise InitializationError.new(:object => self), 'Subscribe key parameter is not valid. Should be type of String or Symbol' unless [String, Symbol].include?(parameters[:subscribe_key].class)
    end

  end
end