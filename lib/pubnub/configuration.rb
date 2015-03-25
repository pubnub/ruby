# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    DEFAULT_ERROR_CALLBACK             = ->(err) { puts err.inspect }
    DEFAULT_CONNECT_CALLBACK           = ->(msg) { msg.inspect }
    # TODO: check default timeouts
    DEFAULT_READ_TIMEOUT               = 310
    DEFAULT_OPEN_TIMEOUT               = 310
    DEFAULT_IDLE_TIMEOUT               = 310
    DEFAULT_S_READ_TIMEOUT             = 310
    DEFAULT_S_OPEN_TIMEOUT             = 310
    DEFAULT_S_IDLE_TIMEOUT             = 310
    DEFAULT_H_READ_TIMEOUT             = 310
    DEFAULT_H_OPEN_TIMEOUT             = 310
    DEFAULT_H_IDLE_TIMEOUT             = 310
    DEFAULT_RECONNECT_ATTEMPTS         = 10
    DEFAULT_RECONNECT_INTERVAL         = 10
    DEFAULT_ORIGINS_POOL               = ['geo1.devbuild.pubnub.com', 'geo2.devbuild.pubnub.com', 'geo3.devbuild.pubnub.com', 'geo4.devbuild.pubnub.com']
    DEFAULT_PORT                       = 80
    PERIODIC_TIMER_INTERVAL            = 0.25
    DEFAULT_TTL                        = 1440
  end
end
