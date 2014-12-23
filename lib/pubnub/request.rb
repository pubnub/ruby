# Toplevel Pubnub module
module Pubnub
  # Request actor that sends requests and sends back responses to actors as
  # messages
  class Request
    include Celluloid

    def initialize
      Pubnub.logger.debug('Pubnub') { 'Created new Request' }

      @connection = Net::HTTP::Persistent.new 'PubNub'
      @connection.proxy_from_env

      async.wait_for_event
    end

    def wait_for_event
      loop do
        Pubnub.logger.debug('Pubnub') { 'Waiting for event' }

        event = receive { |msg| msg.is_a? Event }

        @connection.read_timeout = event.read_timeout
        @connection.open_timeout = event.open_timeout
        @connection.idle_timeout = event.idle_timeout

        response = @connection.request(event.uri)

        event.mailbox << response

        Pubnub.logger.debug('Pubnub') { 'Sent response back to event' }
      end
    end
  end
end
