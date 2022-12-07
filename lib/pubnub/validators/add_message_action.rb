# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for AddMessageAction event
    module AddMessageAction
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_channel!
        validate_type!
        validate_value!
        validate_timetoken!
      end

      private

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise ArgumentError, { message: ':channel is required for AddMessageAction event.' }
      end

      def validate_type!
        if @type.is_a? String
          raise ArgumentError, {message:':type is required for AddMessageAction event.'} if @type.empty?
        else
          raise ArgumentError, {message:':type should be String.'}
        end
        raise ArgumentError, {message:':type should be not longer than 15 characters.'} unless @type.length <= 15
      end

      def validate_value!
        if @value.is_a? String
          raise ArgumentError, {message:':value is required for AddMessageAction event.'} if @type.empty?
        else
          raise ArgumentError, {message:':value should be String.'}
        end
        raise ArgumentError, {message:':value should be String.'} unless @value.is_a? String
      end

      def validate_timetoken!
        raise ArgumentError, {message:':message_timetoken is required for AddMessageAction event.'} if @message_timetoken.nil?
        raise ArgumentError, {message:':message_timetoken should be Numeric.'} unless @message_timetoken.is_a? Numeric
        raise ArgumentError, {message:':message_timetoken should be PubNub timetoken larger than 0.'} unless @message_timetoken.positive?
      end
    end
  end
end
