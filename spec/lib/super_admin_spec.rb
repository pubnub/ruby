require "spec_helper"

describe "Super admin mode" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  before(:each) do
    Pubnub::Client.any_instance.stub(:sdk_version).and_return("PubNub-Ruby/4.0.10")

    @messages = []
    @statuses = []
    @presences = []

    @callbacks = Pubnub::SubscribeCallback.new(
      message: -> (envelope) { @messages << envelope },
      presence: -> (envelope) { @presences << envelope },
      status: -> (envelope) { @statuses << envelope },
    )

    @pubnub = Pubnub.new(
      subscribe_key: "sub-a-mock-key",
      publish_key: "pub-a-mock-key",
      secret_key: "sec-a-mock-key",
      uuid: "ruby-test",
      reconnect_interval: 0,
    )

    @pubnub.add_listener(callback: @callbacks)
  end

  it "works with channel registration" do
    Pubnub::ChannelRegistration.any_instance.stub(:current_time).and_return(1477672650)

    VCR.use_cassette("lib/super_admin/cg", record: :once) do
      envelope = @pubnub.channel_registration(
        action: :add,
        channel: :demo,
        group: :demo,
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with here_now" do
    Pubnub::HereNow.any_instance.stub(:current_time).and_return(1477672650)

    VCR.use_cassette("lib/super_admin/here_now", record: :once) do
      envelope = @pubnub.here_now(
        channel: :demo,
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with history" do
    Pubnub::History.any_instance.stub(:current_time).and_return(1477672650)

    VCR.use_cassette("lib/super_admin/history", record: :once) do
      envelope = @pubnub.history(
        channel: :demo,
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with leave" do
    Pubnub::Leave.any_instance.stub(:current_time).and_return(1477907746)

    VCR.use_cassette("lib/super_admin/leave", record: :once) do
      envelope = @pubnub.leave(
        channel: :demo,
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with presence" do
    VCR.use_cassette("lib/super_admin/presence", record: :once) do
      Pubnub::Subscribe.any_instance.stub(:current_time).and_return(1477921137)

      @pubnub.presence(channel: :demo)

      eventually do
        envelope = @presences.first
        expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
      end
    end
  end

  it "works with publish" do
    Pubnub::Publish.any_instance.stub(:current_time).and_return(1477919007)
    Pubnub::Client.any_instance.stub(:generate_ortt).and_return(14779190077911314)

    VCR.use_cassette("lib/super_admin/publish", record: :once) do
      envelope = @pubnub.publish(
        channel: "demo",
        message: "whatever",
        http_sync: true,
      )

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
      expect(envelope).to be_an_instance_of(Pubnub::Envelope)
    end
  end

  it "works with state" do
    Pubnub::State.any_instance.stub(:current_time).and_return(1477672672)

    VCR.use_cassette("lib/super_admin/state", record: :once) do
      envelope = @pubnub.state(
        channel: :demo,
        uuid: :whatever,
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with subscribe" do
    Pubnub::Subscribe.any_instance.stub(:current_time).and_return(1477921157)

    VCR.use_cassette("lib/super_admin/subscribe", record: :once) do
      @pubnub.subscribe(channel: :demo)

      eventually do
        envelope = @messages.first
        expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
      end
    end
  end

  it "works with time" do
    Pubnub::Time.any_instance.stub(:current_time).and_return(1477672693)

    VCR.use_cassette("lib/super_admin/time", record: :once) do
      envelope = @pubnub.time.value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end

  it "works with where_now" do
    Pubnub::WhereNow.any_instance.stub(:current_time).and_return(1477672693)

    VCR.use_cassette("lib/super_admin/where_now", record: :once) do
      envelope = @pubnub.where_now(
        uuid: "ruby-test",
      ).value

      expect(envelope.status[:client_request].to_s.index("&signature=")).to be_truthy
    end
  end
end
