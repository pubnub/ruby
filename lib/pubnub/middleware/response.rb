module Pubnub
  module Middleware
    class Response < Faraday::Response::Middleware

      def on_complete(env)
        $logger.debug("FARADAY: RESPONSE FROM: #{env[:url].to_s}")
      end
    end
  end
end