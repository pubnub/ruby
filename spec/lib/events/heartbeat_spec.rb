require 'spec_helper'

describe Pubnub::Heartbeat do
  it_behaves_like 'an event'

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'given basic parameters' do
    before :each do
      @pubnub = Pubnub::Client.new(
          subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
          publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
          auth_key: 'ruby-test-auth',
          uuid: 'ruby-test-uuid'
      )
    end

    it 'works with subscribe' do
      @pubnub = Pubnub::Client.new(
          subscribe_key: 'demo',
          publish_key: 'demo',
          auth_key: 'ruby-test-auth',
          uuid: 'ruby-test-uuid',
          heartbeat: '10'
      )

      expect(@pubnub.current_heartbeat).to eq 10
      @pubnub.heartbeat = 3
      expect(@pubnub.current_heartbeat).to eq 3

      VCR.use_cassette('lib/events/heartbeat-sub', record: :once) do
        @pubnub.subscribe(channel: :demo)
        sleep(1)
      end
    end

    it 'works' do
      VCR.use_cassette('lib/events/heartbeat', record: :once) do
        envelope = @pubnub.heartbeat(
            channel: :demo
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end

    it 'forms valid ErrorEnvelope on error' do
      VCR.use_cassette('lib/events/heartbeat-error', record: :once) do
        envelope = @pubnub.heartbeat(
            channel: :demo
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
      end
    end
  end
end