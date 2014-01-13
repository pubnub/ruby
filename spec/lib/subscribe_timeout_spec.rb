require 'spec_helper'

describe '#subscribe' do
  context 'got timeout' do

    before(:each) do
      @after_callback = false
      @after_error_callback = false
      @output = StringIO.new
      @error_output = StringIO.new
      @msg_output = StringIO.new

      @callback = lambda { |envelope|
        $log.debug 'FIRE CALLBACK'
        @after_callback = true
        @output.write envelope.response
        @msg_output.write envelope.msg
        EM.stop if EM.reactor_running?
      }

      @error_callback = lambda { |envelope|
        if envelope.is_a? Array
          $log.error envelope
        else
          @error_output.write envelope.response
        end
        @after_error_callback = true
      }

      @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
      @pn.session_uuid = nil
    end

    before(:each) do
      stub_request(:get, /http[s]?:\/\/pubsub.pubnub.com\/subscribe\/demo\/demo\/0\/\d+/).
          to_timeout.
          to_return(lambda { |request|
            {
                :body => [[{"text" => "hey"}],"#{/\d+$/.match(request.uri.path).to_s.to_i + 1}"].to_json,
                :status => '200',
                :headers => {
                    'Content-Type' => 'text/javascript; charset="UTF-8"'
                }
            }
          })

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

    it 'raises error callback with proper message and continue' do
      #binding.pry
      @pn.subscribe(:channel => :demo, :callback => @callback)
      until @after_callback do end
    end
  end
end
