# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    private

    def default_values
      { origins_pool: Pubnub::Constants::DEFAULT_ORIGINS_POOL,
        open_timeout: Pubnub::Constants::DEFAULT_OPEN_TIMEOUT,
        read_timeout: Pubnub::Constants::DEFAULT_READ_TIMEOUT,
        idle_timeout: Pubnub::Constants::DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: Pubnub::Constants::DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: Pubnub::Constants::DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: Pubnub::Constants::DEFAULT_S_IDLE_TIMEOUT,
        reconnect_attempts: Pubnub::Constants::DEFAULT_RECONNECT_ATTEMPTS,
        reconnect_interval: Pubnub::Constants::DEFAULT_RECONNECT_INTERVAL,
        region: Pubnub::Constants::DEFAULT_REGION,
        ssl: Pubnub::Constants::DEFAULT_SSL
      }
    end
  end
end
