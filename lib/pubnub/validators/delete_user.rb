# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for DeleteUser event
    module DeleteUser
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_user!
      end

      private

      def validate_user!
        return unless @user_id.nil?

        raise(
          ArgumentError.new(
            object: self,
            message: 'data: Provide user_id.'
          ),
          'data: Provide user_id.'
        )
      end
    end
  end
end
