require 'spec_helper'

describe 'Super admin mode' do

  around :each do |example|
    example.run
  end

  before(:each) do
    Pubnub::Client.any_instance.stub(:sdk_version).and_return('PubNub-Ruby/4.0.16')

    @pubnub = Pubnub.new(
        subscribe_key: 'sub-c-f9f24520-9c56-11e6-a681-02ee2ddab7fe',
        publish_key: 'pub-c-9bb9ae77-a60c-4788-96ab-75cbe5d5dd11',
        secret_key: 'sec-c-MjZkYmQyMDUtYmRhZi00ZDY3LThjZGQtNjU2NmNjNmJkODM3',
        uuid: 'ruby-test',
        reconnect_interval: 0,
        ssl: true
    )
  end

  describe 'OpenSSL error' do
    it 'is caught' do
      Pubnub::Publish.any_instance.stub(:current_time).and_return(1480343560)
      Pubnub::Publish.any_instance.stub(:send_request).and_return(OpenSSL::SSL::SSLError.new)
      Pubnub::Client.any_instance.stub(:generate_ortt).and_return(14803435605315392)

      VCR.use_cassette('lib/ssl-error', record: :once) do
        pub = @pubnub.publish(channel: :demo, message: :demo)
        expect(pub.value.status[:category]).to eq Pubnub::Constants::SSL_ERROR
      end
    end
  end

end