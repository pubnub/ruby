require 'spec_helper'
require 'rr'
require 'vcr'

describe Pubnub::Client do

  describe '#uuid' do
    it 'should return a UUID' do
    end
  end

  describe '.initialize' do

    before do
      @publish_key   = 'demo_pub_key'
      @subscribe_key = 'demo_sub_key'
      @secret_key    = 'demo_md5_key'
      @cipher_key    = 'demo_cipher_key'
      @ssl           = false
      @channel       = 'pn_test'
    end

    shared_examples_for 'successful initialization' do

      it 'should initialize' do
        @pn.publish_key.should   == @publish_key
        @pn.subscribe_key.should == @subscribe_key
        @pn.secret_key.should    == @secret_key
        @pn.cipher_key.should    == @cipher_key
        @pn.ssl.should           == @ssl_enabled
      end
    end

    context 'when initialized' do
      it 'should set a sessionUUID' do
        Pubnub.new(:subscribe_key => :demo).session_uuid.should_not == nil
      end
    end

    context 'when named' do
      context 'and there are more than one arguments' do
        it 'should throw an error' do
          lambda { Pubnub::Client.new('arg1', 'arg2', 'arg3') }.should raise_error
        end
      end
    end

    context 'when passed with optional parameters in a hash' do
      context 'when the hash key is a symbol' do
        before do
          @pn = Pubnub::Client.new(:publish_key   => @publish_key,
                                   :subscribe_key => @subscribe_key,
                                   :secret_key    => @secret_key,
                                   :cipher_key    => @cipher_key,
                                   :ssl           => @ssl_enabled)
        end
        it_behaves_like 'successful initialization'
      end
    end

    describe '.verify_config' do
      context 'subscribe_key' do
        it 'should not throw an exception if present' do
          lambda {  pn = Pubnub::Client.new(:subscribe_key => 'demo') }.should_not raise_error
        end

        it 'should not throw an exception if present' do
          lambda { pn = Pubnub::Client.new(:subscribe_key => :bar) }.should_not raise_error
        end
      end
    end

    describe '#presence' do
      before do

        @my_callback = lambda { |message| Rails.logger.debug(message) }
        @my_pub_key = 'demo'
        @my_sub_key = 'demo'
        @my_message = 'hello_world!'
        @my_channel = 'hello_world'

        @my_cipher_key = 'my_cipher_key'
        @my_sec_key = 'my_sec_key'
        @alt_sec_key = 'alt_sec_key'
      end

      context 'required parameters' do

        before do
          @pn = Pubnub.new(:subscribe_key => @my_sub_key)
        end

        it 'should raise when channel is missing' do
          lambda { @pn.presence(:foo => :bar) }.
              should raise_error(ArgumentError, 'presence() requires :channel and :callback parameters.')
        end

        it 'should raise when callback is missing' do
          lambda { @pn.presence(:channel => @my_channel) }.
              should raise_error(ArgumentError, 'presence() requires :channel and :callback parameters.')
        end

        it 'should raise when callback is invalid' do
          lambda { @pn.presence(:channel => @my_channel, :callback => :blah) }.
              should raise_error('callback is invalid.')
        end

      end
    end
  end
end