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

require 'pubnub/validators/common_validator'
require 'pubnub/validators/client'
require 'pubnub/validators/publish'
require 'pubnub/validators/subscribe'

# Toplevel Pubnub module.
module Pubnub
  # Pubnub client Class.
  class Client
    include Configuration
    include Connections
    include Events

    attr_reader :env

    VERSION = Pubnub::VERSION

    # TODO: docs
    def initialize(options)
      env_hash = symbolize_options_keys(options)
      setup_app env_hash
      clean_env
      prepare_env
      validate! @env
      Pubnub.logger.debug('Pubnub::Client') do
        'Created new Pubnub::Client instance'
      end
    end

    # Kills currently running subscription and starts it again.
    # Usable when @env[:origins_pool] changes.
    def restart_subscription
      # TODO: implement
    end

    # Same as #restart_subscription but set timetoken to 0.
    def reset_subscription
      @env[:timetoken] = 0
      # TODO: implement
    end

    # TODO: docs
    # TODO: implement
    def subscribed?
    end

    # Returns appropriate RequestDispatcher.
    # It returns always new RequestDispatcher for sync events.
    # For async events it checks if there's already RequestDispatcher
    # created and returns it if created, otherwise creates it, assigns
    # it in @env and returns newly created dispatcher.
    def request_dispatcher(origin, event_type, sync)
      Pubnub.logger.debug('Pubnub::Client') do
        "Looking for requester for #{event_type}"
      end
      # TODO: why am I returning always new displatcher for sync events?
      if sync
        RequestDispatcher.new
      else
        @env[:req_dispatchers_pool][origin] ||= {}
        @env[:req_dispatchers_pool][origin][event_type] ||=
            RequestDispatcher.new
      end
    end

    # TODO: docs
    def kill_request_dispatcher(origin, event_type)
      Pubnub.logger.debug('Pubnub::Client') { 'Killing requester' }
      @env[:req_dispatchers_pool][origin][event_type].async.terminate
      @env[:req_dispatchers_pool][origin][event_type] = nil
    rescue
      Pubnub.logger.debug('Pubnub::Client') { 'There\'s no requester' }
    end

    # TODO: document breaking change set_uuid to change_uuid
    def change_uuid(uuid)
      leave_all if subscribed?
      @env[:uuid] = uuid
      reset_subscription
    end
    alias_method :session_uuid=, :change_uuid
    alias_method :uuid=, :change_uuid

    # TODO: docs
    def current_origin
      @env[:origins_pool].first
    end
    alias_method :origin, :current_origin

    # TODO: docs
    def timetoken
      @env[:timetoken]
    end

    # TODO: docs
    def timetoken=(timetoken)
      @env[:timetoken] = timetoken
    end

    # TODO: docs
    def uuid
      @env[:uuid]
    end

    # TODO: docs
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
      setup_pools
    end

    def assign_defaults
      default_values.each do |k, v|
        @env[k] = v unless @env[k]
      end
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
        connection_callback: DEFAULT_CONNECT_CALLBACK,
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
