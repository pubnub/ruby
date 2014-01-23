module Pubnub
  module Configuration
    DEFAULT_ERROR_CALLBACK             = lambda { |err| puts err.inspect }
    DEFAULT_CONNECT_CALLBACK           = lambda { |msg| puts msg.inspect }
    DEFAULT_SSL                        = false
    DEFAULT_CONNECTION_PORT            = 80
    DEFAULT_NON_SUBSCRIBE_TIMEOUT      = 310
    DEFAULT_SUBSCRIBE_TIMEOUT          = 310
    DEFAULT_RECONNECT_ATTEMPTS         = 10
    DEFAULT_RECONNECT_INTERVAL         = 10
    DEFAULT_RECONNECT_RESPONSE_TIMEOUT = 10
    DEFAULT_TIMETOKEN                  = 0
    DEFAULT_ORIGIN                     = 'pubsub.pubnub.com'
    DEFAULT_PORT                       = 80
    DEFAULT_METHOD                     = 'GET'
    DEFAULT_CONTENT_TYPE               = 'application/json'
    DEFAULT_PATH                       = '/'
    DEFAULT_PARAMS                     = {}
    DEFAULT_HEADERS                    = {}
    DEFAULT_USER_AGENT                 = "Pubnub Ruby #{VERSION}" # TODO: setup this
    DEFAULT_SSL_SET                    = false
    DEFAULT_TIMEOUT                    = 5
    DEFAULT_ENCODING                   = nil
    DEFAULT_AUTO_RECONNECT             = true
    DEFAULT_CALLBACK                   = lambda { |data| puts data }
    DEFAULT_CHANNEL                    = 'hello_world'
    PERIODIC_TIMER_INTERVAL            = 0.25
    MAX_RETRIES                        = 10
    RETRIES_INTERVAL                   = 1
    DEFAULT_TTL                        = 3600
  end
end

