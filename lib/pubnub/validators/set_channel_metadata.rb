# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for SetChannelMetadata event
    module SetChannelMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_channel!
        validate_metadata!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for set channel metadata event.'),
          ':subscribe_key is required for set channel metadata event.'
        )
      end

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise(
          ArgumentError.new(object: self, message: ':channel is required for set channel metadata event.'),
          ':channel is required for set channel metadata event.'
        )
      end

      def validate_metadata!
        raise(
          ArgumentError.new(object: self, message: ':metadata is required for set channel metadata event.'),
          ':metadata is required for set channel metadata event.'
        ) if @metadata.nil? || @metadata.empty?

        raise(
          ArgumentError.new(object: self, message: ':metadata parameter for set channel metadata must be Hash.'),
          ':metadata parameter for set channel metadata must be Hash.'
        ) if @metadata.class != Hash

        known_channel_metadata_fields = %w[name description custom updated eTag]

        @metadata.each_key do |field_name|
          unless known_channel_metadata_fields.include?(field_name.to_s)
            message = "Unknown channel metadata key: '#{field_name}'. Only following keys allowed: #{known_channel_metadata_fields.join(", ")}"

            raise(ArgumentError.new(object: self, message: message), message)
          end
        end
      end
    end
  end
end
