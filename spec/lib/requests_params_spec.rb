require 'spec_helper'

describe 'Pubnub::SingleRequest' do

  it 'holds current pubnub sdk version' do
    p = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo)
    params = p.send(:params_for_request, {})
    params[:pnsdk].should eq "PubNub-Ruby/#{Pubnub::VERSION}"
  end

end

describe 'Pubnub::Subscription' do

  it 'holds current pubnub sdk version' do
    p = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo)
    params = p.send(:variables_for_subscribe, {})
    params[:pnsdk].should eq "PubNub-Ruby/#{Pubnub::VERSION}"
  end

end