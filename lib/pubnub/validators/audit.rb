# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Audit event
    module Audit
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_auth_key!
      end

      private

      def validate_auth_key!
        return unless @channel.size > 1 && @auth.to_s.count(',') > 0
        raise(
          ArgumentError.new(
            object: self,
            message: 'Invalid :auth_key. You can\'t run audit for multiple channels and keys at once'
          ),
          'Invalid :auth_key. You can\'t run audit for multiple channels and keys at once'
        )
      end
    end
  end
end
