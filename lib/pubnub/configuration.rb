# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    DEFAULT_READ_TIMEOUT               = 10
    DEFAULT_OPEN_TIMEOUT               = 10
    DEFAULT_IDLE_TIMEOUT               = 10
    DEFAULT_S_READ_TIMEOUT             = 310
    DEFAULT_S_OPEN_TIMEOUT             = 310
    DEFAULT_S_IDLE_TIMEOUT             = 310
    DEFAULT_H_READ_TIMEOUT             = 10
    DEFAULT_H_OPEN_TIMEOUT             = 10
    DEFAULT_H_IDLE_TIMEOUT             = 10
    DEFAULT_RECONNECT_ATTEMPTS         = 10
    DEFAULT_RECONNECT_INTERVAL         = 10
    DEFAULT_ORIGINS_POOL               = ['pubsub.pubnub.com']
    DEFAULT_PORT                       = 80
    PERIODIC_TIMER_INTERVAL            = 0.25
    DEFAULT_TTL                        = 1440
    DEFAULT_REGION                     = '0'

    private

    def default_values
      { origins_pool: DEFAULT_ORIGINS_POOL,
        open_timeout: DEFAULT_OPEN_TIMEOUT,
        read_timeout: DEFAULT_READ_TIMEOUT,
        idle_timeout: DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: DEFAULT_S_IDLE_TIMEOUT,
        reconnect_attempts: DEFAULT_RECONNECT_ATTEMPTS,
        reconnect_interval: DEFAULT_RECONNECT_INTERVAL,
        region: DEFAULT_REGION
      }
    end
  end
end
