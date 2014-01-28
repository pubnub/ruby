require 'spec_helper'

describe '#subscribe' do
  before do
    EM.stop if EM.reactor_running?
    stub_request(:get, 'http://pubsub.pubnub.com/v2/presence/sub-key/demo/channel/demo/leave').
        to_return(
        {
            :body => '{"action": "leave"}',
            :status => 200,
            :headers => {
                'Content-Type' => 'text/javascript; charset="UTF-8"'
            }
        }
    )
  end

  after(:each) do
    while EM.reactor_running? do end
  end

  context 'when it get invalid JSON with 200 status' do

    before(:each) do
      @after_callback = false
      @output = StringIO.new
      @error_output = StringIO.new
      @msg_output = StringIO.new

      @callback = lambda { |envelope|
        $logger.debug 'FIRE TEST CALLBACK'
        @output.write envelope.response
        @msg_output.write envelope.msg
        @after_callback = true
        EM.stop if EM.reactor_running?
      }

      @error_callback = lambda { |envelope|
        $logger.debug 'FIRE TEST ERROR CALLBACK'
        $logger.error envelope.response
        @error_output.write envelope.response
        @after_error_callback = true
      }
    end

    context 'via http' do

      before(:each) do
        @counter = 0
        stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).            to_return(lambda { |request|
          @counter += 1
          if @counter < 3
            {
                :body => '^*STDAH@U#H A{}ASD@EDA S3',
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          else
            {
                :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          end
        }
        )
      end

      before(:all) do
        @ssl = false
      end
      context 'and it\'s synchronous' do
        before(:all) do
          @http_sync = true
        end

        it 'retries until max retries limit is reached' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 1, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)

          @error_output.seek(0)
          @error_output.read.should eq ('^*STDAH@U#H A{}ASD@EDA S3'*2) # *2 because it calls error callback twice (one - first request, second - retry)
        end

        it 'retries until it gets correct response' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 3, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)
          until @after_callback do end
          @output.seek(0)
          @output.read.should eq "[[{\"text\":\"hey\"}],\"1\"]"
        end
      end

      context 'and it\'s asynchronous' do
        before(:all) do
          @http_sync = false
        end

        it 'retries until max retries limit is reached' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 1, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)

          until @after_callback do end

          @error_output.seek(0)
          @error_output.read.should eq ('^*STDAH@U#H A{}ASD@EDA S3'*2) # *2 because it calls error callback twice (one - first request, second - retry)
        end

        it 'retries until it gets correct response' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 3, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)
          until @after_callback do end
          @output.seek(0)
          @output.read.should eq "[[{\"text\":\"hey\"}],\"1\"]"
        end
      end
    end

    context 'via https' do
      before(:each) do
        @counter = 0
        stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).            to_return(lambda { |request|
          @counter += 1
          if @counter < 3
            {
                :body => '^*STDAH@U#H A{}ASD@EDA S3',
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          else
            {
                :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          end
        }
        )
      end

      before(:all) do
        @ssl = true
      end
      context 'and it\'s synchronous' do
        before(:all) do
          @http_sync = true
        end

        it 'retries until max retries limit is reached' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 1, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)

          @error_output.seek(0)
          @error_output.read.should eq ('^*STDAH@U#H A{}ASD@EDA S3'*2) # *2 because it calls error callback twice (one - first request, second - retry)
        end

        it 'retries until it gets correct response' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 3, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)
          until @after_callback do end
          @output.seek(0)
          @output.read.should eq "[[{\"text\":\"hey\"}],\"1\"]"
        end
      end

      context 'and it\'s asynchronous' do
        before(:all) do
          @http_sync = false
        end

        it 'retries until max retries limit is reached' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 1, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)
          until @after_callback do end

          @error_output.seek(0)
          @error_output.read.should eq ('^*STDAH@U#H A{}ASD@EDA S3'*2) # *2 because it calls error callback twice (one - first request, second - retry)
        end

        it 'retries until it gets correct response' do
          @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback, :max_retries => 3, :ssl => @ssl)
          @pn.session_uuid = nil

          @pn.subscribe(:channel => :demo, :http_sync => @http_sync, :callback => @callback)
          until @after_callback do end
          @output.seek(0)
          @output.read.should eq "[[{\"text\":\"hey\"}],\"1\"]"
        end
      end
    end
  end

  context 'when it gets server error' do

    before(:each) do
      @after_callback = false
      @output = StringIO.new
      @error_output = StringIO.new
      @msg_output = StringIO.new

      @callback = lambda { |envelope|
        $logger.debug 'FIRE TEST CALLBACK'
        @output.write envelope.response
        @msg_output.write envelope.msg
        @after_callback = true
        EM.stop if EM.reactor_running?
      }

      @error_callback = lambda { |envelope|
        $logger.error envelope.response
        @error_output.write envelope.response
        @after_error_callback = true
      }

      @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
      @pn.set_uuid(nil)
    end

    context 'via http' do
      context 'and response message is usable' do
        before(:each) do
          @counter = 0
          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            @counter += 1
            if @counter < 3
              {
                  :body => [500, 'Error msg'].to_json,
                  :status => 500,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            else
              {
                  :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            end
          }
          )

        end

        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            $logger.debug 'START #SUBSCRIBE SPEC #7'
            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end

          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end
        end
      end

      context 'and response message is not usable' do
        before(:each) do
          @counter = 0
          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            @counter += 1
            if @counter < 3
              {
                  :body => '2132131asad@!EASD#!',
                  :status => 500,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            else
              @counter = 0
              {
                  :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            end
          }
          )

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
              to_return(
              {
                  :body => '[13804562752311765]',
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
          )
        end
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end

          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end
        end
      end
    end

    context 'via https' do
      before do
        @pn.ssl = true
      end
      context 'and response message is usable' do
        before(:each) do
          @counter = 0
          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            @counter += 1
            if @counter < 3
              {
                  :body => [500, 'Error msg'].to_json,
                  :status => 500,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            else
              {
                  :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            end
          }
          )

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
              to_return(
              {
                  :body => '[13804562752311765]',
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
          )
        end

        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            $logger.debug 'START #SUBSCRIBE SPEC #7'

            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end

          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end
        end
      end

      context 'and response message is not usable' do
        before(:each) do
          @counter = 0
          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            @counter += 1
            if @counter < 3
              {
                  :body => '2132131asad@!EASD#!',
                  :status => 500,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            else
              @counter = 0
              {
                  :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
            end
          }
          )

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
              to_return(
              {
                  :body => '[13804562752311765]',
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
          )
        end
        context 'and it\'s synchronous' do
          before(:each) do
            @http_sync = true
          end
          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/

            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)

            @output.read.should match response_regex
          end
        end

        context 'and it\'s asynchronous' do
          before(:each) do
            @http_sync = false
          end

          it 'fires given callback on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end

          it 'fires given block on response envelope and retry' do
            response_regex = /text.*hey\D*\d*/
            @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
            until @after_callback do end
            @output.seek(0)
            @output.read.should match response_regex
          end
        end
      end
    end
  end

  context 'it gets correct single message' do

    before(:each) do
      @after_callback = false
      @output = StringIO.new
      @error_output = StringIO.new
      @msg_output = StringIO.new

      @callback = lambda { |envelope|
        $logger.debug 'FIRE CALLBACK'
        @output.write envelope.response
        @msg_output.write envelope.msg
        @after_callback = true
        EM.stop if EM.reactor_running?
      }

      @error_callback = lambda { |envelope|
        $logger.error envelope.response
        @error_output.write envelope.response
        @after_error_callback = true
      }

      @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
      @pn.set_uuid(nil)
    end

    before(:each) do
      stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
          to_return(lambda { |request|
        {
            :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
            :status => 200,
            :headers => {
                'Content-Type' => 'text/javascript; charset="UTF-8"'
            }
        }
      }
      )

      stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
          to_return(
          {
              :body => '[13804562752311765]',
              :status => 200,
              :headers => {
                  'Content-Type' => 'text/javascript; charset="UTF-8"'
              }
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
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
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
            context 'and it\'s asynchronous' do
              before(:each) do
                @http_sync = false
              end
              it 'fires given callback on response envelope and retry' do
                response_regex = /text.*hey\D*\d*/
                @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end

              it 'fires given block on response envelope and retry' do
                response_regex = /text.*hey\D*\d*/
                @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end
            end

            context 'and it\'s synchronous' do
              before(:each) do
                @http_sync = true
              end
              it 'fires given callback on response envelope and retry' do
                response_regex = /text.*hey\D*\d*/
                @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end

              it 'fires given block on response envelope and retry' do
                response_regex = /text.*hey\D*\d*/
                @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end
            end
          end
        end
      end

      context 'using cipher_key' do
        before do
          @pn.cipher_key = 'enigma'

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            {
                :body => ["E8VOcbfrYqLyHMtoVGv9UQ==","#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          }
          )

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
              to_return(
              {
                  :body => '[13804562752311765]',
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
          )
        end
        context 'via http' do
          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end

          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
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
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text.*hey\D*\d*/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end
        end
      end
    end
  end

  context 'it gets correct multiple message' do

    before(:each) do
      @after_callback = false
      @output = StringIO.new
      @error_output = StringIO.new
      @msg_output = StringIO.new
      @first_callback_done = false

      @callback = lambda { |envelope|
        $logger.debug 'FIRE CALLBACK'
        @output.write envelope.response
        @msg_output.write envelope.msg
        if @first_callback_done
          EM.stop if EM.reactor_running?
          @after_callback = true
        else
          @first_callback_done = true
        end
      }

      @error_callback = lambda { |envelope|
        $logger.error envelope.response
        @error_output.write envelope.response
        @after_error_callback = true
      }

      @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
      @pn.set_uuid(nil)
    end

    before(:each) do
      stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
          to_return(lambda { |request|
        {
            :body => [[{"text" => "hey"},{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
            :status => 200,
            :headers => {
                'Content-Type' => 'text/javascript; charset="UTF-8"'
            }
        }
      }
      )

      stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
          to_return(
          {
              :body => '[13804562752311765]',
              :status => 200,
              :headers => {
                  'Content-Type' => 'text/javascript; charset="UTF-8"'
              }
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
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @output.seek(0)
              @output.read.should match response_regex
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
            context 'and it\'s asynchronous' do
              before(:each) do
                @http_sync = false
              end
              it 'fires given callback on response envelope and retry' do
                response_regex = /text\W*hey\W*text\W*hey/
                @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end

              it 'fires given block on response envelope and retry' do
                response_regex = /text\W*hey\W*text\W*hey/
                @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end
            end

            context 'and it\'s synchronous' do
              before(:each) do
                @http_sync = true
              end
              it 'fires given callback on response envelope and retry' do
                response_regex = /text\W*hey\W*text\W*hey/
                @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end

              it 'fires given block on response envelope and retry' do
                response_regex = /text\W*hey\W*text\W*hey/
                @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
                until @after_callback do end
                @output.seek(0)
                @output.read.should match response_regex
              end
            end
          end
        end
      end

      context 'using cipher_key' do
        before do
          @pn.cipher_key = 'enigma'

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
              to_return(lambda { |request|
            {
                :body => [["E8VOcbfrYqLyHMtoVGv9UQ==","E8VOcbfrYqLyHMtoVGv9UQ=="],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                :status => 200,
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          }
          )

          stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/time\/0/).
              to_return(
              {
                  :body => '[13804562752311765]',
                  :status => 200,
                  :headers => {
                      'Content-Type' => 'text/javascript; charset="UTF-8"'
                  }
              }
          )
        end
        context 'via http' do
          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end

          context 'and it\'s asynchronous' do
            before(:each) do
              @http_sync = false
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
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
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end

          context 'and it\'s synchronous' do
            before(:each) do
              @http_sync = true
            end
            it 'fires given callback on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :callback => @callback, :http_sync => @http_sync)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end

            it 'fires given block on response envelope and retry' do
              response_regex = /text\W*hey\W*text\W*hey/
              @pn.subscribe(:channel => 'demo', :http_sync => @http_sync, &@callback)
              until @after_callback do end
              @msg_output.seek(0)
              @msg_output.read.should match response_regex
            end
          end
        end
      end
    end
  end
end