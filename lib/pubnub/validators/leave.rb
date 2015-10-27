# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Leave event
    module Leave
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_channel_and_group!
      end

      def validate_channel_and_group!
        fail(
            ArgumentError.new(
                object: self,
                message: 'You have to specify :channel or :group while using Leave event.'
            ),
            'You have to specify :channel or :group while using Leave event.'
        ) if @channel.size == 0 && @group.size == 0 && @wildcard_channel.size == 0
      end
    end
  end
end
