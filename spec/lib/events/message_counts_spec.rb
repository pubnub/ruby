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
      expect{client.message_counts(channels: 'a', timetoken: 123123123)}.not_to raise_error
    end
  end

  context 'when number of timetokens in greater than one' do
    it 'raises an exception when number of timetokens and channels mismatches' do
      params = {
          channels: ['12', '123'],
          timetoken: [123123, 123123, 1231231254]
      }

      expect{client.message_counts(**params)}.to raise_error(Pubnub::ArgumentError)
    end

    it 'does not raise an exception when number of timetokens and channels is the same' do
      params = {
          channels: ['123123', '12312312'],
          timetoken: [123123, 123123]
      }

      expect{client.message_counts(**params)}.not_to raise_error
    end
  end

  context 'integration test' do
    it 'returns valid response' do
      VCR.use_cassette('examples/message_counts/1', record: :none) do
        pubnub = Pubnub.new(
            publish_key: 'demo-36',
            subscribe_key: 'demo-36',
            uuid: 'ruby-test-uuid-client-one',
            auth_key: 'ruby-test-auth-client-one',
            origin: 'balancer1g.bronze.aws-pdx-1.ps.pn'
            )
        envelope = pubnub.message_counts(channel:['a,b,c,d'], timetoken: 12123).value
        res = envelope.result[:data]
        expect(res.keys).to contain_exactly("channels", "error", "error_message", "status")
        expect(res["channels"].keys).to contain_exactly("a", "b", "c", "d")
      end
    end
  end
end
