# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules.
  module Validator
    # Validator for FetchMessages event.
    module FetchMessages
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_channel_or_channels!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for fetch messages event'),
          ':subscribe_key is required for fetch messages event'
        )
      end

      def validate_channel_or_channels!
        error_message = nil
        if @include_message_actions
          error_message = ":channels can't be used with :include_custom_message_type set to 'true'" unless @channels.nil?
          error_message = ":channel is required with :include_custom_message_type set to 'true'" if @channel.nil?
        elsif @channels.nil? || @channels.empty?
          error_message = ':channels is required for fetch message event'
        end

        raise(ArgumentError.new(object: self, message: error_message), error_message) unless error_message.nil?
      end
    end
  end
end
