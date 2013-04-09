require 'eventmachine'

module EventMachine
  module Pubnub
    class Connection < EM::Connection

      def initialize(client, host, port)
        @client  = client
        @host    = host
        @port    = port
        @options = @client.options

        #TODO connect reconnectors
        @network_reconnector      = nil
        @application_reconnectior = nil
      end

      def network_failure?
        @response_code == 0
      end

      def gracefully_closed?
        @gracefully_closed
      end

      def immediate_reconnect?
        @immediate_reconnect
      end

      def auto_reconnect_on_close?
        auto_reconnect? && !gracefully_closed?
      end

      def ssl?
        @options[:ssl]
      end

      def update(options = {})
        @options.merge!(options)
      end

      def stop
        @auto_reconnect    = false
        @gracefully_closed = true
        close_connection
      end

      def immediate_reconnect
        @immediate_reconnect = true
        @gracefully_closed   = false
        close_connection
      end

      def shedule_reconnect
        if gracefully_closed?
          reconnect_after(0)
          @gracefully_closed = false
          return
        end

        begin
          @reconnector.increment do |timeout|
            reconnect_after(timeout)
          end
        rescue ReconnectLimitError => e
          invoke_callback(@client.max_reconnects_callback,
                          @reconnector.reconnect_timeout,
                          @reconnector.reconnect_count)
        end
      end

    end
  end
end

