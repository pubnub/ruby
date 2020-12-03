# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveDeviceFromPush event
    module RemoveDeviceFromPush
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_push_token!
        validate_push_gateway!
        validate_topic! if @push_gateway.eql? 'apns2'
      end

      private

      def validate_push_token!
        return unless @push_token.nil? || @push_token.empty?
        raise(
          ArgumentError.new,
          ':push_token is required for RemoveDeviceFromPush event.'
        )
      end

      def validate_push_gateway!
        return unless @push_gateway.nil? || @push_gateway.empty?
        raise(
          ArgumentError.new,
          ':push_gateway is required for RemoveDeviceFromPush event.'
        )
      end

      def validate_topic!
        return unless @topic.nil? || @topic.empty?
        raise(
          ArgumentError.new,
          ':topic is required for RemoveDeviceFromPush event.'
        )
      end
    end
  end
end
