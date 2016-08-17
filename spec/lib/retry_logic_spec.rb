require 'spec_helper'

describe Pubnub::Event do
  before(:each) do

    @callback_counter       = 0
    @error_callback_counter = 0

    @callback       = lambda do |envelope|
      @callback_counter += 1
    end

    @error_callback = lambda do |envelope|
      @error_callback_counter += 1
    end

    @pubnub = Pubnub.new(
        :subscribe_key => :demo,
        :publish_key => :demo,
        :max_retries => 5,
        :error_callback => @error_callback,
        :auth_key => :demoish_authkey,
        :uuid => :rubytests
    )
  end

  context 'single event' do
    context 'when gets non200 response' do
      it 'doesn\'t retry' do
        VCR.use_cassette('single-event-non200', :record => :none) do
          @pubnub.publish(:channel => "demo", :message => {:text => "hey"}, &@callback)
          eventually do
            @callback_counter.should eq 0
            @error_callback_counter.should eq 1
          end
        end
      end
    end

    context 'when gets invalid JSON' do
      it 'do retry' do
        VCR.use_cassette('single-event-invalid-json', :record => :none) do
          @pubnub.publish(:channel => "demo", :message => {:text => "hey"}, &@callback)
          eventually do
            @callback_counter.should eq 1
            @error_callback_counter.should eq 0
          end
        end
      end
    end
  end

end