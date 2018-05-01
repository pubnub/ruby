# Toplevel Pubnub module.
module Pubnub
  # That module holds default configuration values.
  module Configuration
    private

    def default_values
      {
        boot_celluloid: true,
        idle_timeout: Pubnub::Constants::DEFAULT_IDLE_TIMEOUT,
        open_timeout: Pubnub::Constants::DEFAULT_OPEN_TIMEOUT,
        origin: Pubnub::Constants::DEFAULT_ORIGIN,
        read_timeout: Pubnub::Constants::DEFAULT_READ_TIMEOUT,
        reconnect_attempts: Pubnub::Constants::DEFAULT_RECONNECT_ATTEMPTS,
        reconnect_interval: Pubnub::Constants::DEFAULT_RECONNECT_INTERVAL,
        region: Pubnub::Constants::DEFAULT_REGION,
        request_message_count_threshold: Pubnub::Constants::REQUEST_MESSAGE_COUNT_THRESHOLD,
        s_idle_timeout: Pubnub::Constants::DEFAULT_S_IDLE_TIMEOUT,
        s_open_timeout: Pubnub::Constants::DEFAULT_S_OPEN_TIMEOUT,
        s_read_timeout: Pubnub::Constants::DEFAULT_S_READ_TIMEOUT,
        s_send_timeout: Pubnub::Constants::DEFAULT_S_SEND_TIMEOUT,
        send_timeout: Pubnub::Constants::DEFAULT_SEND_TIMEOUT,
        ssl: Pubnub::Constants::DEFAULT_SSL,
      }
    end
  end
end
