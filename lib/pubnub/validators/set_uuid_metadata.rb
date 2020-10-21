# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for SetUuidMetadata event
    module SetUuidMetadata
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_uuid!
        validate_metadata!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for set uuid metadata event.'),
          ':subscribe_key is required for set uuid metadata event.'
        )
      end

      def validate_uuid!
        return unless @uuid.nil? || @uuid.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuid is required for set uuid metadata event.'),
          ':uuid is required for set uuid metadata event.'
        )
      end

      def validate_metadata!
        raise(
          ArgumentError.new(object: self, message: ':metadata is required for set uuid metadata event.'),
          ':metadata is required for set uuid metadata event.'
        ) if @metadata.nil? || @metadata.empty?

        raise(
          ArgumentError.new(object: self, message: ':metadata parameter for set uuid metadata must be Hash.'),
          ':metadata parameter for set uuid metadata must be Hash.'
        ) if @metadata.class != Hash

        known_uuid_metadata_fields = %w[name email externalId profileUrl custom updated eTag]

        @metadata.each_key do |field_name|
          unless known_uuid_metadata_fields.include?(field_name.to_s)
            message = "Unknown uuid metadata key: '#{field_name}'. Only following keys allowed: #{known_uuid_metadata_fields.join(", ")}"

            raise(ArgumentError.new(object: self, message: message), message)
          end
        end
      end
    end
  end
end
