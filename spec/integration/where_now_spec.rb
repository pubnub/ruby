require 'spec_helper'

describe Pubnub::WhereNow do
  around(:each) do |example|
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

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end
  
  context 'uses ssl' do
    context 'passes callback as block' do
      context 'gets valid json in respone' do
        context 'gets status 200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-block-valid-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
        end
        context 'gets status non-200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-block-valid-non-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end

            end
          end
        end
      end
      context 'gets invalid json in respone' do
        context 'gets status 200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-block-invalid-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"'
                @message_output.seek 0
                @message_output.read.should eq "[0,\"Invalid JSON in response.\"]"
              end

            end
          end
        end
        context 'gets status non-200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-block-invalid-non-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"'
                @message_output.seek 0
                @message_output.read.should eq "[0,\"Invalid JSON in response.\"]"
              end

            end
          end
        end
      end
    end
    context 'passes callback as parameter' do
      context 'gets valid json in respone' do
        context 'gets status 200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-parameter-valid-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"}'
                @message_output.seek 0
                @message_output.read.should eq 'OK'
              end
            end
          end
        end
        context 'gets status non-200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-parameter-valid-non-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"}'
                @message_output.seek 0
                @message_output.read.should eq '[0,"Non 2xx server response."]'
              end

            end
          end
        end
      end
      context 'gets invalid json in respone' do
        context 'gets status 200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-parameter-invalid-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"'
                @message_output.seek 0
                @message_output.read.should eq "[0,\"Invalid JSON in response.\"]"
              end

            end
          end
        end
        context 'gets status non-200 in response' do
          context 'uses sync connection' do
            it 'works fine' do
              VCR.use_cassette("integration/where_now/where_now-ssl-parameter-invalid-non-200-sync", :record => :none) do
                @pn.where_now(:ssl => true, :http_sync => true, :uuid => "demo_uuid", &@callback)

                @after_error_callback.should eq true
                @response_output.seek 0
                @response_output.read.should eq '{"status": 200, "message": "OK", "payload": {"channels": []}, "service": "Presence"'
                @message_output.seek 0
                @message_output.read.should eq "[0,\"Invalid JSON in response.\"]"
              end

            end
          end
        end
      end
    end
  end
end
