# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for UpdateSpace event
    module UpdateSpace
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_space!
        validate_data!
      end

      private

      def validate_space!

        if @space_id == nil
          raise(
              ArgumentError.new(
                  object: self,
                  message: 'data: Provide space_id.'
              ),
              'data: Provide space_id.'
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
