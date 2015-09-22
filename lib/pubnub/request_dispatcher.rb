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

      @connection.receive_timeout = event.read_timeout
      @connection.send_timeout = event.open_timeout
      @connection.keep_alive_timeout = event.idle_timeout

      @connection.get(event.uri.to_s)
    end
  end
end


# attr_proxy(:connect_timeout, true)
# # Request sending timeout in sec.
# attr_proxy(:send_timeout, true)
# # Response receiving timeout in sec.
# attr_proxy(:receive_timeout, true)
# # Reuse the same connection within this timeout in sec. from last used.
# attr_proxy(:keep_alive_timeout, true)