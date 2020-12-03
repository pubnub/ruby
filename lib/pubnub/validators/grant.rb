# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Grant event
    module Grant
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_keys!
        validate_ttl!
        validate_uuids!
      end

      private

      def validate_keys!
        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for grant event.'),
          ':subscribe_key is required for grant event.'
        ) if @subscribe_key.nil? || @subscribe_key.empty?

        raise(
          ArgumentError.new(object: self, message: ':publish_key is required for grant event.'),
          ':publish_key is required for grant event.'
        ) if @publish_key.nil? || @publish_key.empty?
      end

      def validate_ttl!
        return unless !@ttl.nil? && !@ttl.is_a?(Integer)

        raise(
          ArgumentError.new(object: self, message: ':ttl has to be kind of Integer for grant event.'),
          ':ttl has to be kind of Integer for grant event.'
        )
      end

      def validate_uuids!
        return if @uuids.nil?

        raise(
          ArgumentError.new(object: self, message: ':uuid should not be empty for grant event.'),
          ':uuid should not be empty for grant event.'
        ) if @uuid.empty?

        raise(
          ArgumentError.new(object: self, message: ':auth_key required for grant event on uuids.'),
          ':uuid should not be empty for grant event on uuids.'
        ) if @auth_key.nil? || @auth_key.blank?

        raise(
          ArgumentError.new(object: self, message: ':uuid can\'t be used along with channel/channel_groups for grant event.'),
          ':uuid can\'t be used along with channel/channel_groups for grant event.'
        ) if !@channels.nil? || !@channel_groups.nil?
      end
    end
  end
end
