module Pubnub
  module Schemas
    module Envelope
      DataSchema = Dry::Validation.Schema do
        key(:message).required
        key(:subscribed_channel).required(:str?)
        key(:actual_channel).required(:str?)
        key(:publish_time_object).maybe(:hash?)
        key(:message_meta_data).maybe(:hash?)
        key(:presence_event).maybe(:str?)
        key(:presence).maybe.schema do
          key(:uuid).required(:str?)
          key(:timestamp).required(:int?)
          key(:state).maybe(:hash?)
          key(:occupancy).required(:int?)
        end
      end

      ConfigSchema = Dry::Validation.Schema do
        key(:tls).required(:bool?)
        key(:uuid).required(:str?)
        key(:auth_key).maybe(:str?)
        key(:origin).required(:str?)
      end

      StatusSchema = Dry::Validation.Schema do
        key(:code).required(:int?)
        key(:client_request).required
        key(:server_response).required
        key(:data).maybe
        key(:category).required
        key(:error).required(:bool?)
        key(:auto_retried).required(:bool?)

        key(:current_timetoken).maybe(:int?)
        key(:last_timetoken).maybe(:int?)
        key(:subscribed_channels).maybe(:array?)
        key(:subscribed_channel_groups).maybe(:array?)

        key(:config).schema(ConfigSchema)

        rule(category_value: [:error, :category]) do |error, category|
          error.true?.then(category.inclusion?(Pubnub::Constants::STATUS_CATEGORY_ERRORS))
          error.false?.then(category.inclusion?(Pubnub::Constants::STATUS_CATEGORY_SUCCESSES))
        end
      end

      ResultSchema = Dry::Validation.Schema do
        key(:code).required(:int?)
        key(:operation) { inclusion?(Pubnub::Constants::OPERATIONS) }
        key(:client_request).required
        key(:server_response).required

        key(:data).maybe.schema(DataSchema)
      end
    end
  end
end