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
        validate_meta!
      end

      private

      def validate_publish_key!
        if @publish_key.nil?
          raise(
            ArgumentError.new,
            ':publish_key is required for publish event.'
          )
        end
      end

      def validate_store!
        unless @store.nil? || [true, false].include?(@store)
          raise(
            ArgumentError.new,
            ':store parameter invalid (should be true or false).'
          )
        end
      end

      def validate_channel!
        if @channel.nil? || @channel.empty?
          raise(
            ArgumentError.new,
            ':channel is required for publish event.'
          )
        end
      end

      def validate_message!
        if @message.nil?
          raise(
            ArgumentError.new,
            ':message is required for publish event.'
          )
        end
      end

      def validate_meta!
        if !@meta.nil? && @meta.class != Hash
          raise(
            ArgumentError.new,
            ':meta parameter must me hash.'
          )
        end
      end
    end
  end
end
