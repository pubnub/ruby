require 'spec_helper'



describe "#revoke" do
  before(:each) do
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      $logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    @error_callback = lambda { |envelope|
      $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe', :publish_key => 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d', :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh', :error_callback => @error_callback)
    @pn.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Pubnub::Revoke.any_instance.stub(:current_time).and_return 1234567890
    Pubnub::Revoke.any_instance.stub(:get_signature).and_return 'kdDh/sFC3rSR%2Bt5AEymIc57d1velIr562V7usa5M4k0='

  end
  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-valid-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-valid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("revoke-ssl-block-invalid-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("revoke-ssl-block-invalid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-valid-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-valid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("revoke-ssl-parameter-invalid-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("revoke-ssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
  context "uses non-ssl" do
    before(:each) { @ssl = false }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-valid-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-valid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("revoke-nonssl-block-invalid-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("revoke-nonssl-block-invalid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
    context "passess callback as parameter" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-valid-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Success'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
          context "uses async connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-valid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("revoke-nonssl-parameter-invalid-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Invalid JSON in response."]'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("revoke-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("revoke-nonssl-parameter-invalid-non-200-async", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => false, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
