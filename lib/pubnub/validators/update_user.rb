# Toplevel Pubnub module.
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

        if @user_id == nil
          raise(
              ArgumentError.new(
                  object: self,
                  message: 'data: Provide user_id.'
              ),
              'data: Provide user_id.'
          )
        end

      end

      def validate_data!
        data = @data

        if data == nil
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
end
