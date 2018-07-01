require "spec_helper"

describe "timeout" do
  context "in single event" do
    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f",
        publish_key: "pub-c-b42cec2f-f468-4784-8833-dd2b074538c4",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end
    let(:envelope) { pubnub.time.value }

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
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end
