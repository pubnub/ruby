# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for History event
    module History
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channel!
      end

      private

      def validate_channel!
        return unless @channel.size > 1
        raise(
          ArgumentError.new(
            object: self,
            message: 'Invalid :channel. You can run History for a single channel at once.'
          ),
          'Invalid :channel. You can run History for a single channel at once.'
        )
      end
    end
  end
end
