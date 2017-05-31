require 'spec_helper'

describe 'Signatures' do

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'works all letters channel' do
    Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242823)

    pubnub = Pubnub.new(
        subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
        publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
        secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
        uuid: 'test'
    )

    VCR.use_cassette('lib/signatures/all-letters', record: :once) do
      envelope = pubnub.grant(channel: 'demo', http_sync: true)
      expect(envelope.status[:code]).to eq 200
    end
  end

  it 'works with wildcard' do
    Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242823)

    pubnub = Pubnub.new(
        subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
        publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
        secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
        uuid: 'test'
    )

    VCR.use_cassette('lib/signatures/wildcard', record: :once) do
      envelope = pubnub.grant(channel: 'demo.*', http_sync: true)
      expect(envelope.status[:code]).to eq 200
    end
  end

  it 'works with various special characters' do
    Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242824)

    pubnub = Pubnub.new(
        subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
        publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
        secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
        uuid: 'test'
    )

    VCR.use_cassette('lib/signatures/special', record: :once) do
      envelope = pubnub.grant(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
      expect(envelope.status[:code]).to eq 200
    end
  end
end
