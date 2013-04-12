require 'eventmachine'
require 'http_parser'

require 'pubnub/em/request.rb'
require 'pubnub/em/response.rb'

module EventMachine
  module Pubnub
    class Connection < EM::Connection

      MAX_LINE_LENGTH = 1024*1024
      STALL_TIMER     = 10
      STALL_TIMEOUT   = 60

      def initialize(client, host, port)
        @client  = client
        @host    = host
        @port    = port
        @options = @client.options

        #TODO connect reconnectors
        @network_reconnector      = nil
        @application_reconnectior = nil

      end

      def connection_completed
        reset_connection

        @request = Request.new(@options)
        send_data(@request)
      end

      #def post_init
      #  @stall_timer = EM::PeriodicTimer.new(STALL_TIMER) do
      #    if gracefully_closed?
      #      @stall_timer.cancel
      #    elsif stalled?
      #      close_connection
      #      invoke_callback(@client.no_data_callback)
      #    end
      #  end
      #end

      def recive_data(data)
        @parser << data
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

      def stalled?
        @last_response ||= EM::Pubnub::Response.new
        @last_response.older_than?(STALL_TIMEOUT)
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

      def invoke_callback(callback, *args)
        callback.call(*args) if callback
      end

      def on_headers_complete(headers)
        @response_code = @parser.status_code
        @headers       = headers

        puts "GOT RESPONSE CODE #{@response_code}"

        if @response_code.to_i == 200

          return
        end

        # TODO handle error codes

      end

      def on_message_complete(msg)
        puts msg
      end

      def reset_connection
        @buffer              = BufferedTokenizer.new("\r", MAX_LINE_LENGTH)
        @parser              = Http::Parser.new(self)
        @last_response       = Response.new
        @response_code       = 0
        @gracefully_closed   = false
        @immediate_reconnect = false
        @auto_reconnect      = @options[:auto_reconnect]
      end

    end
  end
end

