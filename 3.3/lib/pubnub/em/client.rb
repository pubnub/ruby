require 'pubnub/em/connection.rb'

module EventMachine
  module Pubnub
    class Client

      CALLBACKS = [
        :no_data_callback
      ]

      attr_accessor :connection, :options, :host, :port
      attr_accessor *CALLBACKS

      def self.connect(options = {})
        new(options).tap do |client|
          client.connect
        end
      end

      def initialize(options = {})
        @options = DEFAULT_CONNECTION_OPTIONS.merge(options)

        @options[:host] = DEFAULT_CONNECTION_OPTIONS[:host] if @options[:host].to_s.empty?

        validate_client

        @host       = @options[:host]
        @port       = @options[:port]

        @connection = nil

      end

      def connect
        @connection = EM.connect(@host, @port, Connection, self, @host, @port)
      end

      def each(&block)
        @each_item_callback = block
      end

      def on_error(&block)
        @error_callback = block
      end

      def on_no_data_recived(&block)
        @no_data_callback = block
      end

      def validate_client
        # TODO validation
      end
    end
  end
end

