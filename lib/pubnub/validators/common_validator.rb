# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Client object
    module CommonValidator
      # Validates given origin
      def validate_origin(origin, required = false)
        if !origin && required
          raise(
            InitializationError.new,
            'Missing required :origins_pool parameter.'
          )
        elsif !(origin.is_a?(String) || origin.blank?)
          raise(
            InitializationError.new,
            'origins_pool parameter is not valid. \
                   Should be type of String.'
          )
        end
      end

      # Validates given subscribe key
      def validate_subscribe_key(subscribe_key, required = false)
        if !subscribe_key && required
          raise(
            InitializationError.new,
            'Missing required :subscribe_key parameter.'
          )
        elsif ![String, Symbol].include?(subscribe_key.class)
          raise(
            InitializationError.new,
            'Subscribe key parameter is not valid. \
                   Should be type of String or Symbol.'
          )
        end
      end

      # Validates given publish key
      def validate_publish_key(publish_key, required = false)
        if !publish_key && required
          raise(
            InitializationError.new,
            'Missing required :subscribe_key parameter.'
          )
        elsif !([String, Symbol].include?(publish_key.class) ||
               publish_key.blank?)
          raise(
            InitializationError.new,
            'Publish key parameter is not valid. \
                   Should be type of String or Symbol.'
          )
        end
      end
    end
  end
end
