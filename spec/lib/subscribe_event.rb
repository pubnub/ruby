require 'spec_helper'

describe 'Pubnub::SubscribeEvent' do
  it 'doesnt include same channel to running subscription twice' do
    @pn = Pubnub.new(:subscribe_key => 'demo-36', :publish_key => 'demo-36')

    VCR.use_cassette("subscribe-event-include-test", :record => :all) do
      @pn.subscribe(:http_sync => false, :channel => 'demo'){|e| }
      @pn.subscribe(:http_sync => false, :channel => 'demo'){|e| }

      eventually do
        @pn.env[:subscriptions]['pubsub.pubnub.com'].get_channels.should eq ['demo']
      end
    end
  end
end
