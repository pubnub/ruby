require 'helpers/spec_helper'

describe Pubnub::GrantToken do
  # it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      allow_any_instance_of(Pubnub::GrantToken).to receive(:current_time).and_return 1635159481
      allow_any_instance_of(Pubnub::GrantToken).to receive(:super_admin_signature).and_return "v2.yZaPGX91wlB3GD03L8BdyJVNmMT6uJMsgpLitWSRPm8"
    end

    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        secret_key: "sec-a-mock-key",
        user_id: "ruby-test-user_id",
      )
    end

    let(:envelope_with_objects) do
      pubnub.grant_token(
        ttl: 60,
        authorized_uuid: "authorized_uuid",
        channels: {
          "id": Pubnub::Permissions.res(read: true)
        }
      ).value
    end

    let(:envelope_with_entities) do
      pubnub.grant_token(
        ttl: 60,
        authorized_uuid: "authorized_uuid",
        spaces_permissions: {
          "id": Pubnub::Permissions.res(read: true)
        }
      ).value
    end

    it "raises error when mixing objects and entities" do
      expect { pubnub.grant_token(
        ttl: 60,
        authorized_uuid: "authorized_uuid",
        spaces_permissions: {
          "id": Pubnub::Permissions.res(read: true)
        },
        channels: {
          "id": Pubnub::Permissions.res(read: true)
        }
      ).value }.to raise_error(Pubnub::ArgumentError)
    end

    it "works with objects" do
      VCR.use_cassette("lib/events/grant-token", record: :once) do
        expect(envelope_with_objects.is_a?(Pubnub::ErrorEnvelope)).to eq false
        expect(envelope_with_objects.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope_with_objects.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it "works with entities" do
      VCR.use_cassette("lib/events/grant-token", record: :once) do
        expect(envelope_with_entities.is_a?(Pubnub::ErrorEnvelope)).to eq false
        expect(envelope_with_entities.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope_with_entities.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    context "with categories" do
      let(:body_matching_options) do
        {
          record: :none,
          match_requests_on: VCR.configuration.default_cassette_options[:match_requests_on] + [:body]
        }
      end

      it "builds category permissions with GET bitmask" do
        expect(Pubnub::Permissions.cat(get: true).calculate_bitmask).to eq 32
        expect(Pubnub::Permissions.cat(get: true).type).to eq :category
        expect(Pubnub::Permissions.cat.calculate_bitmask).to eq 0
      end

      it "sends categories along with resources" do
        VCR.use_cassette("lib/events/grant-token-categories", **body_matching_options) do
          envelope = pubnub.grant_token(
            ttl: 60,
            authorized_uuid: "authorized_uuid",
            channels: {
              "id": Pubnub::Permissions.res(read: true)
            },
            categories: {
              channels: Pubnub::Permissions.cat(get: true),
              uuids: Pubnub::Permissions.cat(get: true)
            }
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "sends categories only" do
        VCR.use_cassette("lib/events/grant-token-categories", **body_matching_options) do
          envelope = pubnub.grant_token(
            ttl: 60,
            authorized_uuid: "authorized_uuid",
            categories: {
              "uuids" => Pubnub::Permissions.cat(get: true)
            }
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "sends ttl and a single category without authorized uuid" do
        VCR.use_cassette("lib/events/grant-token-categories", **body_matching_options) do
          envelope = pubnub.grant_token(
            ttl: 60,
            categories: {
              channels: Pubnub::Permissions.cat(get: true)
            }
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "raises error for unsupported category key" do
        expect { pubnub.grant_token(
          ttl: 60,
          categories: { groups: Pubnub::Permissions.cat(get: true) }
        ).value }.to raise_error(Pubnub::ArgumentError)
      end

      it "raises error for non-category permissions" do
        expect { pubnub.grant_token(
          ttl: 60,
          categories: { channels: Pubnub::Permissions.res(get: true) }
        ).value }.to raise_error(Pubnub::ArgumentError)
      end

      it "raises error when categories is not a Hash" do
        expect { pubnub.grant_token(
          ttl: 60,
          categories: "channels"
        ).value }.to raise_error(Pubnub::ArgumentError)
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/grant-token-error", record: :once) do
        expect(envelope_with_objects.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope_with_objects.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
