require 'spec_helper'
require 'rr'
require 'vcr'

describe Pubnub::Request do
  before do
    @pubnub_request = Pubnub::Request.new(
      :subscribe_key => 'subscribe_key',
      :origin        => 'pubsub.pubnub.com'
    )
  end

  describe 'origin' do
    context 'port' do
      it 'set port to 80 and http when ssl isn\'t set' do
        @pubnub_request.ssl = false
        @pubnub_request.port.should eq 80
        @pubnub_request.origin[0..4].should eq 'http:'
      end

      it 'set port to 443 and http when ssl isn\'t set' do
        @pubnub_request.ssl = true
        @pubnub_request.port.should eq 443
        @pubnub_request.origin[0..4].should eq 'https'
      end
    end
  end

  describe 'created path' do
    context 'when operation' do
      context 'is publish' do
        context 'and it\'s not encrypted' do
          it 'is valid' do
            @pubnub_request = Pubnub::Request.new(
                :operation     => 'publish',
                :channel       => 'channel',
                :subscribe_key => 'subscribe_key',
                :origin        => 'pubsub.pubnub.com',
                :publish_key   => 'publish_key',
                :message       => 'test_message'
            )

            @pubnub_request.path.should eq '/publish/publish_key/subscribe_key/0/channel/0/%22test_message%22'
          end
        end
        context 'and it\'s encrypted' do
          it 'is valid' do
            @pubnub_request = Pubnub::Request.new(
                :operation     => 'publish',
                :channel       => 'channel',
                :subscribe_key => 'subscribe_key',
                :origin        => 'pubsub.pubnub.com',
                :publish_key   => 'publish_key',
                :message       => 'test_message',
                :cipher_key    => 'so_secret_key'
            )

            @pubnub_request.path.should eq '/publish/publish_key/subscribe_key/0/channel/0/%22OfUPhgfENucj3lsbSef1qg==%22'
          end
        end
      end

      context 'is subscribe' do
        it 'is valid' do
          @pubnub_request = Pubnub::Request.new(
              :operation     => 'subscribe',
              :channel       => 'channel',
              :subscribe_key => 'subscribe_key',
              :origin        => 'pubsub.pubnub.com',
              :publish_key   => 'publish_key'
          )

          @pubnub_request.path.should eq '/subscribe/subscribe_key/channel/0/0'
        end
      end

      context 'is history' do
        it 'is valid' do
          @pubnub_request = Pubnub::Request.new(
              :operation     => 'history',
              :channel       => 'channel',
              :subscribe_key => 'subscribe_key',
              :origin        => 'pubsub.pubnub.com',
              :publish_key   => 'publish_key'
          )

          @pubnub_request.path.should eq '/v2/history/sub-key/subscribe_key/channel/channel'
        end

      end

      context 'is presence' do
        it 'is valid' do
          @pubnub_request = Pubnub::Request.new(
            :operation     => 'presence',
            :channel       => 'channel',
            :subscribe_key => 'subscribe_key',
            :origin        => 'pubsub.pubnub.com',
            :publish_key   => 'publish_key'
          )

          @pubnub_request.path.should eq '/subscribe/subscribe_key/channel-pnpres/0/0'
        end
      end

      context 'is here_now' do
        it 'is valid' do
          @pubnub_request = Pubnub::Request.new(
              :operation     => 'here_now',
              :channel       => 'channel',
              :subscribe_key => 'subscribe_key',
              :origin        => 'pubsub.pubnub.com',
              :publish_key   => 'publish_key'
          )

          @pubnub_request.path.should eq '/v2/presence/sub-key/subscribe_key/channel/channel'
        end
      end

      context 'is time' do
        it 'is valid' do
          @pubnub_request = Pubnub::Request.new(
              :operation     => 'time',
              :channel       => 'channel',
              :subscribe_key => 'subscribe_key',
              :origin        => 'pubsub.pubnub.com',
              :publish_key   => 'publish_key'
          )

          @pubnub_request.path.should eq '/time/0'
        end
      end
    end
  end

  describe 'created query' do
    it 'fits to passed parameters' do
      params = { :uuid => '123-123-123', :some_val => 'value' }
      @pubnub_request = Pubnub::Request.new(
          :operation     => 'time',
          :channel       => 'channel',
          :subscribe_key => 'subscribe_key',
          :origin        => 'pubsub.pubnub.com',
          :publish_key   => 'publish_key',
          :params        => params
      )

      @pubnub_request.query.should eq 'some_val=value&uuid=123-123-123'
    end
  end
end
