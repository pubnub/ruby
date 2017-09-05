require 'spec_helper'

describe Pubnub::ChannelRegistration do
  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'whatever' do
    let(:pubnub) do
      Pubnub::Client.new(
          subscribe_key: 'sub-c-fc6c9226-655d-11e7-b272-02ee2ddab7fe',
          publish_key: 'pub-c-b458bb23-c95d-4f43-9992-e2c118557e80',
          auth_key: 'ruby-test-auth',
          uuid: 'ruby-test-uuid'
      )
    end

    it 'works with just channel specified' do
      VCR.use_cassette('examples/delete_messages_channel',record: :once) do
        envelope = pubnub.delete_messages(channel: :demo)
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it 'works with channel and start specified' do
      VCR.use_cassette('examples/delete_messages_channel_start',record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, start: '15040071432538531')
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it 'works with channel, start and end specified' do
      VCR.use_cassette('examples/delete_messages_channel_start_end',record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, start: '1504003597000', end: '1504007197000')
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it 'works with channel and end specified' do
      VCR.use_cassette('examples/delete_messages_channel_end',record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, end: '15040071432538531')
        expect(envelope.value.status[:code]).to eq 200
      end
    end
  end
end