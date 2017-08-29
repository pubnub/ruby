require 'spec_helper'

describe Pubnub::DeleteMessages do
  it_behaves_like 'an event'

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'given basic parameters' do
    before :each do
      @pubnub = Pubnub::Client.new(
          subscribe_key: 'sub-c-fc6c9226-655d-11e7-b272-02ee2ddab7fe',
          publish_key: 'pub-c-b458bb23-c95d-4f43-9992-e2c118557e80',
          auth_key: 'ruby-test-auth',
          uuid: 'ruby-test-uuid'
      )
    end

    it 'works' do
      VCR.use_cassette('lib/events/delete_messages', record: :once) do
        envelope = @pubnub.delete_messages(
            channel: :demo
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end

    it 'forms valid ErrorEnvelope on error' do
      VCR.use_cassette('lib/events/delete_messages-error', record: :once) do
        envelope = @pubnub.delete_messages(
            channel: :demo
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end