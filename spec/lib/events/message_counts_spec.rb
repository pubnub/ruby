require 'spec_helper'
require 'pry'

describe Pubnub::Presence do

  let(:client) {Pubnub.new(subscribe_key: :key)}

  around :each do |example|
    example.run_with_retry retry: 10
  end

  it 'client has \'message_counts\' method' do
    expect(client).to respond_to(:message_counts)
  end


  it 'raises an exception when no channel is provided' do
    expect{client.message_counts()}.to raise_error(Pubnub::ArgumentError)
  end

  context 'when number of timetokens is one' do
    it 'does not raise exception' do
      expect{client.message_counts(channels: 'a', channel_timetokens: 123123123)}.not_to raise_error
    end
  end

  context 'when number of timetokens in greater than one' do
    it 'raises an exception when number of timetokens and channels mismatches' do
      params = {
          channels: ['12', '123'],
          channel_timetokens: [123123, 123123, 1231231254]
      }

      expect{client.message_counts(**params)}.to raise_error(Pubnub::ArgumentError)
    end

    it 'does not raise an exception when number of timetokens and channels is the same' do
      params = {
          channels: ['123123', '12312312'],
          channel_timetokens: [123123, 123123]
      }

      expect{client.message_counts(**params)}.not_to raise_error
    end
  end

  context 'integration test' do

    it 'returns valid response with multiple channels as array and single timetoken' do
      VCR.use_cassette('examples/message_counts/1', record: :once) do
        pubnub = Pubnub.new(
          publish_key: 'demo',
          subscribe_key: 'demo',
          uuid: 'ruby-test-uuid-client-one',
          auth_key: 'ruby-test-auth-client-one'
        )
        envelope = pubnub.message_counts(channel:['a','b','c','d'], channel_timetokens: 12123).value
        res = envelope.result[:data]
        expect(res.keys).to contain_exactly("channels", "error", "error_message", "more", "status")
        expect(res["channels"].keys).to contain_exactly("a", "b", "c", "d")
      end
    end

    it 'returns valid response with multiple channels as string and single timetoken' do
      VCR.use_cassette('examples/message_counts/2', record: :once) do
        pubnub = Pubnub.new(
          publish_key: 'demo',
          subscribe_key: 'demo',
          uuid: 'ruby-test-uuid-client-one',
          auth_key: 'ruby-test-auth-client-one'
        )
        envelope = pubnub.message_counts(channel:'a,b,c,d', channel_timetokens: 12123).value
        res = envelope.result[:data]
        expect(res.keys).to contain_exactly("channels", "error", "error_message", "more", "status")
        expect(res["channels"].keys).to contain_exactly("a", "b", "c", "d")
      end
    end

    it 'returns valid response with multiple channels as array and multiple timetokens' do
      VCR.use_cassette('examples/message_counts/3', record: :once) do
        pubnub = Pubnub.new(
          publish_key: 'demo',
          subscribe_key: 'demo',
          uuid: 'ruby-test-uuid-client-one',
          auth_key: 'ruby-test-auth-client-one'
        )
        envelope = pubnub.message_counts(channel:['a','b','c','d'], channel_timetokens: [1231231254, 1231231354, 1231231454, 1231231654]).value
        res = envelope.result[:data]
        expect(res.keys).to contain_exactly("channels", "error", "error_message", "more", "status")
        expect(res["channels"].keys).to contain_exactly("a", "b", "c", "d")
      end
    end

    it 'returns valid response with single channel as string and multiple timetokens' do
      VCR.use_cassette('examples/message_counts/4', record: :once) do
        pubnub = Pubnub.new(
          publish_key: 'demo',
          subscribe_key: 'demo',
          uuid: 'ruby-test-uuid-client-one',
          auth_key: 'ruby-test-auth-client-one'
        )
        envelope = pubnub.message_counts(channel:'a', channel_timetokens: 1231231254).value
        res = envelope.result[:data]
        expect(res.keys).to contain_exactly("channels", "error", "error_message", "more", "status")
        expect(res["channels"].keys).to contain_exactly("a")
      end
    end
  end
end
