require 'spec_helper'

describe Pubnub::Presence do
  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'with interval events and delta' do
    before :each do
      @messages = []
      @statuses = []

      @callbacks = Pubnub::SubscribeCallback.new(
          message: ->(_envelope) {  },
          presence: ->(envelope) { @messages << envelope },
          status: ->(envelope) { @statuses << envelope }
      )
    end

    it 'works' do
      pubnub = Pubnub.new(subscribe_key: 'sub-c-9fb06248-0a21-11e7-91d0-02ee2ddab7fe', publish_key: 'pub-c-7a6fa2a4-a4c4-4eb4-9a21-a3334d38209d', uuid: '')
      pubnub.add_listener(callback: @callbacks)

      VCR.use_cassette('lib/events/presence_delta', record: :once) do
        pubnub.presence(channel: :demo)

        eventually do
          expect(@messages[0].result[:data]).to eq({:message=>{"action"=>"interval", "timestamp"=>1490958575, "occupancy"=>3}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14909585750910131", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"interval", :presence=>{:uuid=>nil, :timestamp=>1490958575, :state=>nil, :occupancy=>3}})
          expect(@messages[1].result[:data]).to eq({:message=>{"action"=>"interval", "timestamp"=>1490958585, "occupancy"=>4, "join"=>["Client-d39lr"]}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14909585850925693", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"interval", :presence=>{:uuid=>nil, :timestamp=>1490958585, :state=>nil, :occupancy=>4}})
          expect(@messages[2].result[:data]).to eq({:message=>{"action"=>"interval", "timestamp"=>1490958595, "occupancy"=>3, "leave"=>["another-client"]}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14909585950916556", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"interval", :presence=>{:uuid=>nil, :timestamp=>1490958595, :state=>nil, :occupancy=>3}})
          expect(@messages[3].result[:data]).to eq({:message=>{"action"=>"interval", "timestamp"=>1490958605, "occupancy"=>2, "join"=>["another-client"], "leave"=>["Client-d39lr", "client0"]}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14909586050915528", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"interval", :presence=>{:uuid=>nil, :timestamp=>1490958605, :state=>nil, :occupancy=>2}})
        end
      end
    end
  end
end