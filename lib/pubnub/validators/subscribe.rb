# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Subscribe event
    module Subscribe
      include CommonValidator

      def validate!
        return if @skip_validate
        # validate_channels!
      end

      private

      def validate_channels!
        fail(
          ArgumentError.new(
            object: self,
            message: 'You have to specify :channel or :group while using Subscribe event.'
          ),
          'You have to specify :channel or :group while using Subscribe event.'
        ) if @channel.size == 0 && @group.size == 0 && @wildcard_channel.size == 0
      end
    end
  end
end
