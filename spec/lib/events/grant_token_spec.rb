require "spec_helper"

describe Pubnub::GrantToken do
  #it_behaves_like "an event"

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

    let(:envelope) do
      pubnub.grant_token(
        ttl: 60,
        authorized_uuid: "authorized_uuid",
        channels: {
          "id": Pubnub::Permissions.res(read: true)
        }
      ).value
    end

    it "works" do
      VCR.use_cassette("lib/events/grant-token", record: :once) do
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/grant-token-error", record: :once) do
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
