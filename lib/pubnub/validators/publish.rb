# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Publish event
    module Publish
      include CommonValidator

      def validate!
        fail(
            ArgumentError.new,
            ':store parameter invalid (should be true or false).'
        ) unless @store.nil? || [true, false].include?(@store)
      end
    end
  end
end
