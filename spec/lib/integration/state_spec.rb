require 'spec_helper'

describe 'state metadata in subscribe requests' do
  before(:each) do
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
    @pn.uuid = 'rubytestuuid'
  end

  context 'sync' do
    it 'sets/gets proper data via subscribe request' do
      VCR.use_cassette("state-set-state-via-subscribe", :record => :none) do
        @pn.subscribe(:channel => :whatever, :state => { :whatever => { :key => :value } }, :http_sync => true )
        enve = @pn.state(:channel => :whatever, :uuid => :rubytestuuid, :http_sync => true)
        
        enve.size.should eq 1
        enve.first.response.should eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"key\": \"value\"}, \"service\": \"Presence\"}"
      end
    end

    it 'sets/gets proper data via client method using symbol' do
      VCR.use_cassette("state-set-state-via-client", :record => :none) do
        @pn.set_state(:state => { :key => :value }, :channel => :whatever, :http_sync => true)
        @pn.subscribe(:channel => :whatever, :http_sync => true )

        enve = @pn.state(:channel => :whatever, :uuid => :rubytestuuid, :http_sync => true)
        
        enve.size.should eq 1
        enve.first.response.should eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"key\": \"value\"}, \"service\": \"Presence\"}"
      end
    end

    it 'sets/gets proper data via client method using string' do
      VCR.use_cassette("state-set-state-via-client-2", :record => :once) do
        @pn.set_state(:state => { :key => :value }, :channel => :whatever, :http_sync => true)
        @pn.subscribe(:channel => :whatever, :http_sync => true )

        enve = @pn.state(:channel => 'whatever', :uuid => :rubytestuuid, :http_sync => true)
        
        enve.size.should eq 1
        enve.first.response.should eq "{\"status\": 200, \"uuid\": \"rubytestuuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"key\": \"value\"}, \"channel\": \"whatever\"}"
      end
    end
  end

  context 'async' do
    it 'sets/gets proper data via subscribe request' do
      VCR.use_cassette("state-async-set-state-via-subscribe", :record => :none) do
        @pn.subscribe(:channel => :whatever, :state => { :whatever => { :key => :value } } ){|e|}
        enve = @pn.state(:channel => :whatever, :uuid => :rubytestuuid, :http_sync => true)
        
        enve.size.should eq 1
        enve.first.response.should eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"key\": \"value\"}, \"service\": \"Presence\"}"
      end
    end

    it 'sets/gets proper data via client' do
      VCR.use_cassette("state-async-set-state-via-subbedclient-2", :record => :once) do
        @pn.subscribe(:channel => :whatever){|e|}
        @pn.set_state(:state => { :key => :value }, :channel => :whatever, :http_sync => true)
        enve = @pn.state(:channel => :whatever, :uuid => :rubytestuuid, :http_sync => true)
        
        enve.size.should eq 1
        enve.first.response.should eq "{\"status\": 200, \"uuid\": \"rubytestuuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"key\": \"value\"}, \"channel\": \"whatever\"}"
      end
    end
  end
end