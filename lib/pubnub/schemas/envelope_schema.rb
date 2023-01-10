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

      PresenceSchema = Dry::Schema.Params do
        required(:channels).maybe(:array?)
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
          required(:category).filled
          required(:error).filled(:bool?)
          required(:client_request).filled
          required(:server_response).filled
          required(:auto_retried).filled(:bool?)

          optional(:data).maybe(:hash?)
          optional(:current_timetoken).maybe(:int?)
          optional(:last_timetoken).maybe(:int?)
          optional(:subscribed_channels).maybe(:array?)
          optional(:subscribed_channel_groups).maybe(:array?)

          required(:config).hash(ConfigSchema)
        end

        rule(:category, :error) do
          key.failure('Invalid error category') if values[:error] && Pubnub::Constants::STATUS_CATEGORY_ERRORS.include?(values[:category].to_s)
          key.failure('Invalid success category') if !values[:error] && Pubnub::Constants::STATUS_CATEGORY_SUCCESSES.include?(values[:category].to_s)
        end
      end

      # The schema for the publish result on a subscribe listener
      class ResultSchema < Dry::Validation::Contract
        params do
          required(:code).filled(:int?)
          required(:operation) { included_in?(Pubnub::Constants::OPERATIONS) }
          required(:client_request).filled
          required(:server_response).filled

          optional(:data)
        end

        rule(:operation, :data) do
          if values[:operation] == Pubnub::Constants::OPERATION_PRESENCE
            PresenceSchema.call(values[:data])
          else
            DataSchema.call(values[:data])
          end
        end
      end
    end
  end
end
