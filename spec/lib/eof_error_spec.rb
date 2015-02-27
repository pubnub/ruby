require 'spec_helper'

describe 'quick eof error test' do
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

    @pn = nil
    @pn = Pubnub.new(:max_retries => 1, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

    Pubnub::Subscribe.any_instance.stub(:send_request){
      Pubnub::Subscribe.any_instance.unstub(:send_request)
      raise EOFError
    }
  end

  it 'should not break client' do
    VCR.use_cassette('eof_subscribe', :record => :none) do
      @pn.subscribe(:channel => 'ping_3', &@callback)
      eventually do
        @after_callback.should eq true
        @response_output.seek 0
        @response_output.read.should eq '[["ping_3.php says 1403984741"],"14039847413557067"]'
      end
    end
  end

end