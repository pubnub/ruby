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
    end

    def send_request(event)
      Pubnub.logger.debug('Pubnub') { "Sending request for #{event.class}" }

      @connection.read_timeout = event.read_timeout
      @connection.open_timeout = event.open_timeout
      @connection.idle_timeout = event.idle_timeout

      @connection.request(event.uri)
    end
  end
end
