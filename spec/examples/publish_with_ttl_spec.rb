require 'spec_helper'

describe Pubnub::Publish do
  around :each do |example|
    Celluloid.boot

    @pubnub = Pubnub::Client.new(
        publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
        subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
        uuid: 'ruby-test-uuid-client-one',
        auth_key: 'ruby-test-auth-client-one'
    )

    example.run
    Celluloid.shutdown
  end

  context 'with specified ttl parameter' do
    it 'adds it to url' do
      VCR.use_cassette('examples/publish-ttl-works', record: :once) do
        envelope = @pubnub.publish(channel: :demo, message: :whatever, ttl: 10, http_sync: true)

        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end

    it 'ignores it when store is false' do
      VCR.use_cassette('examples/publish-ttl-works-ignore', record: :once) do
        envelope = @pubnub.publish(channel: :demo, message: :whatever, ttl: 10, store: false, http_sync: true)

        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end
