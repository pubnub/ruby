require 'pubnub/error'
require 'pubnub/uuid'
require 'pubnub/formatter'
require 'pubnub/crypto'
require 'pubnub/configuration'
require 'pubnub/request'
require 'pubnub/message'

require 'pubnub/event'
require 'pubnub/single_event'
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
# Toplevel Pubnub module
module Pubnub
  # Pubnub client Class
  class Client
    include Configuration
    include Connections
    include Events

    attr_reader :env

    VERSION = Pubnub::VERSION

    def initialize(options)
      env_hash = symbolize_options_keys(options)
      setup_app env_hash
      clean_env
      prepare_env
      validate! @env
      Pubnub.logger.debug('Pubnub') { 'Created new Pubnub::Client instance' }
    end

    def requester(origin, event_type, sync)
      Pubnub.logger.debug('Pubnub') do
        "Looking for requester for #{event_type}"
      end
      if sync
        Request.new
      else
        @env[:requesters_pool][origin] ||= {}
        @env[:requesters_pool][origin][event_type] ||= Request.new
      end
    end

    def kill_requester(origin, event_type)
      Pubnub.logger.debug('Pubnub') { 'Killing requester' }
      @env[:requesters_pool][origin][event_type].async.terminate
      # Celluloid::Actor.kill(
      #     @env[:requesters_pool][origin][event_type]
      # )
      @env[:requesters_pool][origin][event_type] = nil
    rescue
      Pubnub.logger.debug('Pubnub') { 'There\'s no requester' }
    end

    # TODO: document breaking change set_uuid to change_uuid
    def change_uuid(uuid)
      # leave_all unless @env[:subscriptions].empty?
      @env[:uuid] = uuid
      # start_subscribe(true) unless @env[:subscriptions].empty?
    end
    alias_method :session_uuid=, :change_uuid
    alias_method :uuid=, :change_uuid

    def timetoken
      @env[:timetoken]
    end

    def timetoken=(timetoken)
      @env[:timetoken] = timetoken
    end

    def uuid
      @env[:uuid]
    end

    def events
      @env[:events]
    end

    private

    def validate!(options)
      Validator::Client.validate! options
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
      @env[:single_event_conn_pool]    = {}
      @env[:subscribe_event_conn_pool] = {}
      @env[:heartbeat_event_conn_pool] = {}

      # Callback pools
      @env[:cb_pool]   = {}
      @env[:e_cb_pool] = {}

      # Subscription&heartbeat pools
      @env[:subscription_pool] = {}
      @env[:heartbeat_pool] = {}

      # Requesters pool
      @env[:requesters_pool] = {}
    end

    def symbolize_options_keys(options)
      symbolized_options = {}
      options.each_key do |k|
        symbolized_options.merge!(k.to_sym => options[k])
      end
      symbolized_options
    end

    def default_values
      {
        origin: DEFAULT_ORIGIN,
        error_callback: DEFAULT_ERROR_CALLBACK,
        connection_callback: DEFAULT_CONNECT_CALLBACK,
        open_timeout: DEFAULT_OPEN_TIMEOUT,
        read_timeout: DEFAULT_READ_TIMEOUT,
        idle_timeout: DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: DEFAULT_S_IDLE_TIMEOUT
      }
    end

    def clean_env
      @env.delete_if { |_, v| v.blank? } # nillify if blank
    end
  end
end
