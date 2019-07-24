# frozen_string_literal: true

module Pubnub
  module Schemas
    module Envelope
      DataSchema = Dry::Schema.Params do
        required(:message)
        required(:subscribed_channel).filled(:str?)
        required(:actual_channel).filled(:str?)
        optional(:publish_time_object).maybe(:hash?)
        optional(:message_meta_data).maybe(:hash?)
        optional(:presence_event).maybe(:str?)
        optional(:presence).maybe do
          hash do
            optional(:uuid).filled(:str?)
            optional(:timestamp).filled(:int?)
            optional(:state).maybe(:hash?)
            optional(:occupancy).filled(:int?)
          end
        end
      end

      ConfigSchema = Dry::Schema.Params do
        required(:tls).filled(:bool?)
        required(:uuid).filled(:str?)
        optional(:auth_key).maybe(:str?)
        required(:origin).filled(:str?)
      end

      CategorySchema = Dry::Schema.Params do
        required(:category).filled
        required(:error).filled(:bool?)
      end

      # The schema for status response on subscribe listener
      class StatusSchema < Dry::Validation::Contract
        params do
          required(:code).filled(:int?)
          required(:client_request).filled
          required(:server_response).filled
          required(:auto_retried).filled(:bool?)

          required(:category_value).hash(CategorySchema)

          optional(:data).maybe(:hash?)
          optional(:current_timetoken).maybe(:int?)
          optional(:last_timetoken).maybe(:int?)
          optional(:subscribed_channels).maybe(:array?)
          optional(:subscribed_channel_groups).maybe(:array?)

          required(:config).hash(ConfigSchema)
        end

        rule(category_value: %i[error category]) do |error, category|
          error.true?.then(category.included_in?(Pubnub::Constants::STATUS_CATEGORY_ERRORS))
          error.false?.then(category.included_in?(Pubnub::Constants::STATUS_CATEGORY_SUCCESSES))
        end
      end

      # The schema for the publish result on a subscribe listener
      class ResultSchema < Dry::Validation::Contract
        params do
          required(:code).filled(:int?)
          required(:operation) { included_in?(Pubnub::Constants::OPERATIONS) }
          required(:client_request).filled
          required(:server_response).filled

          required(:data).maybe do
            hash(DataSchema)
          end
        end
      end
    end
  end
end
