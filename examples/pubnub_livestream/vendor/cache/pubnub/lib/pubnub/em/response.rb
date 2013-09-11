module EventMachine
  module Pubnub
    class Response
      def initialize

      end

      def older_than?(seconds)
        @timestamp ||= Time.now

        age > seconds
      end

      private

      def age
        Time.now - @timestamp
      end
    end
  end
end
