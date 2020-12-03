require "spec_helper"

describe Pubnub::Presence do

  around :each do |example|
    example.run_with_retry retry: 10
  end

  context "with interval events and delta" do
    before :each do
      @presences = []
      @statuses = []

      @callbacks = Pubnub::SubscribeCallback.new(
        message: -> (_envelope) { },
        presence: -> (envelope) { @presences << envelope },
        status: -> (envelope) { @statuses << envelope },
      )
    end

    it "works" do
      pubnub = Pubnub.new(subscribe_key: "sub-a-mock-key", publish_key: "pub-a-mock-key", uuid: "")
      pubnub.add_listener(callback: @callbacks)

      VCR.use_cassette("lib/events/presence_delta", record: :once) do
        pubnub.presence(channel: :demo)

        eventually do
          if @presences.length >= 4
            expect(@presences[0].result[:data]).to eq({:message => {"action" => "interval", "timestamp" => 1490958575, "occupancy" => 3}, :subscribed_channel => "demo-pnpres", :actual_channel => "demo-pnpres", :publish_time_object => {:timetoken => "14909585750910131", :region_code => 1}, :message_meta_data => nil, :presence_event => "interval", :presence => {:uuid => nil, :timestamp => 1490958575, :state => nil, :occupancy => 3}})
            expect(@presences[1].result[:data]).to eq({:message => {"action" => "interval", "timestamp" => 1490958585, "occupancy" => 4, "join" => ["Client-d39lr"]}, :subscribed_channel => "demo-pnpres", :actual_channel => "demo-pnpres", :publish_time_object => {:timetoken => "14909585850925693", :region_code => 1}, :message_meta_data => nil, :presence_event => "interval", :presence => {:uuid => nil, :timestamp => 1490958585, :state => nil, :occupancy => 4}})
            expect(@presences[2].result[:data]).to eq({:message => {"action" => "interval", "timestamp" => 1490958595, "occupancy" => 3, "leave" => ["another-client"]}, :subscribed_channel => "demo-pnpres", :actual_channel => "demo-pnpres", :publish_time_object => {:timetoken => "14909585950916556", :region_code => 1}, :message_meta_data => nil, :presence_event => "interval", :presence => {:uuid => nil, :timestamp => 1490958595, :state => nil, :occupancy => 3}})
            expect(@presences[3].result[:data]).to eq({:message => {"action" => "interval", "timestamp" => 1490958605, "occupancy" => 2, "join" => ["another-client"], "leave" => ["Client-d39lr", "client0"]}, :subscribed_channel => "demo-pnpres", :actual_channel => "demo-pnpres", :publish_time_object => {:timetoken => "14909586050915528", :region_code => 1}, :message_meta_data => nil, :presence_event => "interval", :presence => {:uuid => nil, :timestamp => 1490958605, :state => nil, :occupancy => 2}})
            true
          end
        end
      end
    end
  end
end
