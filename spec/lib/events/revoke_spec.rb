require "spec_helper"

describe Pubnub::Revoke do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      Pubnub::Revoke.any_instance.stub(:current_time).and_return 1463307484
      Pubnub::Revoke.any_instance.stub(:signature).and_return "7FvZ9FQeu9q_uTx8ICyK8CiWDOeD1Qc6nrsNfqP0fyY="

      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f",
        publish_key: "pub-c-b42cec2f-f468-4784-8833-dd2b074538c4",
        secret_key: "sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end

    it "works" do
      VCR.use_cassette("lib/events/revoke", record: :once) do
        envelope = @pubnub.revoke(
          channel: :demo,
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/revoke-error", record: :once) do
        envelope = @pubnub.revoke(
          channel: :demo,
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end
  end
end
