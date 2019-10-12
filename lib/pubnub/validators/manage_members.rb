# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for ManageMembers event
    module ManageMembers
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_space!
        validate_data!
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
