# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for CreateSpace event
    module CreateSpace
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_data!
      end

      private

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

        if !data[:id] || !data[:name]
          raise(
              ArgumentError.new(
                  object: self,
                  message: 'data: Space\'s id or name missing.'
              ),
              'data: Space\'s id or name missing.'
          )
        end

      end
    end
  end
end
