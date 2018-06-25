# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for ChannelRegistration event
    module ChannelRegistration
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_action!
      end

      private

      def validate_action!
        validate_action_presence!
        validate_action_correctness!
      end

      def validate_action_presence!
        return unless @action.nil?
        raise(
          ArgumentError.new,
          ':action is required for channel registration event.'
        )
      end

      def validate_action_correctness!
        return if %i[add list_groups get remove list_namespaces].include?(@action.to_sym)
        raise(
          ArgumentError.new(
            object: self,
            message: 'Invalid :action key. Valid action keys are: :add, :list_groups, :get, :remove key'
          ),
          'Invalid :action key. Valid action keys are: :add, :list_groups, :get, :remove key'
        )
      end
    end
  end
end
