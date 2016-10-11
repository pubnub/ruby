require 'spec_helper'

describe 'timeout' do
  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'in single event' do
    before :each do
      @pubnub = Pubnub::Client.new(
          subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
          publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
          secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
          auth_key: 'ruby-test-auth',
          uuid: 'ruby-test-uuid'
      )
    end

    it 'forms valid ErrorEnvelope on error' do
      HTTPClient.any_instance.stub(get: HTTPClient::ReceiveTimeoutError.new)

      envelope = @pubnub.time.value
      expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
      expect(envelope.status[:code]).to eq 408
      expect(envelope.status[:category]).to eq Pubnub::Constants::STATUS_TIMEOUT
      expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
    end
  end
end