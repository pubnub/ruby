# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Publish event
    module ChannelRegistration
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_action!
      end

      private

      def validate_action!
        fail(
            ArgumentError.new,
            ':action is required for channel registration event.'
        ) if @action.nil?

        fail(
            ArgumentError.new(
                object: self,
                message: 'Invalid :action key. Valid action keys are: :add, :list_groups, :get, :remove key'
            ),
            'Invalid :action key. Valid action keys are: :add, :list_groups, :get, :remove key'
        ) unless [:add, :list_groups, :get, :remove, :list_namespaces].include?(@action.to_sym)
      end
    end
  end
end
