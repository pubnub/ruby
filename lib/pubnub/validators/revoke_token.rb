# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Grant event
    module RevokeToken
      include CommonValidator

      def validate!
        validate_keys!
        validate_token!
      end

      private

      def validate_keys!
        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for grant token event.'),
          ':subscribe_key is required for grant token event.'
        ) if @subscribe_key.nil? || @subscribe_key.empty?
      end

      def validate_token!
        raise(
          ArgumentError.new(object: self, message: ':ttl has to be kind of Integer for grant token event.'),
          ':ttl has to be kind of Integer for grant token event.'
        ) if @token.nil? || @token.empty?
      end
    end
  end
end
