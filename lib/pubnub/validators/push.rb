# Toplevel Pubnub module.
require 'set'

module Pubnub
  module Validator
    # Push related events validator
    module Push
      include CommonValidator
      BASIC_PARAMS = %i[push_token type uuid].freeze
      PARAMS_MAP = {
        Pubnub::Constants::OPERATION_ADD_CHANNELS_TO_PUSH => BASIC_PARAMS + %i[add auth],
        Pubnub::Constants::OPERATION_LIST_PUSH_PROVISIONS => BASIC_PARAMS,
        Pubnub::Constants::OPERATION_REMOVE_CHANNELS_FROM_PUSH => BASIC_PARAMS + %i[remove auth],
        Pubnub::Constants::OPERATION_REMOVE_DEVICE_FROM_PUSH => BASIC_PARAMS - [:uuid]
      }.freeze

      def validate!
        return if @skip_validate

        validate_channel!
      end

      private

      def validate_channel!
        missing_params = required_params - @params.keys
        return if missing_params.empty?

        raise(
          ArgumentError.new(
            object: self,
            message: "Following params are required: #{missing_params}"
          ),
          "Following params are required: #{missing_params}"
        )
      end

      def required_params
        PARAMS_MAP[current_operation]
      end
    end
  end
end
