# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for HereNow event
    module HereNow
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channel!
      end

      private

      def validate_channel!
        fail(
          ArgumentError.new(
            object: self,
            message: 'Invalid :channel. You can run HereNow globally or for a single channel at once.'
          ),
          'Invalid :channel. You can run HereNow globally or for a single channel at once.'
        ) if @channel.size > 1
      end
    end
  end
end
