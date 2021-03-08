# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    private

    def default_values
      { origin: Pubnub::Constants::DEFAULT_ORIGIN,
        open_timeout: Pubnub::Constants::DEFAULT_OPEN_TIMEOUT,
        read_timeout: Pubnub::Constants::DEFAULT_READ_TIMEOUT,
        idle_timeout: Pubnub::Constants::DEFAULT_IDLE_TIMEOUT,
        s_open_timeout: Pubnub::Constants::DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: Pubnub::Constants::DEFAULT_S_READ_TIMEOUT,
        s_idle_timeout: Pubnub::Constants::DEFAULT_S_IDLE_TIMEOUT,
        reconnect_attempts: Pubnub::Constants::DEFAULT_RECONNECT_ATTEMPTS,
        reconnect_interval: Pubnub::Constants::DEFAULT_RECONNECT_INTERVAL,
        region: Pubnub::Constants::DEFAULT_REGION,
        ssl: Pubnub::Constants::DEFAULT_SSL,
        random_iv: Pubnub::Constants::DEFAULT_USE_RANDOM_IV,
        request_message_count_threshold: Pubnub::Constants::REQUEST_MESSAGE_COUNT_THRESHOLD }
    end
  end
end
