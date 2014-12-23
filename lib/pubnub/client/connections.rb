# Toplevel Pubnub module
module Pubnub
  # Pubnub client Class
  class Client
    # Module that holds methods that helps us with connections
    # management. Must be plugged into Client class, uses @env
    module Connections
      def setup_conn_for(event)
        # TODO: DOCUMENT BREAKING CHANGE: TIMEOUTS
        if event.is_a? SingleEvent
          setup_conn_for_single_event(event)
        elsif event.is_a? SubscribeEvent
          setup_conn_for_subscribe_event(event)
        end
      end

      def setup_conn_for_single_event(event)
        conn = Net::HTTP::Persistent.new "pn_client_v#{Pubnub::VERSION}"
        conn.proxy_from_env
        conn.read_timeout       = event.read_timeout || @env[:read_timeout]
        conn.open_timeout       = event.open_timeout || @env[:open_timeout]
        conn.idle_timeout       = event.idle_timeout || @env[:idle_timeout]
        @env[:single_event_conn_pool][event.origin] = conn
      end

      def setup_conn_for_subscribe_event(event)
        conn = Net::HTTP::Persistent.new "pn_client_v#{Pubnub::VERSION}"
        conn.proxy_from_env
        conn.read_timeout       = event.read_timeout || @env[:s_read_timeout]
        conn.open_timeout       = event.open_timeout || @env[:s_open_timeout]
        conn.idle_timeout       = event.idle_timeout || @env[:s_idle_timeout]
        @env[:subscribe_event_conn_pool][event.origin] = conn
      end

      def setup_conn_for_heartbeat_event(event)
        conn = Net::HTTP::Persistent.new "pn_client_v#{Pubnub::VERSION}"
        conn.proxy_from_env
        conn.read_timeout       = event.read_timeout || @env[:h_read_timeout]
        conn.open_timeout       = event.open_timeout || @env[:h_open_timeout]
        conn.idle_timeout       = event.idle_timeout || @env[:h_idle_timeout]
        @env[:heartbeat_event_conn_pool][event.origin] = conn
      end

      def connection_for(event)
        if event.is_a? SingleEvent
          @env[:single_event_conn_pool][event.origin] ||
              setup_conn_for(event)
        elsif event.is_a? SubscribeEvent
          @env[:subscribe_event_conn_pool][event.origin] ||
              setup_conn_for(event)
        elsif event.is_a? HeartbeatEvent
          @env[:heartbeat_event_conn_pool][event.origin] ||
              setup_conn_for(event)
        else
          fail(Pubnub::Error.new(
                  env: @env,
                  operation: 'Pubnub.client#connection_for',
                  app: self,
                  error_type: 'Internal Error',
                  message: 'Can\'t recognize event'
              ), 'Can\'t recognize event')
        end
      end
    end
  end
end
