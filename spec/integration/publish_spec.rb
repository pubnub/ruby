require 'spec_helper'

describe Pubnub::Publish do
  around(:each) do |example|
    @envelopes = Array.new
    @error_envelopes = Array.new

    @callback = lambda do |envelope|
      @envelopes << envelope
    end

    @error_callback = lambda do |envelope|
      @error_envelopes << envelope
    end

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'uses http' do
    context 'with auth_key provided' do
      context 'without encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :auth_key => :demoish_authkey,
              :secret_key => 'some_secret_key',
              :error_callback => @error_callback

          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-http-auth_key-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.should eq '13936818988607190'

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-http-auth_key-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-http-auth_key-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.should eq '13936818988607190'

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-http-auth_key-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end

      context 'with encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :auth_key => :demoish_authkey,
              :secret_key => 'some_secret_key',
              :cipher_key => 'secret',
              :error_callback => @error_callback
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-auth_key-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do
            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-auth_key-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-auth_key-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-auth_key-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end
    end

    context 'without auth_key provided' do
      context 'without encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :error_callback => @error_callback
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-http-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-http-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-http-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-http-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end

      context 'with encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :cipher_key => 'secret',
              :error_callback => @error_callback
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-http-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end
    end
  end

  context 'uses https' do
    context 'with auth_key provided' do
      context 'without encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :auth_key => :demoish_authkey,
              :secret_key => 'some_secret_key',
              :error_callback => @error_callback,
              :ssl => true
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-https-auth_key-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-https-auth_key-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-https-auth_key-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-https-auth_key-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end

      context 'with encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :auth_key => :demoish_authkey,
              :secret_key => 'some_secret_key',
              :cipher_key => 'secret',
              :error_callback => @error_callback,
              :ssl => true
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-auth_key-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-auth_key-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-auth_key-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-auth_key-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end
    end

    context 'without auth_key provided' do
      context 'without encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :error_callback => @error_callback,
              :ssl => true
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-https-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-https-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-https-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-https-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13936818988607190"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end

      context 'with encrypting message' do

        before(:each) do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :cipher_key => 'secret',
              :error_callback => @error_callback,
              :ssl => true
          )

          @pubnub.uuid = 'tester'
        end

        context 'gets status 200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'publishes valid message' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 1
                  @envelopes.first.response_message.should eq 'Sent'
                  @envelopes.first.status.should eq 200
                  @envelopes.first.channel.should eq 'ruby_demo_channel'
                  @envelopes.first.message.should eq({:text => 'sometext'})
                  @envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 200
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end

        context 'gets status non200 response' do
          context 'with valid json' do

            context 'its synchronous' do
              it 'handles non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-non200-valid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq 'Sent'
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"]')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Non 2xx server response."]')
                  @error_envelopes.first.timetoken.blank?.should eq false

                end
              end
            end
          end

          context 'with invalid json' do

            context 'its synchronous' do
              it 'handles invalid json and non200 response gracefully' do
                VCR.use_cassette('integration/publish/publish-encrypted-https-non200-invalid', :record => :none) do

                  @pubnub.publish(
                      :message => {:text => 'sometext'},
                      :channel => 'ruby_demo_channel',
                      :callback => @callback,
                      :http_sync => true
                  )

                  @envelopes.size.should eq 0
                  @error_envelopes.size.should eq 1
                  @error_envelopes.first.response_message.should eq nil
                  @error_envelopes.first.response.should eq('[1,"Sent","13937904716672898"')
                  @error_envelopes.first.status.should eq 500
                  @error_envelopes.first.channel.should eq('ruby_demo_channel')
                  @error_envelopes.first.message.should eq('[0,"Invalid JSON in response."]')
                  @error_envelopes.first.timetoken.blank?.should eq true

                end
              end
            end
          end
        end
      end
    end
  end

  context 'when gets message as' do
    context 'array of hashes' do
      context 'and its plain' do
        it 'publishes it correctly' do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :error_callback => @error_callback
          )

          @pubnub.uuid = 'tester'

          msg = [{:a => 1}, {:b => 2}, :c => [1,2,3]]

          VCR.use_cassette('integration/publish/publish-plain-array-of-hashes', :record => :none) do

            @pubnub.publish(
                :message => msg,
                :channel => 'ruby_demo_channel',
                :callback => @callback,
                :http_sync => true
            )

              @envelopes.size.should eq 1
              @envelopes.first.response_message.should eq 'Sent'
              @envelopes.first.status.should eq 200
              @envelopes.first.channel.should eq 'ruby_demo_channel'
              @envelopes.first.message.should eq(msg)
              @envelopes.first.timetoken.blank?.should eq false
          end

        end
      end

      context 'and its encrypted' do
        it 'publishes it correctly' do
          @pubnub = Pubnub.new(
              :max_retries => 0,
              :subscribe_key => :demo,
              :publish_key => :demo,
              :secret_key => 'some_secret_key',
              :cipher_key => 'secret',
              :error_callback => @error_callback,
              :ssl => true
          )

          @pubnub.uuid = 'tester'

          msg = [{:a => 1}, {:b => 2}, :c => [1,2,3]]

          VCR.use_cassette('integration/publish/publish-encrypted-array-of-hashes', :record => :none) do

            @pubnub.publish(
                :message => msg,
                :channel => 'ruby_demo_channel',
                :callback => @callback,
                :http_sync => true
            )

              @envelopes.size.should eq 1
              @envelopes.first.response_message.should eq 'Sent'
              @envelopes.first.status.should eq 200
              @envelopes.first.channel.should eq 'ruby_demo_channel'
              @envelopes.first.message.should eq(msg)
              @envelopes.first.timetoken.blank?.should eq false
          end
        end
      end
    end
  end

  context ':meta parameter' do
    before(:each) do
      @pubnub = Pubnub.new(
          :max_retries => 0,
          :subscribe_key => :demo,
          :publish_key => :demo,
          :auth_key => :demoish_authkey,
          :secret_key => 'some_secret_key',
          :error_callback => @error_callback

      )

      @pubnub.uuid = 'tester'
    end

    it 'works fine' do
      VCR.use_cassette('integration/publish/publish-meta', :record => :once) do

        @pubnub.publish(
            message: { text: 'sometext' },
            channel: 'ruby_demo_channel',
            callback: @callback,
            http_sync: true,
            meta: { region: :west }
        )

        @envelopes.size.should eq 1
        # @envelopes.first.response_message.should eq 'Sent'
        # @envelopes.first.status.should eq 200
        # @envelopes.first.channel.should eq 'ruby_demo_channel'
        # @envelopes.first.message.should eq({:text => 'sometext'})
        # @envelopes.first.timetoken.should eq '13936818988607190'

      end
    end

    it 'is validated' do
      expect{ @pubnub.publish(
          message: { text: 'sometext' },
          channel: 'ruby_demo_channel',
          callback: @callback,
          http_sync: true,
          meta: 123
      ) }.to raise_error(Pubnub::ArgumentError)
    end
  end
end