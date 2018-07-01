# Toplevel Pubnub module.
module Pubnub
  # Holds subscribe functionality, beware, most of subscribe functionality is
  # held by SubscribeEvent
  class Subscribe < SubscribeEvent
    include Concurrent::Async
    include Pubnub::Validator::Subscribe

    def initialize(options, app)
      @event = :subscribe
      super
      app.apply_state(self)
    end

    def clear_state
      @state = nil
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_SUBSCRIBE
    end
  end
end
