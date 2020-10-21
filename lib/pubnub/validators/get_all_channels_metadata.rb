# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for GetAllChannelsMetadata event
    module GetAllChannelsMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for get all channels metadata event.'),
          ':subscribe_key is required for get all channels metadata event.'
        )
      end
    end
  end
end
