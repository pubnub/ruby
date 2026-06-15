require 'helpers/spec_helper'

describe "timeout" do
  context "in single event" do
    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end
    let(:envelope) { pubnub.time.value }

    it "forms valid ErrorEnvelope on HTTPX::TimeoutError" do
      allow_any_instance_of(Pubnub::HttpDispatcher).to receive(:get).and_raise(HTTPX::TimeoutError.new(nil, "timeout"))

      expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
      expect(envelope.status[:code]).to eq 408
      expect(envelope.status[:category]).to eq Pubnub::Constants::STATUS_TIMEOUT
      expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
    end
  end
end
