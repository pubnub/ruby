# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for SetMemberships event
    module SetMemberships
      include CommonValidator

      def validate!
        return if @skip_validate

        validate_subscribe_key!
        validate_uuid!
        validate_memberships!
      end

      private

      def validate_subscribe_key!
        return unless @subscribe_key.nil?

        raise(
          ArgumentError.new(object: self, message: ':subscribe_key is required for set memberships event.'),
          ':subscribe_key is required for set memberships event.'
        )
      end

      def validate_uuid!
        return unless @uuid.nil? || @uuid.empty?

        raise(
          ArgumentError.new(object: self, message: ':uuid is required for set memberships event.'),
          ':uuid is required for set memberships event.'
        )
      end

      def validate_memberships!
        raise(
          ArgumentError.new(object: self, message: ':channels is required for set memberships event.'),
          ':channels is required for set memberships event.'
        ) if @channels.nil? || @channels.empty?

        raise(
          ArgumentError.new(object: self, message: ':channels parameter for set memberships must be Array.'),
          ':channels parameter for set memberships must be Array.'
        ) if @channels.class != Array

        acceptable_values = %w[String Symbol Float Integer TrueClass FalseClass]

        @channels.each do |membership|
          raise(
            ArgumentError.new(object: self, message: ':channel is required for set memberships event.'),
            ':channel is required for set memberships event.'
          ) if membership[:channel].nil? || membership[:channel].empty?

          next if membership[:custom].nil?

          raise(
            ArgumentError.new(object: self, message: ':custom parameter of membership must be Hash.'),
            ':custom parameter of membership must be Hash.'
          ) if membership[:custom].class != Hash

          # Verify that all values in membership 'custom' has expected data type.
          membership[:custom].each do |key, value|
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
