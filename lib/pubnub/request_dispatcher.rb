# Toplevel Pubnub module.
module Pubnub
  # Request actor configures request to send and sends it.
  class RequestDispatcher
    include Celluloid

    def initialize
      @connection = HTTPClient.new

      Pubnub.logger.debug('Pubnub') { 'Created new Request' }
    end

    def send_request(event)
      Pubnub.logger.debug('Pubnub') { "Sending request for #{event.class}" }

      # @connection.read_timeout = event.read_timeout
      # @connection.open_timeout = event.open_timeout
      # @connection.idle_timeout = event.idle_timeout

      @connection.get(event.uri.to_s)
    end
  end
end
