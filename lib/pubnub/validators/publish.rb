# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Publish event
    module Publish
      include CommonValidator

      def validate!
        return if @skip_validate
        validate_publish_key!
        validate_channel!
        validate_message!
        validate_store!
      end

      private

      def validate_publish_key!
        fail(
          ArgumentError.new,
          ':publish_key is required for publish event.'
        ) if @publish_key.nil?
      end

      def validate_store!
        fail(
          ArgumentError.new,
          ':store parameter invalid (should be true or false).'
        ) unless @store.nil? || [true, false].include?(@store)
      end

      def validate_channel!
        fail(
          ArgumentError.new,
          ':channel is required for publish event.'
        ) if @channel.nil? || @channel.empty?
      end

      def validate_message!
        fail(
          ArgumentError.new,
          ':message is required for publish event.'
        ) if @message.nil?
      end
    end
  end
end
