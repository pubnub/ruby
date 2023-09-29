# Toplevel Pubnub module.
module Pubnub
  # Holds subscribe functionality, beware, most of subscribe functionality is
  # held by SubscribeEvent
  class Subscribe < SubscribeEvent
    include Concurrent::Async
    include Pubnub::Validator::Subscribe

    def initialize(options, app)
      @event = :subscribe

      # Override crypto module if custom cipher key has been used.
      random_iv = options.key?(:random_iv) ? options[:random_iv] : true
      options[:crypto_module] = Crypto::CryptoModule.new_legacy(options[:cipher_key], random_iv) if options[:cipher_key]

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
