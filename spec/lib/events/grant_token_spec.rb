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

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/grant-token-error", record: :once) do
        expect(envelope_with_objects.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope_with_objects.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
