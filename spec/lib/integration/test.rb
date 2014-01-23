require 'spec_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes/test'
  c.hook_into :webmock
end
describe "#subscribe" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-valid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-valid-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-valid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-invalid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-invalid-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-valid-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-valid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-valid-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-invalid-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"][[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"hey"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"13904299332319098"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.subscribe(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("subscribe-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.subscribe(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"hey"}],"'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#publish" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-valid-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-valid-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-valid-non-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-invalid-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-invalid-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-valid-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.publish(:ssl => true, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-valid-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-valid-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-invalid-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq 'Sent'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","13904299694449458"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => true, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("publish-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.publish(:ssl => false, :http_sync => false, :channel => "demo", :message => {:text => "hey"}, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[1,"Sent","'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#presence" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-valid-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-valid-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-valid-non-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-invalid-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-invalid-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-valid-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.presence(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-valid-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-valid-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-invalid-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"][[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>1}{"action"=>"join", "timestamp"=>1390430008, "uuid"=>"3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy"=>2}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 1},{"action": "join", "timestamp": 1390430008, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb", "occupancy": 2}],"13904300089348992"]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                @pn.presence(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("presence-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.presence(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"action": "leave", "timestamp": 1390430067, "uuid": "3bad4360-2b9f-470f-aaf7-dac04454b1fb",'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#history" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-valid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-valid-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-valid-non-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-invalid-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-valid-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.history(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-valid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-valid-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-invalid-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq ('[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'*3)
                @message_output.seek 0
                @message_output.read.should eq '{"text"=>"hey"}{"text"=>"howdy"}{"text"=>"hello"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("history-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.history(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#here_now" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-valid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-invalid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-invalid-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '{"uuids"=>["rubytests"], "occupancy"=>1}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.here_now(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"uuids":["rubytests"],"occupancy":1'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#time" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-valid-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-valid-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-valid-non-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-invalid-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-invalid-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-valid-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.time(:ssl => true, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.time(:ssl => true, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-valid-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-valid-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-invalid-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '13904301930718907'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301930718907]'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.time(:ssl => false, :http_sync => true, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("time-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.time(:ssl => false, :http_sync => false, :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[13904301869920523'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
describe "#leave" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
      if EM.reactor_running? && envelope.is_last?
        EM.stop
      end
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-valid-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-valid-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-valid-non-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-invalid-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-invalid-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-valid-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.leave(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-valid-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-valid-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-invalid-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", &@callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '{"action"=>"leave"}'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leave"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response"]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("leave-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.leave(:ssl => false, :http_sync => false, :channel => "demo", :callback => @callback)
                while EM.reactor_running? do
                end
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"action": "leav'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
      end
    end
  end
end
