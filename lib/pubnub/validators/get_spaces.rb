# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for GetSpaces event
    module GetSpaces
      include CommonValidator

      def validate!
        return if @skip_validate
      end
    end
  end
end
