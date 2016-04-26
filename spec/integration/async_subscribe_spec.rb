require 'spec_helper'

describe Pubnub::SubscribeCallback do
  let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo', publish_key: 'demo') }

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'works as planned' do
    @message_msgs  = []
    @presence_msgs = []
    @status_msgs   = []

    callback = Pubnub::SubscribeCallback.new(
      message:  ->(e) { @message_msgs << e.message },
      presence: ->(e) { @presence_msgs << e.message },
      status:   ->(e) { @status_msgs << e.message }
    )

    VCR.use_cassette('integration/async_subscribe/1', record: :once) do
      pubnub_client.add_listener(name: 'sample', callback: callback)

      pubnub_client.subscribe(channel: :demo, presence: :demo)

      wait_for(@message_msgs).to eq [{ 'text' => 'hey' }, { 'text' => 'hey' }]
      wait_for(@presence_msgs).to eq [{ 'action' => 'join',
                                      'timestamp' => 1_461_674_783,
                                      'uuid' => '003784f2-6a80-466c-afef-be88740c9c6b',
                                      'occupancy' => 8 },
                                    { 'action' => 'timeout',
                                      'timestamp' => 1_461_674_822,
                                      'uuid' => '88488f3c-57b7-4edc-8f11-13c3242ed345',
                                      'occupancy' => 7 },
                                    { 'action' => 'join',
                                      'timestamp' => 1_461_674_840,
                                      'uuid' => '29042fd2-c216-45dc-8d95-2f4178305d09',
                                      'occupancy' => 8 }]
      wait_for(@status_msgs).to eq []
    end
  end
end
