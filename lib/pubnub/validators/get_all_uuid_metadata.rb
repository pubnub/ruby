# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for GetAllUuidMetadata event
    module GetAllUuidMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for get all uuid metadata event.'),
          ':subscribe_key is required for get all uuid metadata event.'
        )
      end
    end
  end
end
