require 'spec_helper'

describe 'PAM' do

  VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock
  end

  before(:each) do
    @publish_key   = 'pub-c-e72b633d-bb2f-42ba-8e98-69a9d3f7bdaa'
    @subscribe_key = 'sub-c-8e798456-4520-11e3-9b46-02ee2ddab7fe'
    @secret_key    = 'sec-c-ZjFjZmRhODMtM2E5Yi00N2ViLWJjYTktMjk2NmExOTQyMmYz'
    @auth_key      = 'myauthkey'
    @channel       = 'mychannel'
    @message       = 'hello PAM world!'
    @origin        = 'pam-next.devbuild.pubnub.com'

    @envelopes       = Array.new

    @err_callback = lambda { |x|
      @envelopes << x
    }

    @msg_callback = lambda { |x|
      @envelopes << x
    }


    @logger = Logger.new(STDERR)

    @p = Pubnub.new(:origin => @origin, :uuid => 'myuuid', :subscribe_key => @subscribe_key, :publish_key => @publish_key, :secret_key => @secret_key, :error_callback => @err_callback)

  end

  before(:each) do
    @envelopes       = Array.new
  end

  describe "with auth set" do

    before do
      @p.auth_key = @auth_key
    end

    context "synchronously" do

      context "when a publish is made" do

        it 'should provide the auth key in the url' do
          VCR.use_cassette('pam1', :record => :none) do
            response = @p.publish(:channel => @channel, :message => @message, :http_sync => true)
            #response.request.params["auth"].should == @auth_key
            response.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
          end
        end
      end

      context "when history is made" do

        it 'should provide the auth key in the url' do
          VCR.use_cassette('pam4', :record => :none) do
            response = @p.history(:channel => @channel, :count => 10, :http_sync => true)
            response.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
          end
        end
      end

      context "when subscribe is made" do

        context "on the initial subscribe" do
          it 'should provide the auth key in the url' do
            VCR.use_cassette('pam5', :record => :none) do
              response = @p.subscribe(:channel => @channel, :http_sync => true)
              response.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
            end
          end
        end

        context "on the initial and subsequent subscribe" do
          it 'should provide the auth key in the url' do
            VCR.use_cassette('pam6', :record => :none) do
              response1 = @p.subscribe(:channel => @channel, :http_sync => true)
              response2 = @p.subscribe(:channel => @channel, :http_sync => true)

              response1.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
              response2.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false

            end
          end
        end

      end

    end


    context "asynchronously" do

      context "when a publish is made" do


        it 'should provide the auth key in the url' do

          VCR.use_cassette('pam1', :record => :none) do
            @p.publish(:channel => @channel, :message => @message, :http_sync => false, :callback => @msg_callback)
            while @envelopes.size == 0 do end
            @envelopes.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
          end
        end
      end


      context "when history is made" do

        it 'should provide the auth key in the url' do

          VCR.use_cassette('pam4', :record => :none) do
            @p.history(:channel => @channel, :count => 10, :http_sync => false, :callback => @msg_callback)
            while @envelopes.size == 0 do end
            @envelopes.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
          end
        end
      end

      context "when subscribe is made" do

        context "on the initial subscribe" do
          it 'should provide the auth key in the url' do

            VCR.use_cassette('pam6', :record => :none) do
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)
              while @envelopes.size == 0 do end
              @envelopes.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false
            end
          end
      end


        context "on the initial and subsequent subscribe" do
          xit 'should provide the auth key in the url' do

            # sync subscribe doesn't work that way

            VCR.use_cassette('pam6', :record => :none) do
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)

              while @envelopes.size <= 1 do end
              @envelopes.first.response_object.env[:url].to_s.index("auth=#{@auth_key}").nil?.should be_false


            end
          end
        end
      end
    end
  end


  describe "with no auth set" do

    before do
      @p.auth_key = nil
    end

    context "synchronously" do

      context "when a publish is made" do

        it 'should provide the auth key in the url' do
          VCR.use_cassette('pam20', :record => :none) do
            response = @p.publish(:channel => @channel, :message => @message, :http_sync => true)

            response.response_object.env[:url].to_s.index('auth').nil?.should be_false
            response.response_object.env[:url].to_s.index('auth=').nil?.should be_true
          end
        end
      end

      context "when history is made" do

        it 'should provide the auth key in the url' do
          VCR.use_cassette('pam21', :record => :none) do
            response = @p.history(:channel => @channel, :count => 10, :http_sync => true)
            response.response_object.env[:url].to_s.index('auth').nil?.should be_false
            response.response_object.env[:url].to_s.index('auth=').nil?.should be_true
          end
        end
      end


      context "when subscribe is made" do

        context "on the initial subscribe" do
          it 'should provide the auth key in the url' do
            VCR.use_cassette('pam22', :record => :none) do
              response = @p.subscribe(:channel => @channel, :http_sync => true)
              response.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
              response.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true
            end
          end
        end


        context "on the initial and subsequent subscribe" do
          it 'should provide the auth key in the url' do
            VCR.use_cassette('pam22', :record => :none) do
              response1 = @p.subscribe(:channel => @channel, :http_sync => true)
              response2 = @p.subscribe(:channel => @channel, :http_sync => true)

              response1.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
              response1.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true
              response2.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
              response2.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true

            end
          end
        end

      end

    end


    context "asyncronously" do

      context "when a publish is made" do


        it 'should provide the auth key in the url' do

          VCR.use_cassette('pam20', :record => :none) do
            @p.publish(:channel => @channel, :message => @message, :http_sync => false, :callback => @msg_callback)
            while @envelopes.size == 0 do end
            @envelopes.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
            @envelopes.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true
          end
        end
      end


      context "when history is made" do

        it 'should provide the auth key in the url' do

          VCR.use_cassette('pam21', :record => :none) do
            @p.history(:channel => @channel, :count => 10, :http_sync => false, :callback => @msg_callback)
            while @envelopes.size == 0 do end
            @envelopes.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
            @envelopes.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true
          end
        end
      end

      context "when subscribe is made" do

        context "on the initial subscribe" do
          xit 'should provide the auth key in the url' do

            VCR.use_cassette('pam22', :record => :none) do
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)
              while @envelopes.size <= 1 do end
              @envelopes.first.response_object.env[:url].to_s.index('auth').nil?.should be_false
              @envelopes.first.response_object.env[:url].to_s.index('auth=').nil?.should be_true
            end
          end
        end


        context "on the initial and subsequent subscribe" do
          xit 'should provide the auth key in the url' do

            mock(@p).verify_operation('subscribe', {:ssl => nil, :cipher_key => nil, :publish_key => "pub-c-e72b633d-bb2f-42ba-8e98-69a9d3f7bdaa",
                                                    :subscribe_key => "sub-c-8e798456-4520-11e3-9b46-02ee2ddab7fe", :secret_key => "sec-c-ZjFjZmRhODMtM2E5Yi00N2ViLWJjYTktMjk2NmExOTQyMmYz",
                                                    :origin => @origin, :operation => "subscribe", :params => {:uuid => "myuuid", :auth => nil}, :timetoken => nil,
                                                    :error_callback => @err_callback, :channel => @channel, :http_sync => false, :callback => @msg_callback}).times(2)

            VCR.use_cassette('pam7', :record => :none) do
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)
              @p.subscribe(:channel => @channel, :http_sync => false, :callback => @msg_callback)


            end
          end
        end
      end
    end
  end

  describe "audit" do
    context "required parameters" do

      context "when the publish key is missing" do
        it "should raise an error" do
          @p = Pubnub.new(:uuid => "myuuid", :subscribe_key => @subscribe_key, :secret_key => @secret_key, :error_callback => @err_callback)
          lambda { @p.audit(:http_sync => true) }.should raise_error(Pubnub::ArgumentError)
        end
      end

      context "when the secret key is missing" do
        it "should raise an error" do
          @p = Pubnub.new(:uuid => "myuuid", :subscribe_key => @subscribe_key, :publish_key => @publish_key, :error_callback => @err_callback)
          lambda { @p.audit(:publish_key => @publish_key, :http_sync => true) }.should raise_error(Pubnub::ArgumentError)
        end
      end


      context "when only the subscribe key is missing" do
        it "should raise an error" do
          lambda { @p = Pubnub.new(:uuid => "myuuid", :publish_key => @publish_key, :secret_key => @secret_key, :error_callback => @err_callback) }.should raise_error(Pubnub::InitializationError)
          #lambda { @p.audit(:secret_key => @secret_key, :http_sync => true) }.should raise_error(Pubnub::ArgumentError)
        end
      end

      context "when only the auth key is given with no channel" do
        it "should raise an error" do
          @p = Pubnub.new(:uuid => "myuuid", :publish_key => @publish_key, :subscribe_key => @subscribe_key, :secret_key => @secret_key, :error_callback => @err_callback)
          @p.auth_key = "foo"
          lambda { @p.audit(:secret_key => @secret_key, :http_sync => true) }.should raise_error(Pubnub::ArgumentError)
        end
      end

      context "when the required parameters are given" do
        it "should require secret, pub, and sub keys" do
          @p = Pubnub.new(:uuid => "myuuid", :publish_key => @publish_key, :subscribe_key => @subscribe_key, :secret_key => @secret_key, :error_callback => @err_callback)
          lambda { @p.audit(:http_sync => true) }.should_not raise_error(Pubnub::ArgumentError)
        end
      end


    end

    describe "integration" do

      before do
        any_instance_of(Pubnub::SingleRequest) do |request|
          request.stub(:current_time).and_return 123456
        end
      end

      context "via http" do
        before do
          @p = Pubnub.new(:logger => @logger, :origin => @origin, :uuid => "myuuid", :publish_key => @publish_key, :subscribe_key => @subscribe_key, :secret_key => @secret_key, :error_callback => @err_callback)
        end

        context "synchronously" do
          context "via return" do

            context "audit" do
              context "subkey level" do
                it "should display current stats" do
                  VCR.use_cassette('pam10', :record => :none) do
                    response = @p.audit(:http_sync => true)

                    response.first.is_error?.should be_false
                    response.first.payload['channels'].should be_empty
                    response.first.payload['level'].should eq 'subkey'
                  end
                end
              end

              context "channel level" do
                it "should display current stats" do
                  VCR.use_cassette('pam11', :record => :none) do
                    response = @p.audit(:http_sync => true, :channel => @channel)

                    response.is_error.should be_false
                    response.response["payload"]["channels"].should be_empty
                    response.response["payload"]["level"].should == 'channel'

                  end

                end
              end

              context "channel and user level" do

                it "should display current stats" do
                  VCR.use_cassette('pam12', :record => :none) do
                    @p.auth_key = @auth_key
                    response = @p.audit(:http_sync => true, :channel => @channel)

                    response.is_error.should be_false
                    response.response["payload"]["channel"].should == "mychannel"
                    response.response["payload"]["level"].should == 'user'

                  end

                end

              end


            end


            context "grant" do
              context "subkey level" do

                it "should display current stats" do
                  VCR.use_cassette('pam13', :record => :none) do
                    response = @p.grant(:http_sync => true)

                    response.is_error.should be_false
                    response.response["payload"]["channels"].should be_nil
                    response.response["payload"]["level"].should == 'subkey'
                  end
                end

              end

              context "channel level" do
                it "should display current stats" do
                  VCR.use_cassette('pam14', :record => :none) do
                    response = @p.grant(:http_sync => true, :channel => @channel)

                    response.is_error.should be_false
                    response.response["payload"]["channels"].should == {"mychannel" => {"r" => 0, "w" => 0}}
                    response.response["payload"]["level"].should == 'channel'

                  end

                end




                it "IOS Dev" do
                  VCR.use_cassette('pam17', :record => :none) do
                    response = @p.grant(:http_sync => true, :channel => "IOS Dev")

                    response.is_error.should be_false
                    response.response["payload"]["channels"].should == {"IOS Dev"=>{"r"=>0, "w"=>0}}
                    response.response["payload"]["level"].should == 'channel'

                  end

                end


              end

              context "channel and user level" do

                it "should display current stats" do
                  VCR.use_cassette('pam15', :record => :none) do
                    @p.auth_key = @auth_key
                    response = @p.grant(:http_sync => true, :channel => @channel)

                    response.is_error.should be_false
                    response.response["payload"]["channel"].should == "mychannel"
                    response.response["payload"]["level"].should == 'user'

                  end

                end

              end
            end
          end
        end
      end
    end
  end
end