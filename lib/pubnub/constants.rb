module Pubnub
  module Constants
    # Config constants
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
    DEFAULT_SSL                        = false

    # Envelope values
    # Errors
    STATUS_ACCESS_DENIED     = :access_denied
    STATUS_TIMEOUT           = :timeout
    STATUS_NON_JSON_RESPONSE = :non_json_response
    STATUS_API_KEY_ERROR     = :api_key_error

    # Successes
    STATUS_ACK = :ack

    STATUS_CATEGORY_ERRORS    = [STATUS_ACCESS_DENIED, STATUS_TIMEOUT, STATUS_NON_JSON_RESPONSE, STATUS_API_KEY_ERROR]
    STATUS_CATEGORY_SUCCESSES = [STATUS_ACK]

    # Operations
    OPERATION_SUBSCRIBE                          = :subscribe
    OPERATION_HEARTBEAT_SERVER                   = :heartbeat_server
    OPERATION_PRESENCE                           = :presence
    OPERATION_TIME                               = :time
    OPERATION_HISTORY                            = :history
    OPERATION_HERE_NOW                           = :here_now
    OPERATION_GLOBAL_HERE_NOW                    = :global_here_now
    OPERATION_GET_STATE                          = :get_state
    OPERATION_LIST_ALL_CHANNEL_GROUPS            = :list_all_channel_groups
    OPERATION_LIST_ALL_CHANNELS_IN_CHANNEL_GROUP = :list_all_channels_in_channel_group

    OPERATIONS = [
        OPERATION_SUBSCRIBE, OPERATION_HEARTBEAT_SERVER, OPERATION_PRESENCE, OPERATION_TIME, OPERATION_HISTORY,
        OPERATION_HERE_NOW, OPERATION_GLOBAL_HERE_NOW, OPERATION_GET_STATE, OPERATION_LIST_ALL_CHANNEL_GROUPS,
        OPERATION_LIST_ALL_CHANNELS_IN_CHANNEL_GROUP
    ]
  end
end