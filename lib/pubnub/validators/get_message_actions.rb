# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for     module GetMessageActions event
    module GetMessageActions
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_channel!
      end

      private

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise ArgumentError, { message: ':channel is required for GetMessageAction event.' }
      end
    end
  end
end
