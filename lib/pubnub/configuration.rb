module Pubnub
  module Configuration
    DEFAULT_SECRET_KEY         = 0
    DEFAULT_TIMETOKEN          = 0
    DEFAULT_ORIGIN             = 'pubsub.pubnub.com'
    DEFAULT_PORT               = 80
    DEFAULT_METHOD             = 'GET'
    DEFAULT_CONTENT_TYPE       = 'application/json'
    DEFAULT_PATH               = '/'
    DEFAULT_PARAMS             = {}
    DEFAULT_HEADERS            = {}
    DEFAULT_USER_AGENT         = "Pubnub Ruby #{PUBNUB_VERSION}"
    DEFAULT_SSL_SET            = false
    DEFAULT_TIMEOUT            = 5
    DEFAULT_ENCODING           = nil
    DEFAULT_AUTO_RECONNECT     = true
    DEFAULT_CALLBACK           = lambda { |data| puts data }
    DEFAULT_PUBLISH_KEY        = 'demo'
    DEFAULT_SUBSCRIBE_KEY      = 'demo'
    DEFAULT_CHANNEL            = 'hello_world'
    PERIODIC_TIMER             = 0.25
    RETRYING_TIME              = 310
    MAX_RETRIES                = 1.0/PERIODIC_TIMER*RETRYING_TIME
  end
end

