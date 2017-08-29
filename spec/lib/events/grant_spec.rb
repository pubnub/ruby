require 'spec_helper'

describe Pubnub::Grant do
  it_behaves_like 'an event'

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'given basic parameters' do
    before :each do
      allow_any_instance_of(Pubnub::Grant).to receive(:current_time).and_return 1463146850
      allow_any_instance_of(Pubnub::Grant).to receive(:signature).and_return 'udCXAk-z4VaU2JA2LgjVzED2LBZAKsjj86twYJoGPnY='
    end
    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
        publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
        secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
        auth_key: 'ruby-test-auth',
        uuid: 'ruby-test-uuid'
      )
    end
    let(:envelope) do
      pubnub.grant(
        channel: :demo
      ).value
    end

    it 'works' do
      VCR.use_cassette('lib/events/grant', record: :once) do
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    it 'forms valid ErrorEnvelope on error' do
      VCR.use_cassette('lib/events/grant-error', record: :once) do
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
      end
    end

    [
      HTTPClient::ConnectTimeoutError,
      HTTPClient::ReceiveTimeoutError,
      HTTPClient::SendTimeoutError
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
