# Toplevel Pubnub module
module Pubnub
  # Stop class, just for internal messaging
  module Message
    class InternalMessage; end

    # Used to letting terminator to kill the actor
    class Done < InternalMessage
      attr_reader :actor

      def initialize(actor)
        @actor = actor
      end
    end

    # Used to stopping events
    class Stop < InternalMessage
      attr_reader :reason

      def initialize(reason = nil)
        @reason = reason
      end
    end

    # Used to add new subscription to currently running one
    class AddSubscription < InternalMessage
      attr_reader :event

      def initialize(event)
        @event = event
      end
    end

    # Used to remove parts of subscription
    class RemoveSubscription < InternalMessage
      attr_reader :event

      def initialize(event)
        @event = event
      end
    end
  end
end
