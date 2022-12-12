require 'helpers/spec_helper'

describe "Connect, disconnect and reconnect callbacks" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  before(:each) do
    @connect_messages, @reconnect_messages, @disconnect_messages = [], [], []
    @sleep_duration = ENV['JRUBY_TEST'] == 'true' ? 1.5 : 0.5

    callback = Pubnub::SubscribeCallback.new(
      message: -> (_envelope) { },
      presence: -> (_envelope) { },
      status: lambda do |envelope|
        if envelope.error?
          @disconnect_messages << envelope
        else
          if envelope.status[:last_timetoken] == 0 && !@disconnect_messages.empty?
            @reconnect_messages << envelope
          elsif envelope.status[:last_timetoken] == 0 # Connected!
            @connect_messages << envelope
            @pubnub.leave(channel: :demo)
          end
        end
      end,
    )

    @pubnub = Pubnub.new(user_id: Pubnub::UUID.generate, 
      subscribe_key: :demo,
      publish_key: :demo,
      reconnect_interval: 0,
    )

    @pubnub.add_listener(callback: callback)
  end

  it "fire connect callback when connection is made" do
    VCR.use_cassette("client/connection_callbacks_0", :record => :once) do
      @pubnub.subscribe(channel: :demo)
      sleep @sleep_duration
      expect(@connect_messages.size).to be > 0
    end
  end

  it "fire status callback when connection is lost" do
    Pubnub::SubscribeEvent.any_instance.stub(:request_dispatcher) { Pubnub::SubscribeEvent.any_instance.unstub(:request_dispatcher); raise "error" }

    VCR.use_cassette("client/connection_callbacks_1", :record => :once) do
      @pubnub.subscribe(channel: :demo)
      sleep @sleep_duration
      expect(@disconnect_messages.size).to be > 0
    end
  end

  it "fire reconnect callback when connection is reestablished" do
    Pubnub::SubscribeEvent.any_instance.stub(:request_dispatcher) { Pubnub::SubscribeEvent.any_instance.unstub(:request_dispatcher); raise "error" }

    VCR.use_cassette("client/connection_callbacks_2", :record => :once) do
      @pubnub.subscribe(channel: :demo)
      sleep @sleep_duration
      expect(@reconnect_messages.size).to be > 0
    end
  end
end
