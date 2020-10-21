# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveMemberships event
    module RemoveMemberships
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_uuid!
        validate_memberships!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for remove memberships event.'),
          ':subscribe_key is required for remove memberships event.'
        )
      end

      def validate_uuid!
        return unless @uuid.nil? || @uuid.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuid is required for remove memberships event.'),
          ':uuid is required for remove memberships event.'
        )
      end

      def validate_memberships!
        raise(
          ArgumentError.new(object: self, message: ':channels is required for remove memberships event.'),
          ':channels is required for remove memberships event.'
        ) if @channels.nil? || @channels.empty?

        raise(
          ArgumentError.new(object: self, message: ':channels parameter for remove memberships must be Array.'),
          ':channels parameter for remove memberships must be Array.'
        ) if @channels.class != Array
      end
    end
  end
end
