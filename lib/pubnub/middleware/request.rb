module Pubnub
  module Middleware
    class Request < Faraday::Middleware
      def call(env)
        @app.call(env)
      end

    end
  end
end