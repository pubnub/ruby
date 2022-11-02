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
          ArgumentError.new(object: self, message: ':subscribe_key is required for revoke token event.'),
          ':subscribe_key is required for grant token event.'
        ) if @subscribe_key.nil? || @subscribe_key.empty?
      end

      def validate_token!
        raise(
          ArgumentError.new(object: self, message: ':token is required for revoke token event.'),
          ':token is required for revoke token event.'
        ) if @token.nil? || @token.empty?
      end
    end
  end
end
