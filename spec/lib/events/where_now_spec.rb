require "spec_helper"

describe Pubnub::WhereNow do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f",
        publish_key: "pub-c-b42cec2f-f468-4784-8833-dd2b074538c4",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end
    it "works" do
      VCR.use_cassette("lib/events/where-now", record: :once) do
        envelope = @pubnub.where_now(
          uuid: "ruby-test",
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/where-now-error", record: :once) do
        envelope = @pubnub.where_now(
          uuid: "ruby-test",
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end
