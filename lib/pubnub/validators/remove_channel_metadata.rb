# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveChannelMetadata event
    module RemoveChannelMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_channel!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for remove channel metadata event.'),
          ':subscribe_key is required for remove channel metadata event.'
        )
      end

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise(
          ArgumentError.new(object: self, message: ':channel is required for remove channel metadata event.'),
          ':channel is required for remove channel metadata event.'
        )
      end
    end
  end
end
