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

    @pn = Pubnub.new(:disable_persistent_connection => true, :max_retries => 0, :subscribe_key => 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe', :publish_key => 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d', :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh', :error_callback => @error_callback)
    @pn.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Pubnub::Grant.any_instance.stub(:current_time).and_return 1234567890
    Pubnub::Grant.any_instance.stub(:signature).and_return 'kdDh/sFC3rSR%2Bt5AEymIc57d1velIr562V7usa5M4k0='

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    it "Generates valid url for application level" do
      VCR.use_cassette("grant-application-level", :record => :none) do
        @pn.grant(:http_sync => true, &@callback)

        @after_callback.should eq true
        @response_output.seek 0
        @response_output.read.should eq '{"status":200,"service":"Access Manager","message":"Success","payload":{"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","r":1,"ttl":1440,"w":1,"level":"subkey"}}'
        @message_output.seek 0
        @message_output.read.should eq 'Success'
      end
    end
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-valid-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-valid-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                  @message_output.seek 0
                  @message_output.read.should eq 'Success'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-valid-non-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
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
              VCR.use_cassette("grant-ssl-block-invalid-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-invalid-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-parameter-valid-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                  @message_output.seek 0
                  @message_output.read.should eq 'Success'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
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
              VCR.use_cassette("grant-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.grant(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-nonssl-block-valid-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-block-valid-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                  @message_output.seek 0
                  @message_output.read.should eq 'Success'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
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
              VCR.use_cassette("grant-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-block-invalid-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                  @message_output.seek 0
                  @message_output.read.should eq 'Success'
                end
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":1,"w":1}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":3600,"channel":"demo","level":"user"},"service":"Access Manager"}'
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
              VCR.use_cassette("grant-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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
              VCR.use_cassette("grant-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("grant-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.grant(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)

                eventually do
                  @after_error_callback.should eq true
                  @response_output.seek 0
                  @response_output.read.should eq '{"status":200,'
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