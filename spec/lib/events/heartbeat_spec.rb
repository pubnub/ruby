require "spec_helper"

describe Pubnub::Heartbeat do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end

    it "works with subscribe" do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "demo",
        publish_key: "demo",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
        heartbeat: "10",
      )

      expect(@pubnub.current_heartbeat).to eq 10
      @pubnub.heartbeat = 3
      expect(@pubnub.current_heartbeat).to eq 3

      VCR.use_cassette("lib/events/heartbeat-sub", record: :once) do
        @pubnub.subscribe(channel: :demo)
        sleep(1)
      end
    end

    it "works" do
      VCR.use_cassette("lib/events/heartbeat", record: :once) do
        envelope = @pubnub.heartbeat(
          channel: :demo,
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/heartbeat-error", record: :once) do
        envelope = @pubnub.heartbeat(
          channel: :demo,
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end
