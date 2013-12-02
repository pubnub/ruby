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
      setup_connections(@env) # We're using @env not options because it has default values that could be necessary

    end

    # TODO well documented subscribe examples
    def subscribe(options, &block)
      $logger.debug('Calling subscribe')
      options.merge!({ :action => :subscribe })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:subscribe, options)
      options[:channel] = options[:channels] if options[:channel].blank? && !options[:channels].blank?
      preform_subscribe(@env.merge(options))
    end

    # TODO well documented presence examples
    def presence(options, &block)
      $logger.debug('Calling presence')
      options.merge!({ :action => :presence })
      options[:channel] = options[:channel].to_s + '-pnpres'
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:presence, options)
      preform_subscribe(@env.merge(options))
    end

    # TODO well documented leave examples
    def leave(options, &block)
      $logger.debug('Calling leave')
      options.merge!({ :action => :leave })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:leave, options)
      perform_single_request(@env.merge(options))
    end

    # TODO well documented leave examples
    def publish(options, &block)
      $logger.debug('Calling publish')
      options.merge!({ :action => :publish })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:publish, options)
      perform_single_request(@env.merge(options))
    end

    # TODO well documented history examples
    def history(options, &block)
      $logger.debug('Calling history')
      options.merge!({ :action => :history })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:history, options)
      perform_single_request(@env.merge(options))
    end

    # TODO well documented here_now examples
    def here_now(options, &block)
      $logger.debug('Calling here_now')
      options.merge!({ :action => :here_now })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:here_now, options)
      perform_single_request(@env.merge(options))
    end

    # Returns current timetoken from server
    def time(options, &block)
      $logger.debug('Calling time')
      options.merge!({ :action => :time })
      options.merge!({ :callback => block }) if block_given?
      check_required_parameters(:time, options)
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
    def url_for_connection(options)
      "http#{options[:ssl] ? 's' : ''}://#{options[:origin]}"
    end

    def origin_already_registered?(origin)
      !@subscribe_connections_pool[origin].nil?
    end

    def setup_subscribe_connection(options)
      $logger.debug('Setting subscribe connection')
      @subscribe_connections_pool[options[:origin]] = Faraday.new(:url => url_for_connection(options)) do |faraday|
        faraday.adapter  :net_http_persistent
        faraday.response :pubnub
        faraday.request  :pubnub
      end
      $logger.debug('Created subscribe connection')
    end

    def setup_single_event_connection(options)
      @single_event_connections_pool = Hash.new
      @single_event_connections_pool[options[:origin]] = Faraday.new(:url => url_for_connection(options)) do |faraday|
        faraday.adapter  :net_http_persistent
        faraday.response :pubnub
        faraday.request  :pubnub
      end
      $logger.debug('Created single event connection')
    end

    # Sets up two persistent connections via Faraday with pubnub middleware
    # TODO set timeout
    def setup_connections(options)
      @subscribe_connections_pool = Hash.new
      setup_subscribe_connection(options)
      setup_single_event_connection(options)
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
          :subscribe_timeout          => DEFAULT_SUBSCRIBE_TIMEOUT,
          :timeout                    => DEFAULT_NON_SUBSCRIBE_TIMEOUT,
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

    # Checks if passed arguments are valid for client operation.
    # It's not DRY for better readability
    def check_required_parameters(operation, parameters)
      channel_or_channels = parameters[:channel] || parameters[:channels]

      raise InitializationError.new(:object => self), 'Origin parameter is not valid. Should be type of String or Symbol' unless [String, Symbol].include?(parameters[:origin].class) || parameters[:origin].blank?

      case operation
        when :initialize

          # Check subscribe key
          raise InitializationError.new(:object => self), 'Missing required :subscribe_key parameter' unless parameters[:subscribe_key]
          raise InitializationError.new(:object => self), 'Subscribe key parameter is not valid. Should be type of String or Symbol' unless [String, Symbol].include?(parameters[:subscribe_key].class)

          # Check publish key
          raise InitializationError.new(:object => self), 'Publish key parameter is not valid. Should be type of String or Symbol' unless [String, Symbol].include?(parameters[:publish_key].class) || parameters[:publish_key].blank?
        when :subscribe
          # Check channels
          raise ArgumentError.new(:object => self), 'Subscribe requires :channel or :channels argument' unless channel_or_channels
          raise ArgumentError.new(:object => self), 'Subscribe can\'t be given both :channel and channels parameter' if parameters[:channel] && parameters[:channels]
          raise ArgumentError.new(:object => self), 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both' unless Subscription::valid_channels?(channel_or_channels)

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async subscribe' if !parameters[:http_sync] && parameters[:callback].blank?
        when :presence
          # Check channels
          raise ArgumentError.new(:object => self), 'Presence requires :channel or :channels argument' unless channel_or_channels
          raise ArgumentError.new(:object => self), 'Presence can\'t be given both :channel and channels parameter' if parameters[:channel] && parameters[:channels]
          raise ArgumentError.new(:object => self), 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both' unless Subscription::valid_channels?(channel_or_channels)

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async presence' if !parameters[:http_sync] && parameters[:callback].blank?

        when :leave
          # check channel
          raise ArgumentError.new(:object => self), 'Leave requires :channel argument' unless parameters[:channel]
          raise ArgumentError.new(:object => self), 'Invalid channel format! Should be type of: String, Symbol, or Array of both' unless [String, Symbol].include?(parameters[:channel].class)

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async leave/unsubscribe' if !parameters[:http_sync] && parameters[:callback].blank?

        when :publish
          # check message
          raise ArgumentError.new(:object => self), 'Publish requires :message argument' unless parameters[:message]

          # check channel/channels
          raise ArgumentError.new(:object => self), 'Publish requires :channel or :channels argument' unless parameters[:channel] || parameters[:channels]
          raise ArgumentError.new(:object => self), 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both' unless Subscription::valid_channels?(channel_or_channels)

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async publish' if !parameters[:http_sync] && parameters[:callback].blank?

        when :history
          # check channel
          raise ArgumentError.new(:object => self), 'History requires :channel argument' unless parameters[:channel]
          raise ArgumentError.new(:object => self), 'Invalid channel format! Should be type of: String, Symbol' unless [String, Symbol].include?(parameters[:channel].class)

          # check if history parameters are valid

          # start
          raise ArgumentError.new(:object => self), 'Invalid :start parameter, should be type of Integer, Fixnum or String' unless [String, Fixnum, Integer].include?(parameters[:start].class)
          raise ArgumentError.new(:object => self), 'Invalid :start parameter, should be positive integer number' if !parameters[:start].to_i.integer? && parameters[:start].to_i <= 0

          # end
          raise ArgumentError.new(:object => self), 'Invalid :end parameter, should be type of Integer, Fixnum or String' unless [String, Fixnum, Integer].include?(parameters[:end].class)
          raise ArgumentError.new(:object => self), 'Invalid :end parameter, should be positive integer number' if !parameters[:end].to_i.integer? && parameters[:end].to_i <= 0
          raise ArgumentError.new(:object => self), 'Invalid :end parameter, should be bigger than :start parameter.
                                                     If you want to get messages in reverse order, use :reverse => true at call.' if parameters[:start].to_i >= parameters[:end].to_i
          # count
          raise ArgumentError.new(:object => self), 'Invalid :count parameter, should be type of Integer, Fixnum or String' unless [String, Fixnum, Integer].include?(parameters[:count].class)
          raise ArgumentError.new(:object => self), 'Invalid :count parameter, should be positive integer number' if !parameters[:count].to_i.integer? && parameters[:count].to_i <= 0

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async history' if !parameters[:http_sync] && parameters[:callback].blank?

        when :here_now
          # check channel
          raise ArgumentError.new(:object => self), 'History requires :channel argument' unless parameters[:channel]
          raise ArgumentError.new(:object => self), 'Invalid channel format! Should be type of: String, Symbol' unless [String, Symbol].include?(parameters[:channel].class)

          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async here_now' if !parameters[:http_sync] && parameters[:callback].blank?

        when :time
          # check callback
          raise ArgumentError.new(:object => self), 'Callback parameter is required while using async time' if !parameters[:http_sync] && parameters[:callback].blank?

        else
          raise 'Can\'t determine operation'
      end
    end

  end
end