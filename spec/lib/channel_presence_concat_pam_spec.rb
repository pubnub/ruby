require 'spec_helper'

describe "#grant" do
  before(:each) do

    EM.stop if EM.reactor_running?
    while EM.reactor_running? do end
    sleep(0.1)

    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    @error_callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe', :publish_key => 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d', :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh', :error_callback => @error_callback)
    @pn.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Pubnub::Grant.any_instance.stub(:current_time).and_return 1234567890
    Pubnub::Grant.any_instance.stub(:signature).and_return 'kdDh/sFC3rSR%2Bt5AEymIc57d1velIr562V7usa5M4k0='

  end

  it 'Works with given channel as string and presence as string' do
    VCR.use_cassette("grant-multiple-channels-presence", :record => :none) do
      @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :presence => "demo", :write => true, :read => true, &@callback)

      @after_callback.should eq true
      @response_output.seek 0
      @response_output.read.should eq "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"w\":1},\"demo-pnpres\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe\",\"ttl\":1440,\"level\":\"channel\"}}"
      @message_output.seek 0
      @message_output.read.should eq 'Success'
    end
  end

  it 'Works with given multiple channels as string and multiple presences as string' do
    VCR.use_cassette("grant-multiple-channels-presence-multi-1", :record => :none) do
      @pn.grant(:ssl => true, :http_sync => true, :channel => "demo,demo1,demo2", :presence => "demo,demo1,demo2", :write => true, :read => true, &@callback)

      @after_callback.should eq true
      @response_output.seek 0
      @response_output.read.should eq "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo2-pnpres\":{\"r\":1,\"w\":1},\"demo\":{\"r\":1,\"w\":1},\"demo2\":{\"r\":1,\"w\":1},\"demo1\":{\"r\":1,\"w\":1},\"demo1-pnpres\":{\"r\":1,\"w\":1},\"demo-pnpres\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe\",\"ttl\":1440,\"level\":\"channel\"}}"
      @message_output.seek 0
      @message_output.read.should eq 'Success'
    end
  end

  it 'Works with given multiple channels as string and multiple presences as array' do
    VCR.use_cassette("grant-multiple-channels-presence-multi-2", :record => :none) do
      @pn.grant(:ssl => true, :http_sync => true, :channel => "demo,demo1,demo2", :presence => ["demo","demo1","demo2"], :write => true, :read => true, &@callback)

      @after_callback.should eq true
      @response_output.seek 0
      @response_output.read.should eq "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo2-pnpres\":{\"r\":1,\"w\":1},\"demo\":{\"r\":1,\"w\":1},\"demo2\":{\"r\":1,\"w\":1},\"demo1\":{\"r\":1,\"w\":1},\"demo1-pnpres\":{\"r\":1,\"w\":1},\"demo-pnpres\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe\",\"ttl\":1440,\"level\":\"channel\"}}"
      @message_output.seek 0
      @message_output.read.should eq 'Success'
    end
  end

  it 'Works with given multiple channels as array and multiple presences as string' do
    VCR.use_cassette("grant-multiple-channels-presence-multi-3", :record => :none) do
      @pn.grant(:ssl => true, :http_sync => true, :channel => ["demo","demo1","demo2"], :presence => "demo,demo1,demo2", :write => true, :read => true, &@callback)

      @after_callback.should eq true
      @response_output.seek 0
      @response_output.read.should eq "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo2-pnpres\":{\"r\":1,\"w\":1},\"demo\":{\"r\":1,\"w\":1},\"demo2\":{\"r\":1,\"w\":1},\"demo1\":{\"r\":1,\"w\":1},\"demo1-pnpres\":{\"r\":1,\"w\":1},\"demo-pnpres\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe\",\"ttl\":1440,\"level\":\"channel\"}}"
      @message_output.seek 0
      @message_output.read.should eq 'Success'
    end
  end

  it 'Works with given multiple channels as array and multiple presences as array' do
    VCR.use_cassette("grant-multiple-channels-presence-multi-4", :record => :none) do
      @pn.grant(:ssl => true, :http_sync => true, :channel => ["demo","demo1","demo2"], :presence => ["demo","demo1","demo2"], :write => true, :read => true, &@callback)

      @after_callback.should eq true
      @response_output.seek 0
      @response_output.read.should eq "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo2-pnpres\":{\"r\":1,\"w\":1},\"demo\":{\"r\":1,\"w\":1},\"demo2\":{\"r\":1,\"w\":1},\"demo1\":{\"r\":1,\"w\":1},\"demo1-pnpres\":{\"r\":1,\"w\":1},\"demo-pnpres\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe\",\"ttl\":1440,\"level\":\"channel\"}}"
      @message_output.seek 0
      @message_output.read.should eq 'Success'
    end
  end
end