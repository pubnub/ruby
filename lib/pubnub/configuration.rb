# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    DEFAULT_ERROR_CALLBACK             = ->(err) { err.inspect }
    DEFAULT_CONNECT_CALLBACK           = ->(msg) { msg.inspect }
    # TODO: check default timeouts
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
    DEFAULT_RECONNECT_CALLBACK         = DEFAULT_CONNECT_CALLBACK
    DEFAULT_DISCONNECT_CALLBACK        = DEFAULT_CONNECT_CALLBACK
    DEFAULT_ORIGINS_POOL               = ['pubsub.pubnub.com']
    DEFAULT_PORT                       = 80
    PERIODIC_TIMER_INTERVAL            = 0.25
    DEFAULT_TTL                        = 1440

    private

    def default_values
      { origins_pool: DEFAULT_ORIGINS_POOL,
        error_callback: DEFAULT_ERROR_CALLBACK,
        connect_callback: DEFAULT_CONNECT_CALLBACK,
        open_timeout: DEFAULT_OPEN_TIMEOUT,
        read_timeout: DEFAULT_READ_TIMEOUT,
        idle_timeout: DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: DEFAULT_S_IDLE_TIMEOUT,
        reconnect_attempts: DEFAULT_RECONNECT_ATTEMPTS,
        reconnect_interval: DEFAULT_RECONNECT_INTERVAL,
        reconnect_callback: DEFAULT_RECONNECT_CALLBACK,
        disconnect_callback: DEFAULT_DISCONNECT_CALLBACK
      }
    end
  end
end
