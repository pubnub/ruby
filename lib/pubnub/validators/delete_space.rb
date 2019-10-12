# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for DeleteSpace event
    module DeleteSpace
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_space!
      end

      private

      def validate_space!
        return unless @space_id.nil?

        raise(
          ArgumentError.new(
            object: self,
            message: 'data: Provide space_id.'
          ),
          'data: Provide space_id.'
        )
      end
    end
  end
end
