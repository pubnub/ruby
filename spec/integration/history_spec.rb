require 'spec_helper'

describe Pubnub::History do

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

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key')
    @pn.uuid = 'rubytests'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context "uses ssl" do
    before(:each) { @ssl = true }
    context "passess callback as block" do
      context "gets valid json in response" do
        context "gets status 200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/history/history-ssl-block-valid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                
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
              VCR.use_cassette("integration/history/history-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
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
              VCR.use_cassette("integration/history/history-ssl-block-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/history/history-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
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
              VCR.use_cassette("integration/history/history-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                
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
              VCR.use_cassette("integration/history/history-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
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
              VCR.use_cassette("integration/history/history-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/history/history-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => true, :http_sync => true, :channel => "demo", :callback => @callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
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
              VCR.use_cassette("integration/history/history-nonssl-block-valid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                
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
              VCR.use_cassette("integration/history/history-nonssl-block-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
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
              VCR.use_cassette("integration/history/history-nonssl-block-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/history/history-nonssl-block-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", &@callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
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
              VCR.use_cassette("integration/history/history-nonssl-parameter-valid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                
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
              VCR.use_cassette("integration/history/history-nonssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey"},{"text":"howdy"},{"text":"hello"}],13904298660188334,13904300138214858]'
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
              VCR.use_cassette("integration/history/history-nonssl-parameter-invalid-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
        context "gets status non-200 in response" do
          context "uses sync connection" do
            it 'works fine' do
              VCR.use_cassette("integration/history/history-nonssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.history(:ssl => false, :http_sync => true, :channel => "demo", :callback => @callback)
                
                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '[[{"text":"hey'
                @message_output.seek 0
                @message_output.read.should eq 'Invalid JSON in response.'
              end
            end
          end
        end
      end
    end
  end

  context 'specific for include_token' do
    it 'works fine with include_token' do
      VCR.use_cassette('integration/history/include_token', :record => :once) do
        enve = @pn.history(http_sync: true, channel: 'bot', count: 4, callback: @callback, include_token: true)

        enve[0].message.should eq '******......... 3491 - 2016-04-13 03:50:06'
        enve[0].timetoken.should eq 14605446066210865

        enve[1].message.should eq '*******........ 3492 - 2016-04-13 03:50:07'
        enve[1].timetoken.should eq 14605446077902610

        enve[2].message.should eq '********....... 3493 - 2016-04-13 03:50:08'
        enve[2].timetoken.should eq 14605446089621213

        enve[3].message.should eq '*********...... 3494 - 2016-04-13 03:50:10'
        enve[3].timetoken.should eq 14605446101325777
      end
    end
  end
end
