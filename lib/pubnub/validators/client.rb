# Toplevel Pubnub module.
module Pubnub
  # Validator module that holds all validators modules
  module Validator
    # Validator for Client object
    module Client
      class << self
        include CommonValidator

        def validate!(parameters)
          validate_origin parameters[:origin], true
          validate_subscribe_key parameters[:subscribe_key], true
          validate_publish_key parameters[:publish_key]
          validate_user_id parameters[:uuid]
        end
      end
    end
  end
end
