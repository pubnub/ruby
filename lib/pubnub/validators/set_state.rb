# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for SetState event
    module SetState
      include CommonValidator

      def validate!
        return if @skip_validate
      end

      private
    end
  end
end
