require 'pubnub/error'
require 'pubnub/uuid'
require 'pubnub/formatter'
require 'pubnub/crypto'
require 'pubnub/configuration'
require 'pubnub/request_dispatcher'
require 'pubnub/message'

require 'pubnub/event'
require 'pubnub/single_event'
require 'pubnub/subscribe_event/formatter'
require 'pubnub/subscribe_event/heartbeat'
require 'pubnub/subscribe_event/adding'
require 'pubnub/subscribe_event/removing'
require 'pubnub/subscribe_event'
require 'pubnub/pam'
require 'pubnub/heart'

require 'pubnub/envelope'
require 'pubnub/error_envelope'

require 'pubnub/client/connections'
require 'pubnub/client/events'
require 'pubnub/client/paged_history'

require 'pubnub/validators/common_validator'
require 'pubnub/validators/client'
require 'pubnub/validators/publish'
require 'pubnub/validators/subscribe'

require 'pubnub/events/audit'
require 'pubnub/events/channel_registration'
require 'pubnub/events/grant'
require 'pubnub/events/heartbeat'
require 'pubnub/events/here_now'
require 'pubnub/events/history'
require 'pubnub/events/leave'
require 'pubnub/events/presence'
require 'pubnub/events/publish'
require 'pubnub/events/revoke'
require 'pubnub/events/state'
require 'pubnub/events/subscribe'
require 'pubnub/events/time'
require 'pubnub/events/where_now'

# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class.
  class Client
    include Configuration
    include Connections
    include Events
    include PagedHistory

    attr_reader :env

    VERSION = Pubnub::VERSION

    # Parameters:
    # ===========
    #
    # <dl>
    #   <dt>subscribe_key</dt>
    #   <dd><b>required.</b> Your subscribe key.</dd>
    #
    #   <dt>publish_key</dt>
    #   <dd><b>optional.</b> Your publish key, without it you can't push messages.</dd>
    #
    #   <dt>secret_key</dt>
    #   <dd><b>optional.</b> Your secret key, required for PAM operations.</dd>
    #
    #   <dt>auth_key</dt>
    #   <dd><b>optional.</b> This client auth key.</dd>
    #
    #   <dt>cipher_key</dt>
    #   <dd><b>optional.</b> Required to encrypt messages.</dd>
    #
    #   <dt>uuid</dt>
    #   <dd><b>optional.</b> Sets given uuid as client uuid, does not generates random uuid on init as usually.</dd>
    #
    #   <dt>origin</dt>
    #   <dd><b>optional.</b> Specifies the fully qualified domain name of the PubNub origin. By default this value is set to <code>pubsub.pubnub.com</code> but it should be set to the appropriate origin specified in the PubNub Admin Portal.</dd>
    #
    #   <dt>callback</dt>
    #   <dd><b>optional.</b> Default callback function for all events if not overwrote while firing event.</dd>
    #
    #   <dt>error_callback</dt>
    #   <dd><b>optional.</b> Default error callback.</dd>
    #
    #   <dt>connect_callback</dt>
    #   <dd><b>optional.</b> Callback that is called when connection with origin is established.</dd>
    #   <dt>ssl</dt>
    #   <dd><b>optional.</b> Your connection will use ssl if set to true.</dd>
    #
    #   <dt>heartbeat</dt>
    #   <dd><b>optional.</b> Heartbeat interval, if not set heartbeat will not be running.</dd>
    #
    #   <dt>subscribe_timeout</dt>
    #   <dd><b>optional, be careful when modifying this.</b> Timeout for subscribe connection in seconds.</dd>
    #
    #   <dt>non_subscribe_timeout</dt>
    #   <dd><b>optional, be careful when modifying this.</b> Timeout for non-subscribe connection in seconds.</dd>
    #
    #   <dt>max_retries</dt>
    #   <dd><b>optional.</b> How many times client should try to reestablish connection before fail.</dd>
    #
    #   <dt>ttl</dt>
    #   <dd><b>optional.</b> Default ttl for grant and revoke events.</dd>
    # </dl>
    # _examples:_
    # ```ruby
    # # Minimal initialize
    # pubnub = Pubnub.new(subscribe_key: :my_sub_key)
    # ````
    #
    # ```ruby
    # # More complex initialize
    # pubnub = Pubnub.new(
    #   subscribe_key: :demo,
    #   publish_key: :demo,
    #   secret_key: :secret,
    #   cipher_key: :other_secret,
    #   uuid: :mad_max,
    #   origin: 'custom.pubnub.com',
    #   callback: -> (envelope) { puts envelope.message },
    #   error_callback: -> (envelope) { puts envelope.message },
    #   connect_callback: -> (message) { puts message },
    #   heartbeat: 60,
    #   subscribe_timeout: 310,
    #   non_subscribe_timeout: 10,
    #   max_retries: 10,
    #   ttl: 0
    # )
    # ```
    # Returns:
    # ========
    #
    # Initialized Pubnub::Client ready to use.
    #
    def initialize(options)
      env_hash = symbolize_options_keys(options)
      setup_app env_hash
      clean_env
      prepare_env
      validate! @env
      Pubnub.logger.debug('Pubnub::Client') do
        "Created new Pubnub::Client instance. Version: #{Pubnub::VERSION}"
      end
    end

    # Returns:
    # ========
    # True if client is subscribed to at least one channel or channel group, otherwise false.
    def subscribed?
      if @env[:subscription_pool].empty?
        false
      else
        !@env[:subscription_pool].map(&:empty?).index(false)
      end
    end

    # Parameters:
    # ===========
    # <dl>
    #   <dt>origin</dt>
    #   <dd>Domain name where connection should be connected.</dd>
    #
    #   <dt>event_type</dt>
    #   <dd>Keyword. :subscribe_event or :single_event.</dd>
    #
    #   <dt>sync</dt>
    #   <dd>Boolean. True if we want dispatcher for sync or sync event, otherwise false.</dd>
    # </dl>
    #
    # Returns:
    # ========
    # Appropriate RequestDispatcher.
    #
    # It returns always new RequestDispatcher for sync events.
    # For async events it checks if there's already RequestDispatcher
    # created and returns it if created, otherwise creates it, assigns
    # it in @env and returns newly created dispatcher.
    def request_dispatcher(origin, event_type, sync)
      Pubnub.logger.debug('Pubnub::Client') do
        "Looking for requester for #{event_type}"
      end
      if sync
        @env[:req_dispatchers_pool] ||= {}
        @env[:req_dispatchers_pool][:sync] ||= {}
        @env[:req_dispatchers_pool][:sync][origin] ||= {}
        @env[:req_dispatchers_pool][:sync][origin][event_type] ||=
            RequestDispatcher.new
      else
        @env[:req_dispatchers_pool] ||= {}
        @env[:req_dispatchers_pool][:async] ||= {}
        @env[:req_dispatchers_pool][:async][origin] ||= {}
        @env[:req_dispatchers_pool][:async][origin][event_type] ||=
            RequestDispatcher.new
      end
    end

    # Parameters:
    # ===========
    # <dl>
    #   <dt>origin</dt>
    #   <dd>Domain name where connection should be connected.</dd>
    #
    #   <dt>event_type</dt>
    #   <dd>Keyword. :subscribe_event or :single_event.</dd>
    # </dl>
    #
    # Functionality:
    # ==============
    # Terminates request dispatcher for given origin and event type. Usable while restarting subscription.
    def kill_request_dispatcher(origin, event_type)
      Pubnub.logger.debug('Pubnub::Client') { 'Killing requester' }
      @env[:req_dispatchers_pool][origin][event_type].async.terminate
      @env[:req_dispatchers_pool][origin][event_type] = nil
    rescue
      Pubnub.logger.debug('Pubnub::Client') { 'There\'s no requester' }
    end

    # Parameters:
    # ===========
    # <dl>
    #   <dt>uuid</dt>
    #   <dd>New uuid to be set.</dd>
    # </dl>
    #
    # Returns:
    # ========
    # New uuid.
    #
    # Functionality:
    # ==============
    # Can't change uuid while subscribed. You have to leave every subscribed channel.
    def change_uuid(uuid)
      Pubnub.logger.debug('Pubnub::Client') { 'Changing uuid' }
      if subscribed?
        fail('Cannot change UUID while subscribed.')
      else
        @env[:uuid] = uuid
      end
    end
    alias_method :session_uuid=, :change_uuid
    alias_method :uuid=, :change_uuid
    alias_method :set_uuid=, :change_uuid

    # Returns:
    # ========
    # Current origin.
    def current_origin
      @env[:origins_pool].first
    end
    alias_method :origin, :current_origin

    # Returns:
    # ========
    # Current client timetoken
    def timetoken
      @env[:timetoken]
    end

    # Parameters:
    # ===========
    # <dl>
    #   <dt>timetoken</dt>
    #   <dd>New timetoken.</dd>
    # </dl>
    # Returns:
    # ========
    # New timetoken.
    def timetoken=(timetoken)
      @env[:timetoken] = timetoken
    end

    # Returns:
    # ========
    # Current uuid.
    def uuid
      @env[:uuid]
    end

    # Returns:
    # ========
    # Array of all current events.
    def events
      @env[:events]
    end

    private

    def validate!(env)
      Validator::Client.validate! env
    end

    def setup_app(options)
      Pubnub.logger = options[:logger] || Logger.new('pubnub.log')
      Celluloid.logger = Pubnub.logger
      @env = options
    end

    def prepare_env
      assign_defaults
      generate_uuid if @env[:uuid].blank?
      setup_pools
    end

    def generate_uuid
      @env[:uuid] = UUID.generate
    end

    def assign_defaults
      default_values.each do |k, v|
        @env[k] = v unless @env[k]
      end
      @env[:timetoken] = 0
    end

    def setup_pools
      # Event pool
      @env[:events] = []

      # Connection pools
      @env[:single_event_conn_pool] = {}
      @env[:subscribe_event_conn_pool] = {}
      @env[:heartbeat_event_conn_pool] = {}

      # Callback pools.
      @env[:c_cb_pool] = {}
      @env[:e_cb_pool] = {}

      # Subscription and heartbeat pools.
      @env[:subscription_pool] = {}
      @env[:heartbeat_pool] = {}

      # Requests pool.
      @env[:req_dispatchers_pool] = {}
    end

    def symbolize_options_keys(options)
      symbolized_options = {}
      options.each_key do |k|
        symbolized_options.merge!(k.to_sym => options[k])
      end
      symbolized_options
    end

    def default_values
      { origins_pool: DEFAULT_ORIGINS_POOL,
        error_callback: DEFAULT_ERROR_CALLBACK,
        connect_callback: DEFAULT_CONNECT_CALLBACK,
        open_timeout: DEFAULT_OPEN_TIMEOUT,
        read_timeout: DEFAULT_READ_TIMEOUT,
        idle_timeout: DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: DEFAULT_S_IDLE_TIMEOUT }
    end

    def clean_env
      @env.delete_if { |_, v| v.blank? } # nillify if blank
    end
  end
end
