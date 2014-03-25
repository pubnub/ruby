require 'spec_helper'

describe 'multiplexed subscribe flow' do
  it 'works as decribed' do
    VCR.use_cassette('new_ones/multiplexed_subscribe', :record => :new_episodes) do
      @pn = Pubnub.new(:subscribe_key => :demo, :publish_key => :demo, :uuid => 'rubytest', :origin => 'pubsub.pubnub.com')

      @pn.subscribe(:channel => 'rubya'){ |e| puts e.channel; puts e.msg }
      sleep(1)
      # 1 subs on 1 connection
      eventually do
        @pn.env[:subscriptions].size.should eq 1
        @pn.env[:subscriptions]['pubsub.pubnub.com'].get_channels.size.should eq 1
      end

      @pn.subscribe(:channel => 'rubya-pnpres'){ |e| puts e.channel; puts e.msg }
      sleep(1)
      # 2 subs on 1 connection
      eventually do
        @pn.env[:subscriptions].size.should eq 1
        @pn.env[:subscriptions]['pubsub.pubnub.com'].get_channels.size.should eq 2
      end

      @pn.subscribe(:channel => 'rubyb'){ |e| puts e.channel; puts e.msg }
      sleep(1)
      # 3 subs on 1 connection
      eventually do
        @pn.env[:subscriptions].size.should eq 1
        @pn.env[:subscriptions]['pubsub.pubnub.com'].get_channels.size.should eq 3
      end

      @pn.leave(:channel => 'rubyb'){ |e| puts e.channel; puts e.msg }
      sleep(1)
      # 2 subs on 1 connection
      eventually do
        @pn.env[:subscriptions].size.should eq 1
        @pn.env[:subscriptions]['pubsub.pubnub.com'].get_channels.size.should eq 2
      end

      @pn.leave(:channel => 'rubya,rubya-pnpres'){ |e| puts e.channel; puts e.msg }
      sleep(1)
      # 0 subs on 0 connections

      eventually do
        @pn.env[:subscriptions].size.should eq 0
      end
    end
  end
end
