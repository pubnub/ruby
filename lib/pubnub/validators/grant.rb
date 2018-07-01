# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Grant event
    module Grant
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_ttl!
      end

      private

      def validate_ttl!
        return unless !@ttl.nil? && !@ttl.is_a?(Integer)
        raise(
          ArgumentError.new,
          ':ttl has to be kind of Integer'
        )
      end
    end
  end
end
