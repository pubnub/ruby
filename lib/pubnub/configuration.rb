# Toplevel Pubnub module
module Pubnub
  # That module holds default configuration values
  # TODO: check what can be removed from here
  module Configuration
    DEFAULT_ERROR_CALLBACK             = ->(err) { puts err.inspect }
    DEFAULT_CONNECT_CALLBACK           = ->(msg) { msg.inspect }
    DEFAULT_SSL                        = false
    DEFAULT_CONNECTION_PORT            = 80
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
    DEFAULT_TIMETOKEN                  = 0
    DEFAULT_ORIGIN                     = 'pubsub.pubnub.com'
    DEFAULT_PORT                       = 80
    DEFAULT_METHOD                     = 'GET'
    DEFAULT_CONTENT_TYPE               = 'application/json'
    DEFAULT_PATH                       = '/'
    DEFAULT_PARAMS                     = {}
    DEFAULT_HEADERS                    = {}
    DEFAULT_SSL_SET                    = false
    DEFAULT_TIMEOUT                    = 5
    DEFAULT_ENCODING                   = nil
    DEFAULT_AUTO_RECONNECT             = true
    PERIODIC_TIMER_INTERVAL            = 0.25
    MAX_RETRIES                        = 10
    RETRIES_INTERVAL                   = 1
    DEFAULT_TTL                        = 1440
  end
end
