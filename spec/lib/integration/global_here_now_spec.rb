require 'spec_helper'

describe "#here_now" do
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

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => 'demo-36', :publish_key => 'demo-36', :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq 'OK'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Non 2xx server response."]'
                end
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
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
              VCR.use_cassette("here_now_global-ssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-200-async", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq 'OK'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Non 2xx server response."]'
                end
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:ssl => true, :http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
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
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq 'OK'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Non 2xx server response."]'
                end
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
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
              VCR.use_cassette("here_now_global-nonssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq 'OK'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0}'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Non 2xx server response."]'
                end
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                  @message_output.seek 0
                  @message_output.read.should eq '[0,"Invalid JSON in response."]'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("here_now_global-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.here_now(:http_sync => false, :channel => "demo", :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status": 200, "message": "OK", "service": "Presence", "uuids": [], "occupancy": 0'
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
end
