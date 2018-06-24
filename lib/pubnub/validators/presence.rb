# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Presence event
    module Presence
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channels!
      end

      private

      def validate_channels!
        if @channel.empty? && @group.empty? && @wildcard_channel.empty?
          raise(
            ArgumentError.new(
              object: self,
              message: 'You have to specify :channel or :group while using Presence event.'
            ),
            'You have to specify :channel or :group while using Presence event.'
          )
        end
      end
    end
  end
end
