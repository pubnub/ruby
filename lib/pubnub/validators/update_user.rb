# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for UpdateUser event
    module UpdateUser
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_user!
        validate_data!
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

      def validate_data!
        return unless @data.nil?

        raise(
          ArgumentError.new(
            object: self,
            message: 'data: No data supplied.'
          ),
          'data: No data supplied.'
        )
      end
    end
  end
end
