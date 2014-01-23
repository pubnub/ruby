require 'spec_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

def cartesian_product(*args)
  result = [[]]
  while [] != args
    t, result = result, []
    b, *args = args
    t.each do |a|
      b.each do |n|
        result << a + [n]
      end
    end
  end
  result
end

actions    = %w(subscribe publish presence history here_now time) # leave revoke audit grant
ssl        = [true, false]
block_cb   = [true, false]
valid_json = [true, false]
status_200 = [true, false]
http_sync  = [true, false]

possibilities = cartesian_product actions, ssl, block_cb, valid_json, status_200, http_sync

describe 'Full automated test' do

  possibilities.each do |p|
    action     = p[0]
    ssl        = p[1]
    block_cb   = p[2]
    valid_json = p[3]
    status_200 = p[4]
    http_sync  = p[5]

    it "Fires #{action} with ssl #{ssl ? 'enabled' : 'disabled'}, passing callback as #{block_cb ? 'block' : 'parameter'} and mocking response with #{valid_json ? 'valid' : 'invalid'} json and status #{status_200 ? '200' : 'non-200'} #{http_sync ? 'sync' : 'async'}" do

      @pn = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo)
      @pn.uuid = 'rubytests'

      @response_output = StringIO.new
      @message_output = StringIO.new

      @error_response_output = StringIO.new
      @error_message_output = StringIO.new

      @callback = lambda { |envelope|
        $logger.debug 'FIRING CALLBACK FROM TEST'
        @response_output.write envelope.response
        @message_output.write envelope.msg
        @after_callback = true
        if EM.reactor_running?
          EM.stop
        end
      }

      @error_callback = lambda { |envelope|
        $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
        @error_response_output.write envelope.response
        @error_message_output.write  envelope.msg
        @after_error_callback = true
        if EM.reactor_running?
          EM.stop
        end
      }

      @expect_error = valid_json ? false : true

      @expected_text
      @expected_response

      $logger.debug "Fires #{action} with ssl #{ssl ? 'enabled' : 'disabled'}, passing callback as #{block_cb ? 'block' : 'parameter'} and mocking response with #{valid_json ? 'valid' : 'invalid'} json and status #{status_200 ? '200' : 'non-200'}"
      VCR.use_cassette("#{action}-#{ssl ? 'ssl' : 'nonssl'}-#{block_cb ? 'block' : 'parameter'}-#{valid_json ? 'valid' : 'invalid'}-#{status_200 ? '200' : 'non-200'}-#{http_sync ? 'sync' : 'async'}", :record => :all) do

        if action == 'publish'
          message = '{:text => "demo"}'
        else
          message = nil
        end

        channel = :demo

        @pn.public_send(action, :ssl => ssl, :http_sync => http_sync, :message => message, :callback => @callback, :channel => :demo)
        while EM.reactor_running? do end
        #@after_callback.should eq true if valid_json && status_200
        #@after_erro_callback.should eq true if !valid_json || !status_200

        if EM.reactor_running?
          EM.stop
        end

      end

    end

  end
end