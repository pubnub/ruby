require 'pubnub/configuration'
require 'pubnub/parser'
require 'pubnub/single_request'
require 'pubnub/subscription'
require 'pubnub/envelope'
require 'pubnub/crypto'
require 'pubnub/exceptions'
require 'pubnub/middleware/response'
require 'pubnub/middleware/request'


# TODO Split every operation as separate modules?
# TODO Setup proper values for timeouts
# TODO Implement multiorigin

module Pubnub
  class Client
    include Configuration
    include Subscription
    include SingleRequest

    VERSION = Pubnub::VERSION

    attr_reader :env

    # While creating new Pubnub::Client instance it checks for
    def initialize(options)
      check_required_parameters(:initialize, options)

      setup_env(options)
      run_em unless EM.reactor_running?
      register_faraday_middleware
      setup_connections

    end

    # TODO well documented subscribe examples
    def subscribe(options, &block)
      $logger.debug('Calling subscribe')
      options.merge!({ :action => :subscribe })
      options.merge!({ :callback => block }) if block_given?
      preform_subscribe(@env.merge(options))
    end

    # TODO well documented presence examples
    def presence(options, &block)
      $logger.debug('Calling presence')
      options.merge!({ :action => :presence })
      options[:channel] = options[:channel].to_s + '-pnpres'
      options.merge!({ :callback => block }) if block_given?
      preform_subscribe(@env.merge(options))
    end

    # TODO well documented leave examples
    def leave(options, &block)
      $logger.debug('Calling leave')
      options.merge!({ :action => :leave })
      options.merge!({ :callback => block }) if block_given?
      perform_single_request(@env.merge(options))
    end

    # TODO well documented leave examples
    def publish(options, &block)
      $logger.debug('Calling publish')
      options.merge!({ :action => :publish })
      options.merge!({ :callback => block }) if block_given?
      perform_single_request(@env.merge(options))
    end

    # TODO well documented history examples
    def history(options, &block)
      $logger.debug('Calling history')
      options.merge!({ :action => :history })
      options.merge!({ :callback => block }) if block_given?
      perform_single_request(@env.merge(options))
    end

    # TODO well documented here_now examples
    def here_now(options, &block)
      $logger.debug('Calling here_now')
      options.merge!({ :action => :here_now })
      options.merge!({ :callback => block }) if block_given?
      perform_single_request(@env.merge(options))
    end

    # Returns current timetoken from server
    def time(options, &block)
      $logger.debug('Calling time')
      options.merge!({ :action => :time })
      options.merge!({ :callback => block }) if block_given?
      perform_single_request(@env.merge(options))
    end

    def set_secret_key(secret_key)
      @env[:secret_key] = secret_key
    end
    alias_method 'secret=',     'set_secret_key'
    alias_method 'secret_key=', 'set_secret_key'

    def set_uuid(uuid)
      $logger.debug('Setting new UUID')
      @env[:uuid] = uuid
    end
    alias_method 'uuid=',         'set_uuid'
    alias_method 'session_uuid=', 'set_uuid'

    def set_ssl(ssl)
      $logger.debug('Setting SSL')
      @env[:ssl] = ssl
    end
    alias_method 'ssl=', 'set_ssl'

    def set_cipher_key(cipher_key)
      @env[:cipher_key] = cipher_key
    end
    alias_method 'cipher_key=', 'set_cipher_key'

    # For some backwards compatibility
    def uuid
      @env[:uuid]
    end

    # For some backwards compatibility
    def ssl
      @env[:ssl]
    end

    # For some backwards compatibility
    def secret_key
      @env[:secret_key]
    end

    private

    # Sterts event machine reactor in new thread
    def run_em
      $logger.debug('Starting EventMachine')
      Thread.new { EM.run }

      # block thread until EM starts
      until EM.reactor_running? do end
    end

    def register_faraday_middleware
      $logger.debug('Registering faraday middleware')

      Faraday.register_middleware :response, :pubnub => Pubnub::Middleware::Response
      Faraday.register_middleware :request,  :pubnub => Pubnub::Middleware::Request
    end

    # Returns url for connections depending on origin and enabled ssl
    def url_for_connection
      "http#{@env[:ssl] ? 's' : ''}://#{@env[:origin]}"
    end

    # Sets up two persistent connections via Faraday with pubnub middleware
    # TODO set timeout
    def setup_connections
      @subscribe_connection = Faraday.new(:url => url_for_connection) do |faraday|
        faraday.adapter  :net_http_persistent
        faraday.response :pubnub
        faraday.request  :pubnub
      end
      $logger.debug('Created subscribe connection')

      @single_event_connection = Faraday.new(:url => url_for_connection) do |faraday|
        faraday.adapter  :net_http_persistent
        faraday.response :pubnub
        faraday.request  :pubnub
      end
      $logger.debug('Created single event connection')

    end

    # Returns converted env hash with all non-symbol keys in given env hash into symbols
    def symbolize_options(options)
      $logger.debug('Symbolizing options')
      symbolized_options = {}
      options.each_key { |k| symbolized_options.merge!({ k.to_sym => options[k] }) }
      symbolized_options
    end

    # Checks if given key is already set, if not, sets default value
    def set_default_value_if_not_set(key, default_value)
      @env[key] = default_value if @env[key].nil?
    end

    # Create valid and complete @env variable
    # @env holds whole configuration and is merged with options that are passed to REST actions
    # so values form env overridden by request options are available in every action
    def setup_env(options)

      # Setup logger or let's create default one
      $logger = options[:logger] || Logger.new('pubnub.log', 'weekly')

      # We must be sure if every key is symbol
      @env = symbolize_options options

      set_default_values

      $logger.debug('Created environment')
    end

    def set_default_values
      defaults = {
          :error_callback             => DEFAULT_ERROR_CALLBACK,
          :connect_callback           => DEFAULT_CONNECT_CALLBACK,
          :ssl                        => DEFAULT_SSL,
          :timetoken                  => DEFAULT_TIMETOKEN,
          :uuid                       => UUID.new.generate,
          :port                       => DEFAULT_CONNECTION_PORT,
          :origin                     => DEFAULT_ORIGIN,
          :max_retries                => MAX_RETRIES,
          :non_subscribe_timeout      => DEFAULT_NON_SUBSCRIBE_TIMEOUT,
          :reconnect_max_attempts     => DEFAULT_RECONNECT_ATTEMPTS,
          :reconnect_retry_interval   => DEFAULT_RECONNECT_INTERVAL,
          :reconnect_response_timeout => DEFAULT_RECONNECT_RESPONSE_TIMEOUT
      }

      # Let's fill missing keys with default values
      $logger.debug('Setting default values')
      defaults.each do |key,default_value|
        set_default_value_if_not_set(key, default_value)
      end
    end

    # Handles error response
    # TODO Move to another module? So from single_request it will be usable
    def handle_error_response(response)
      @env[:error_callback].call response
    end

    def origin(options)
      origin = options[:ssl] ? 'https://' : 'http://'
      origin << options[:origin]
    end

    def check_required_parameters(operation, parameters)
      case operation
        when :initialize
          # Check origin
          warn "You are using default origin: pubsub.pubnub.com.\nYou should use custom origin provided by pubnub.\nIn case of any troubles, please contact us with an email: help@pubnub.com." if parameters[:origin].blank?
          raise InitializationError.new(:object => self), 'Origin parameter is not valid. Should be type of String or Symbol' unless parameters[:origin].is_a?(String || Symbol) || parameters[:origin].blank?

          # Check subscribe key
          raise InitializationError.new(:object => self), 'Missing required :subscribe_key parameter' unless parameters[:subscribe_key]
          raise InitializationError.new(:object => self), 'Subscribe key parameter is not valid. Should be type of String or Symbol' unless parameters[:subscribe_key].is_a? String || Symbol

          # Check publish key
          raise InitializationError.new(:object => self), 'Publish key parameter is not valid. Should be type of String or Symbol' unless parameters[:publish_key].is_a?(String || Symbol) || parameters[:publish_key].blank?
        else
          raise 'Can\'t determine operation'
      end
    end

  end
end