# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveUuidMetadata event
    module RemoveUuidMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_uuid!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for remove uuid metadata event.'),
          ':subscribe_key is required for remove uuid metadata event.'
        )
      end

      def validate_uuid!
        return unless @uuid.nil? || @uuid.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuid is required for remove uuid metadata event.'),
          ':uuid is required for remove uuid metadata event.'
        )
      end
    end
  end
end
