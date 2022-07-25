require "spec_helper"

describe Pubnub::Signal do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "demo",
        publish_key: "demo",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end
    it "works" do
      VCR.use_cassette("lib/events/signal", record: :once) do
        envelope = @pubnub.signal(
          channel: :demo,
          message: "whatever",
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/signal-error", record: :once) do
        envelope = @pubnub.signal(
          channel: :demo,
          message: "0" * 50
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end

end
