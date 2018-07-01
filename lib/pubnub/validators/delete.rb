# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Grant event
    module Delete
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channel!
      end

      private

      def validate_channel!
        return unless @channel.blank? || @channel.index(',')
        raise(
          ArgumentError.new,
          'You have to call #delete on single channel'
        )
      end
    end
  end
end
