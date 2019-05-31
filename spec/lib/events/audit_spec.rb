require "spec_helper"

describe Pubnub::Audit do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      Pubnub::Audit.any_instance.stub(:current_time).and_return 1462972157
      Pubnub::Audit.any_instance.stub(:signature).and_return "P3xhzqxwFJSFthJbnByZog-U4j1S5TMFeuUxqKNgMM0="

      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        secret_key: "sec-a-mock-key",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end

    it "works" do
      VCR.use_cassette("lib/events/audit-works", record: :once) do
        envelope = @pubnub.audit(
          channel: :demo,
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/audit-error", record: :once) do
        envelope = @pubnub.audit(
          channel: :demo,
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    it "forms valid ErrorEnvelope on json error" do
      VCR.use_cassette("lib/events/audit-json-error", record: :once) do
        envelope = @pubnub.audit(
          channel: :demo,
        ).value
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end
  end
end
