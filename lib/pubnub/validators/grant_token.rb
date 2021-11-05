# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Grant event
    module GrantToken
      include CommonValidator

      def validate!
        validate_keys!
        validate_ttl!
        validate_permissions!(@uuids, ":uuids")
        validate_permissions!(@channels, ":channels")
        validate_permissions!(@channel_groups, ":uuids")
      end

      private

      def validate_keys!
        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for grant token event.'),
          ':subscribe_key is required for grant token event.'
        ) if @subscribe_key.nil? || @subscribe_key.empty?

        raise(
          ArgumentError.new(object: self, message: ':secret_key is required for grant token event.'),
          ':publish_key is required for grant token event.'
        ) if @secret_key.nil? || @secret_key.empty?
      end

      def validate_ttl!
        return unless !@ttl.nil? && !@ttl.is_a?(Integer)

        raise(
          ArgumentError.new(object: self, message: ':ttl has to be kind of Integer for grant token event.'),
          ':ttl has to be kind of Integer for grant token event.'
        )
      end

      def validate_permissions!(arg, name)
        return if arg.nil?

        raise(
          ArgumentError.new(object: self, message: ":#{name} has to be kind of Hash for grant token event."),
          ":#{name} has to be kind of Hash for grant token event."
        ) unless arg.is_a?(Hash)
      end
    end
  end
end

