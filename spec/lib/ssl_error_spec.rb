require "spec_helper"

describe "Super admin mode" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  before(:each) do
    Pubnub::Client.any_instance.stub(:sdk_version).and_return("PubNub-Ruby/4.0.16")

    @pubnub = Pubnub.new(
      subscribe_key: "sub-a-mock-key",
      publish_key: "pub-a-mock-key",
      secret_key: "sec-a-mock-key",
      user_id: "ruby-test",
      reconnect_interval: 0,
      ssl: true,
    )
  end

  describe "OpenSSL error" do
    it "is caught" do
      Pubnub::Publish.any_instance.stub(:current_time).and_return(1480343560)
      Pubnub::Publish.any_instance.stub(:send_request).and_return(OpenSSL::SSL::SSLError.new)
      Pubnub::Client.any_instance.stub(:generate_ortt).and_return(14803435605315392)

      VCR.use_cassette("lib/ssl-error", record: :once) do
        pub = @pubnub.publish(channel: :demo, message: :demo)
        expect(pub.value.status[:category]).to eq Pubnub::Constants::SSL_ERROR
      end
    end
  end
end
