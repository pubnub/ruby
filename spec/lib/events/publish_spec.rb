require "spec_helper"

describe Pubnub::Publish do
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
    it "works" do
      VCR.use_cassette("lib/events/publish", record: :once) do
        envelope = @pubnub.publish(
          channel: :demo,
          message: "whatever",
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/publish-error", record: :once) do
        envelope = @pubnub.publish(
          channel: :demo,
          message: "whatever",
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end

  context "store, replicate" do
    before(:each) do
      @pubnub = Pubnub.new(
        :max_retries => 0,
        :subscribe_key => :demo,
        :publish_key => :demo,
        :auth_key => :demoish_authkey,
        :error_callback => @error_callback,
      )

      @pubnub.uuid = "tester"
    end

    it "works" do
      VCR.use_cassette("integration/publish/publish-store-replicate", record: :once) do
        future = @pubnub.publish(
          message: {text: "sometext"},
          channel: "ruby_demo_channel",
          callback: @callback,
          store: false,
          replicate: false,
        )

        future.value
      end
    end

    it "works with fire method" do
      VCR.use_cassette("integration/publish/publish-store-replicate", record: :once) do
        future = @pubnub.fire(
          message: {text: "sometext"},
          channel: "ruby_demo_channel",
        )

        future.value
      end
    end
  end
end
