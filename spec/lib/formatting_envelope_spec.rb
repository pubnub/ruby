require 'spec_helper'

describe "Pubnub::Envelope" do
  context 'after subscribe' do
    context 'without cipher key' do

      before(:each) do
        sleep(0.1)
        @pn = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo)
      end

      context 'on one channel' do
        context 'after getting string' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-one-channel-string", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              envelopes.size.should eq 1
            end
          end

        end

        context 'after getting integer' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-one-channel-integer", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              envelopes.size.should eq 1
            end
          end

        end

        context 'after getting array' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-one-channel-array", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              envelopes.size.should eq 1
            end
          end
        end


        context 'after getting hash' do
          it 'formats envelopes hash' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-one-channel-hash", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              envelopes.size.should eq 1
            end
          end

        end

        context 'after getting mix of everything' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-one-channel-mix", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              envelopes.size.should eq 4
            end
          end

        end
      end

      context 'on many channels' do
        context 'after getting string' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-string", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting integer' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-integer", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting array' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-array", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end
        end


        context 'after getting hash' do
          it 'formats envelopes hash' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-hash", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting mix of everything' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-mix", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

          end

        context 'after getting mix of everything from both channels' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-without-cipherkey-many-channels-multi-mix", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end
      end
    end

    context 'with cipher key' do

      before(:each) do
        @pn = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo, :cipher_key => 'secret')
      end

      context 'on one channel' do
        context 'after getting string' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-one-channel-string", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting integer' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-one-channel-integer", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting array' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-one-channel-array", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              

              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              #envelopes.size.should eq 1
            end
          end
        end


        context 'after getting hash' do
          it 'formats envelopes hash' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-one-channel-hash", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting mix of everything' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-one-channel-mix", :record => :none) do
              @pn.subscribe(:channel => :test_channel_one, :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => :test_channel_one, :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end
      end

      context 'on many channels' do
        context 'after getting string' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-string", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting integer' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-integer", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting array' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-array", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end
        end


        context 'after getting hash' do
          it 'formats envelopes hash' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-hash", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)

              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting mix of everything' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-mix", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end

        context 'after getting mix of everything from both channels' do
          it 'formats envelopes properly' do
            VCR.use_cassette("formatting-envelope-subscribe-cipherkey-many-channels-multi-mix", :record => :none) do
              @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              
              envelopes = @pn.subscribe(:channel => [:test_channel_one, :test_channel_two], :http_sync => true)
              #envelopes.size.should eq 1
            end
          end

        end
      end
    end
  end
end