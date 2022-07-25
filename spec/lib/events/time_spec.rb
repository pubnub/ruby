require "spec_helper"

describe Pubnub::Time do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end
    it "works" do
      VCR.use_cassette("lib/events/time", record: :once) do
        envelope = @pubnub.time.value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/time-error", record: :once) do
        envelope = @pubnub.time.value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
