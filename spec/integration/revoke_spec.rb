require 'spec_helper'

describe Pubnub::Revoke do

  around(:each) do |example|
    @response_output = StringIO.new
    @message_output = StringIO.new

    success_callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    error_callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
    }

    @callback = ->(envelope) do
      if envelope.error?
        error_callback.call envelope
      else
        success_callback.call envelope
      end
    end

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe', :publish_key => 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d', :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh')
    @pn.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  before :each do
    Pubnub::Revoke.any_instance.stub(:current_time).and_return 1234567890
    Pubnub::Revoke.any_instance.stub(:signature).and_return 'kdDh/sFC3rSR%2Bt5AEymIc57d1velIr562V7usa5M4k0='
  end

  context "uses ssl" do
    before(:each) { @ssl = true }
    it "Generates valid url for application level" do
      VCR.use_cassette("integration/revoke/revoke-application-level", :record => :none) do
        @pn.revoke(:http_sync => true, &@callback)

        @after_callback.should eq true
        @response_output.seek 0
        @response_output.read.should eq '{"status":200,"service":"Access Manager","message":"Success","payload":{"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","r":0,"ttl":1440,"w":0,"level":"subkey"}}'
        @message_output.seek 0
        @message_output.read.should eq 'Success'
      end
    end
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-ssl-block-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("integration/revoke/revoke-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Non 2xx server response.'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-ssl-block-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
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
              VCR.use_cassette("integration/revoke/revoke-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("integration/revoke/revoke-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Non 2xx server response.'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => true, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
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
              VCR.use_cassette("integration/revoke/revoke-nonssl-block-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
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
              VCR.use_cassette("integration/revoke/revoke-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Non 2xx server response.'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
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
              VCR.use_cassette("integration/revoke/revoke-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
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
              VCR.use_cassette("integration/revoke/revoke-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,"message":"Success","payload":{"auths":{"authkey":{"r":0,"w":0}},"subscribe_key":"sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe","ttl":1,"channel":"demo","level":"user"},"service":"Access Manager"}'
                @message_output.seek 0
                @message_output.read.should eq 'Non 2xx server response.'
              end
            end
          end
        end
      end
      context "gets invalid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/revoke/revoke-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.revoke(:ssl => false, :http_sync => true, :channel => "demo", :auth_key => "authkey", :write => true, :read => true, :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status":200,'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
      end
    end
  end
end
