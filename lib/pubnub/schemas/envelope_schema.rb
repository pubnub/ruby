module Pubnub
  module Schemas
    module Envelope
      DataSchema = Dry::Validation.Schema do
        required(:message)
        required(:subscribed_channel).filled(:str?)
        required(:actual_channel).filled(:str?)
        optional(:publish_time_object).maybe(:hash?)
        optional(:message_meta_data).maybe(:hash?)
        optional(:presence_event).maybe(:str?)
        optional(:presence).maybe.schema do
          optional(:uuid).filled(:str?)
          optional(:timestamp).filled(:int?)
          optional(:state).maybe(:hash?)
          optional(:occupancy).filled(:int?)
        end
      end

      ConfigSchema = Dry::Validation.Schema do
        required(:tls).filled(:bool?)
        required(:uuid).filled(:str?)
        optional(:auth_key).maybe(:str?)
        required(:origin).filled(:str?)
      end

      StatusSchema = Dry::Validation.Schema do
        required(:code).filled(:int?)
        required(:client_request).filled
        required(:server_response).filled
        optional(:data).maybe
        required(:category).filled
        required(:error).filled(:bool?)
        required(:auto_retried).filled(:bool?)

        optional(:current_timetoken).maybe(:int?)
        optional(:last_timetoken).maybe(:int?)
        optional(:subscribed_channels).maybe(:array?)
        optional(:subscribed_channel_groups).maybe(:array?)

        required(:config).schema(ConfigSchema)

        rule(category_value: [:error, :category]) do |error, category|
          error.true?.then(category.included_in?(Pubnub::Constants::STATUS_CATEGORY_ERRORS))
          error.false?.then(category.included_in?(Pubnub::Constants::STATUS_CATEGORY_SUCCESSES))
        end
      end

      ResultSchema = Dry::Validation.Schema do
        required(:code).filled(:int?)
        required(:operation) { included_in?(Pubnub::Constants::OPERATIONS) }
        required(:client_request).filled
        required(:server_response).filled

        required(:data).maybe.schema(DataSchema)
      end
    end
  end
end
