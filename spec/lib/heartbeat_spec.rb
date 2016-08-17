require 'spec_helper'

describe 'hearbeat' do

  it 'default should be nil' do
    @pn = Pubnub.new(:subscribe_key => :test)
    @pn.env[:heartbeat].should eq nil
  end

  it 'is present in subscribe request when set, also fires leave after sync subscribe' do
    @pn = Pubnub.new(:subscribe_key => 'demo-36', :heartbeat => 100)

    VCR.use_cassette("heartbeated-subscribe", :record => :none) do
      enve = @pn.subscribe(:channel => :ruby_test, :http_sync => true) # request would file if heartbeat would not be present
      enve.size.should eq 1
    end

  end

  it 'isn\'t present in subscribe request when not set' do
    @pn = Pubnub.new(:subscribe_key => 'demo-36')

    VCR.use_cassette("non-heartbeated-subscribe", :record => :none) do
      enve = @pn.subscribe(:channel => :ruby_test, :http_sync => true) # request would file if heartbeat would be present
      enve.size.should eq 1
    end

  end

  it 'is called every heartbeat/2 - 1 seconds' do
    @pn = Pubnub.new(:subscribe_key => 'demo-36', :heartbeat => '12')

    VCR.use_cassette("heartbeat-test", :record => :none) do
      @pn.subscribe(:channel => 'rubyheartbeatdemo'){|e| }
      eventually do
        @pn.env[:heartbeat].to_i.should      eq 12
        @pn.env[:respirator].interval.should eq 5
      end
    end
  end

  # it 'calls error_callback if get\'s non-200 response' do
  #   @error = false
  #   error_callback = lambda do |error|
  #     @error = true
  #     EM.stop
  #   end
  #
  #   @pn = Pubnub.new(:subscribe_key => 'demo-36', :heartbeat => '4', :error_callback => error_callback)
  #   VCR.use_cassette("heartbeat-non200", :record => :new_episodes) do
  #     @pn.subscribe(:channel => 'rubyheartbeatdemo'){|e| }
  #     eventually do
  #       @error.should eq true
  #     end
  #   end
  # end

  context 'is settable' do
    before(:each) do
      @pn = Pubnub.new(:subscribe_key => :test)
    end

    it 'at init time' do
      @pn = Pubnub.new(:subscribe_key => :test, :heartbeat => 100)
      @pn.env[:heartbeat].should eq 100
    end

    it 'via heartbeat=' do
      @pn.heartbeat = 100
      @pn.env[:heartbeat].should eq 100
    end

    it 'via set_heartbeat(value)' do
      @pn.set_heartbeat 100
      @pn.env[:heartbeat].should eq 100
    end
  end

  context 'is updateable' do
    before(:each) do
      @pn = Pubnub.new(:subscribe_key => :test)
      @pn.heartbeat = 100
    end

    it 'via heartbeat=' do
      @pn.heartbeat = 200
      @pn.env[:heartbeat].should eq 200
    end

    it 'via set_heartbeat(value)' do
      @pn.set_heartbeat 200
      @pn.env[:heartbeat].should eq 200
    end
  end

  context 'is gettable' do
    before(:each) do
      @pn = Pubnub.new(:subscribe_key => :test)
      @pn.heartbeat = 100
    end

    it 'via get_heartbeat' do
      @pn.get_heartbeat.should eq 100
    end

    it 'via .env' do
      @pn.env[:heartbeat].should eq 100
    end
  end
end
