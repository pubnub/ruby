# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveChannelMembers event
    module RemoveChannelMembers
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_channel!
        validate_members!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for remove channel members event.'),
          ':subscribe_key is required for remove channel members event.'
        )
      end

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise(
          ArgumentError.new(object: self, message: ':channel is required for remove channel members event.'),
          ':channel is required for remove channel members event.'
        )
      end

      def validate_members!
        raise(
          ArgumentError.new(object: self, message: ':uuids is required for remove channel members event.'),
          ':uuids is required for remove channel members event.'
        ) if @uuids.nil? || @uuids.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuids parameter for remove channel members must be Array.'),
          ':uuids parameter for remove channel members must be Array.'
        ) if @uuids.class != Array
      end
    end
  end
end
