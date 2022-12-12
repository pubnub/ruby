# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for RemoveMessageAction event
    module RemoveMessageAction
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_channel!
        validate_timetokens!
      end

      private

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise ArgumentError, { message: ':channel is required for RemoveMessageAction event.' }
      end

      def validate_timetokens!
        raise ArgumentError, {message:':message_timetoken is required for RemoveMessageAction event.'} if @message_timetoken.nil?
        raise ArgumentError, {message:':message_timetoken should be Numeric.'} unless @message_timetoken.is_a? Numeric
        raise ArgumentError, {message:':message_timetoken should be PubNub timetoken larger than 0.'} unless @message_timetoken.positive?

        raise ArgumentError, {message:':action_timetoken is required for RemoveMessageAction event.'} if @action_timetoken.nil?
        raise ArgumentError, {message:':action_timetoken should be Numeric.'} unless @action_timetoken.is_a? Numeric
        raise ArgumentError, {message:':action_timetoken should be PubNub timetoken larger than 0.'} unless @action_timetoken.positive?
      end
    end
  end
end
