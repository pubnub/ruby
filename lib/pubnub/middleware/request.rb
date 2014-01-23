module Pubnub
  module Middleware
    class Request < Faraday::Middleware
      def call(env)
        binding.pry
        @app.call(env)
      end

    end
  end
end