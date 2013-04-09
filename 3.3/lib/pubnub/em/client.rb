require 'pubnub/em/connection.rb'

module EventMachine
  module Pubnub
    class Client

      attr_accessor :connection, :options, :host, :port

      def self.connect(options = {})
        new(options).tap do |client|
          client.connect
        end
      end

      def initialize(options = {})
        @options = options #TODO add default options

        validate_client

        @host       = @options[:host]
        @port       = @options[:port]
        @connection = nil
      end

      def connect
        @connection = EM.connect(@host, @port, Connection, self, @host, @port)
      end

      def validate_client
        # TODO validation
      end
    end
  end
end

