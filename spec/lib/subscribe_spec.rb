require 'spec_helper'
require 'rr'
require 'stringio'
require 'webmock/rspec'

describe '#subscirbe' do
  before do
    @output = StringIO.new
    @error_output = StringIO.new
    @callback = lambda { |envelope|
      @output.write envelope.response
      @after_callback = true
    }
    @error_callback = lambda { |envelope|
      $log.error envelope.response
      @error_output.write envelope.response
      @after_callback = true
    }
    @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
    @pn.session_uuid = nil
  end

  before(:each) do
    @after_callback = false
  end

  context 'when it gets server error' do

    before(:each) do
      @counter = 0
      stub_request(:get, /http:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
          to_return(lambda { |request|
            @counter += 1
            if @counter < 10
              {
                :body => 'wtf',
                :status => 500,
                :headers => {
                  'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
              }
            else
              {
                :body => [[{"text" => "hey"}],"#{/\/(\d+)\/$/.match request.uri.path}"].to_json,
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
              }
            end
          }
      )

      stub_request(:get, /http:\/\/pubsub.pubnub.com\/time\/0/).
        to_return(
          {
              :body => [13802747937420388].to_json,
              :status => 200,
              :headers => {
                  'Content-Type' => 'text/javascript; charset="UTF-8"'
              }
          }
      )
    end

    context 'via http' do
      context 'and response message is usable' do
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
            my_response =  [[{"text" => "hey"}],""].to_json

            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)

            @output.seek(0)

            @output.read.should eq my_response

          end

          it 'fires given block on response envelope and retry' do
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end
          it 'fires given callback on response envelope and retry' do
          end

          it 'fires given block on response envelope and retry' do
          end
        end
      end

      context 'and response message is not usable' do
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on hardcoded envelope and retry' do
          end

          it 'fires given block on hardcoded envelope and retry' do
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end
          it 'fires given callback on hardcoded envelope and retry' do
          end

          it 'fires given block on hardcoded envelope and retry' do
          end
        end
      end
    end

    context 'via https' do
      before do
        @pn.ssl = true
      end
      context 'and response message is usable' do
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
          end

          it 'fires given block on response envelope and retry' do
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end
          it 'fires given callback on response envelope and retry' do
          end

          it 'fires given block on response envelope and retry' do
          end
        end
      end

      context 'and response message is not usable' do
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on hardcoded envelop and retrye' do
          end

          it 'fires given block on hardcoded envelope and retry' do
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end
          it 'fires given callback on hardcoded envelope and retry' do
          end

          it 'fires given block on hardcoded envelope and retry' do
          end
        end
      end
    end
  end

  context 'it gets correct message' do
    before(:each) do
      stub_request(:get, /http:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
          to_return(
          :body => [[{"text" => "hey"}],"13801825008602950"].to_json,
          :status => 200,
          :headers => {
              'Content-Type' => 'text/javascript; charset="UTF-8"'
          }
      )
    end
    context 'without secret key' do
      context 'without cipher_key' do
        context 'via http' do
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end

        context 'via https' do
          before do
            @pn.ssl = true
          end
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end
      end

      context 'using cipher_key' do
        before do
          @pn.cipher_key = 'enigma'
        end
        context 'via http' do
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end

        context 'via https' do
          before do
            @pn.ssl = true
          end
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end
      end
    end

    context 'with secret key' do
      before do
        @pn.secret_key = 'skey'
      end
      context 'without cipher_key' do
        context 'via http' do
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end

        context 'via https' do
          before do
            @pn.ssl = true
          end
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end
      end

      context 'using cipher_key' do
        before do
          @pn.cipher_key = 'enigma'
        end
        context 'via http' do
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end

        context 'via https' do
          before do
            @pn.ssl = true
          end
          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope' do
            end

            it 'fires given block on response envelope' do
            end
          end
        end
      end
    end
  end
end