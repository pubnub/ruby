require 'helpers/spec_helper'

describe Pubnub::Grant do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      allow_any_instance_of(Pubnub::Grant).to receive(:current_time).and_return 1602537897
      allow_any_instance_of(Pubnub::Grant).to receive(:signature).and_return "v2.OdCTZXne_jEBewh3yY8iNDWcMCHC6BXNrg1Er9JoSTQ"
    end

    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        secret_key: "sec-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end
    let(:envelope) do
      pubnub.grant(
        channel: :demo,
      ).value
    end

    it "works" do
      VCR.use_cassette("lib/events/grant", record: :once) do
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/grant-error", record: :once) do
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    [
      HTTPClient::ConnectTimeoutError,
      HTTPClient::ReceiveTimeoutError,
      HTTPClient::SendTimeoutError,
    ].each do |error_class|
      it "forms valid ErrorEnvelope on #{error_class}" do
        allow_any_instance_of(HTTPClient).to receive(:get).and_return error_class.new

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status[:code]).to eq 408
        expect(envelope.status[:category]).to eq Pubnub::Constants::STATUS_TIMEOUT
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
