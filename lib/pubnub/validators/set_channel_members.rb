# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for SetChannelMembers event
    module SetChannelMembers
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_channel!
        validate_members!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for set channel members event.'),
          ':subscribe_key is required for set channel members event.'
        )
      end

      def validate_channel!
        return unless @channel.nil? || @channel.empty?

        raise(
          ArgumentError.new(object: self, message: ':channel is required for set channel members event.'),
          ':channel is required for set channel members event.'
        )
      end

      def validate_members!
        raise(
          ArgumentError.new(object: self, message: ':uuids is required for set channel members event.'),
          ':uuids is required for set channel members event.'
        ) if @uuids.nil? || @uuids.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuids parameter for set channel members must be Array.'),
          ':uuids parameter for set channel members must be Array.'
        ) if @uuids.class != Array

        acceptable_values = %w[String Symbol Float Integer TrueClass FalseClass]

        @uuids.each do |member|
          raise(
            ArgumentError.new(object: self, message: ':uuid is required for set channel members event.'),
            ':uuid is required for set channel members event.'
          ) if member[:uuid].nil? || member[:uuid].empty?

          next if member[:custom].nil?

          raise(
            ArgumentError.new(object: self, message: ':custom parameter of channel member must be Hash.'),
            ':custom parameter of channel member must be Hash.'
          ) if member[:custom].class != Hash

          # Verify that all values in member custom has expected data type.
          member[:custom].each do |key, value|
            unless acceptable_values.include?(value.class.to_s)
              message = "Value for '#{key}' has unacceptable type (#{value.class.to_s})." \
                        "Only following data types allowed: #{acceptable_values.join(", ")}"

              raise(ArgumentError.new(object: self, message: message), message)
            end
          end
        end
      end
    end
  end
end
