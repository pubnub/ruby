# Easy to use and non-complex test scaffold generator
# TODO: improve and make rake task?
# BEWARE: It's not fully automated! You have to record VCRs first!
#         You can do it by creating some simple tests that will pass by default
#         and set :record to :all

actions    = %w(subscribe publish presence history here_now time leave)
#actions    = %w(revoke audit grant)
ssl        = [true, false]
block_cb   = [true, false]
valid_json = [true, false]
status_200 = [true, false]
http_sync  = [true, false]

puts "require 'spec_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes/test'
  c.hook_into :webmock
end"

actions.each do |action|

  puts "describe \"##{action}\" do"

  puts "before(:each) do
          @response_output = StringIO.new
          @message_output = StringIO.new

          @callback = lambda { |envelope|
            $logger.debug 'FIRING CALLBACK FROM TEST'
            @response_output.write envelope.response
            @message_output.write envelope.msg
            @after_callback = true
            if EM.reactor_running? && envelope.is_last?
              EM.stop
            end
          }

          @error_callback = lambda { |envelope|
            $logger.debug 'FIRING ERROR CALLBACK FROM TEST'
            @response_output.write envelope.response
            @message_output.write  envelope.msg
            @after_error_callback = true
            if EM.reactor_running? && envelope.is_last?
              EM.stop
            end
          }

          @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
          @pn.uuid = 'rubytests'

        end"

  ssl.each do |ssl|
    puts "context \"uses #{ssl ? 'ssl' : 'non-ssl'}\" do"
      puts "before(:each) { @ssl = #{ssl.to_s} }"
      block_cb.each do |block_cb|
        puts "context \"passess callback as #{block_cb ? 'block' : 'parameter'}\" do"
          valid_json.each do |valid_json|
            puts "context \"gets #{valid_json ? 'valid' : 'invalid'} json in response\" do"
              status_200.each do |status_200|
                puts "context \"gets status #{status_200 ? '200' : 'non-200'} in response\" do"
                  http_sync.each do |http_sync|
                    puts "context \"uses #{http_sync ? 'sync' : 'async'} connection\" do"
                      puts "it 'works fine' do"
                        puts "VCR.use_cassette(\"#{action}-#{ssl ? 'ssl' : 'nonssl'}-#{block_cb ? 'block' : 'parameter'}-#{valid_json ? 'valid' : 'invalid'}-#{status_200 ? '200' : 'non-200'}-#{http_sync ? 'sync' : 'async'}\", :record => :none) do"

                          # Default options for every action
                          options = {
                            :ssl => ssl,
                            :http_sync => http_sync
                          }

                          # Let's add some specific parameters for some actions
                          merge = case action #subscribe publish presence history here_now time leave revoke audit grant
                            when 'subscribe'
                              {
                                  :channel => 'demo'
                              }
                            when 'publish'
                              {
                                  :channel => 'demo',
                                  :message => {:text => 'hey'}
                              }
                            when 'presence'
                              {
                                  :channel => 'demo'
                              }
                            when 'history'
                              {
                                  :channel => 'demo'
                              }
                            when 'here_now'
                              {
                                  :channel => 'demo'
                              }
                            when 'time'
                              {}
                            when 'leave'
                              {
                                  :channel => 'demo'
                              }
                            when 'revoke'
                              {
                                  :channel => 'demo',
                                  :auth_key => 'authkey',
                                  :write => true,
                                  :read => true,
                                  :publish_key => 'some_publish_key'
                              }
                            when 'audit'
                              {
                                  :channel => 'demo',
                                  :auth_key => 'authkey'
                              }
                            when 'grant'
                              {
                                  :channel => 'demo',
                                  :auth_key => 'authkey',
                                  :write => true,
                                  :read => true,
                                  :publish_key => 'some_publish_key'
                              }

                          end
                          options.merge!(merge)

                          # Cuts {}
                          inspected = options.inspect[1...options.inspect.size-1]

                          # Add to options callback as block or parameter
                          inspected << ', :callback => @callback'  unless block_cb
                          inspected << ', &@callback'              if     block_cb

                          puts "@pn.#{action}(#{inspected})"
                          puts "@pn.#{action}(#{inspected})" if http_sync && (action == 'subscribe' || action == 'presence')

                          # Infinite loop until reactor is down so test will wait for callback TODO: improve to fail after some time so it won't hang
                          puts "while EM.reactor_running? do end"

                          #puts "sleep 10" if action == 'history' && status_200 && valid_json # :( Callback is called for more than one envelope...

                          # Determine which callback should be called basing on valid_json and status_2000
                          puts "@after_callback.should eq true" if valid_json && status_200
                          puts "@after_error_callback.should eq true" if !valid_json || !status_200

                          # Determine messages in output
                          case action
                            when 'here_now'
                              if valid_json
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '{\"uuids\":[\"rubytests\"],\"occupancy\":1}'"
                                if status_200
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '{\"uuids\"=>[\"rubytests\"], \"occupancy\"=>1}'"
                                else
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '{\"uuids\":[\"rubytests\"],\"occupancy\":1'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'history'
                              if valid_json
                                if status_200
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq ('[[{\"text\":\"hey\"},{\"text\":\"howdy\"},{\"text\":\"hello\"}],13904298660188334,13904300138214858]'*3)"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '{\"text\"=>\"hey\"}{\"text\"=>\"howdy\"}{\"text\"=>\"hello\"}'"
                                else
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq '[[{\"text\":\"hey\"},{\"text\":\"howdy\"},{\"text\":\"hello\"}],13904298660188334,13904300138214858]'"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[[{\"text\":\"hey'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'leave'
                              if valid_json
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '{\"action\": \"leave\"}'"
                                if status_200
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '{\"action\"=>\"leave\"}'"
                                else
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '{\"action\": \"leav'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'presence'
                              if valid_json
                                if status_200
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq '[[{\"action\": \"leave\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 1},{\"action\": \"join\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 2}],\"13904300089348992\"][[{\"action\": \"leave\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 1},{\"action\": \"join\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 2}],\"13904300089348992\"]'"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '{\"action\"=>\"leave\", \"timestamp\"=>1390430008, \"uuid\"=>\"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\"=>1}{\"action\"=>\"join\", \"timestamp\"=>1390430008, \"uuid\"=>\"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\"=>2}'"
                                else
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq '[[{\"action\": \"leave\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 1},{\"action\": \"join\", \"timestamp\": 1390430008, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\", \"occupancy\": 2}],\"13904300089348992\"]'"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[[{\"action\": \"leave\", \"timestamp\": 1390430067, \"uuid\": \"3bad4360-2b9f-470f-aaf7-dac04454b1fb\",'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'publish'
                              if valid_json
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[1,\"Sent\",\"13904299694449458\"]'"
                                if status_200
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq 'Sent'"
                                else
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[1,\"Sent\",\"'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'subscribe'
                              if valid_json
                                if status_200
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq '[[{\"text\":\"hey\"},{\"text\":\"hey\"}],\"13904299332319098\"][[{\"text\":\"hey\"},{\"text\":\"hey\"}],\"13904299332319098\"]'"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '{\"text\"=>\"hey\"}{\"text\"=>\"hey\"}'"
                                else
                                  puts "@response_output.seek 0"
                                  puts "@response_output.read.should eq '[[{\"text\":\"hey\"},{\"text\":\"hey\"}],\"13904299332319098\"]'"

                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[[{\"text\":\"hey\"},{\"text\":\"hey\"}],\"'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                            when 'time'
                              if valid_json
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[13904301930718907]'"
                                if status_200
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '13904301930718907'"
                                else
                                  puts "@message_output.seek 0"
                                  puts "@message_output.read.should eq '[0,\"Non 2xx server response\"]'"
                                end
                              else
                                puts "@response_output.seek 0"
                                puts "@response_output.read.should eq '[13904301869920523'"

                                puts "@message_output.seek 0"
                                puts "@message_output.read.should eq '[0,\"Invalid JSON in response.\"]'"
                              end

                          end



                        puts "end"
                      puts "end"
                    puts "end"
                    end
                puts "end"
              end
            puts "end"
          end
        puts "end"
      end
    puts "end"
  end
  puts "end"
end