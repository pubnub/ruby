require 'spec_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
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
