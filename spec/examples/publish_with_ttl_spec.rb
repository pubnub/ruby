require 'helpers/spec_helper'

describe Pubnub::Publish do
  around :each do |example|
    @pubnub = Pubnub::Client.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  context "with specified ttl parameter" do
    it "adds it to url" do
      VCR.use_cassette("examples/publish-ttl-works", record: :once) do
        envelope = @pubnub.publish(channel: :demo, message: :whatever, ttl: 10, http_sync: true)

        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "ignores it when store is false" do
      VCR.use_cassette("examples/publish-ttl-works-ignore", record: :once) do
        envelope = @pubnub.publish(channel: :demo, message: :whatever, ttl: 10, store: false, http_sync: true)

        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
