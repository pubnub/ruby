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
        fail(
            ArgumentError.new,
            'You have to call #delete on single channel'
        ) if @channel.blank? || @channel.index(',')
      end
    end
  end
end
