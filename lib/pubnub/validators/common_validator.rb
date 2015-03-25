# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Client object
    module CommonValidator
      # Validates given origin
      def validate_origin(origin, required = false)
        fail(
            InitializationError.new,
            'Missing required :origins_pool parameter.'
        ) if !origin && required

        fail(
            InitializationError.new,
            'origins_pool parameter is not valid. \
                   Should be type of Array.'
        ) unless origin.is_a?(Array) || origin.blank?
      end

      # Validates given subscribe key
      def validate_subscribe_key(subscribe_key, required = false)
        fail(
            InitializationError.new,
            'Missing required :subscribe_key parameter.'
        ) if !subscribe_key && required

        fail(
            InitializationError.new,
            'Subscribe key parameter is not valid. \
                   Should be type of String or Symbol.'
        ) unless [String, Symbol].include?(subscribe_key.class)
      end

      # Validates given publish key
      def validate_publish_key(publish_key, required = false)
        fail(
            InitializationError.new,
            'Missing required :subscribe_key parameter.'
        ) if !publish_key && required

        fail(
            InitializationError.new,
            'Publish key parameter is not valid. \
                   Should be type of String or Symbol.'
        ) unless [String, Symbol].include?(publish_key.class) ||
            publish_key.blank?
      end
    end
  end
end
