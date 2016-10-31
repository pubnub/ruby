require 'spec_helper'

describe 'Status request message count exceeded' do

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  before(:each) do
    @messages  = []
    @statuses  = []
    @presences = []

    @callbacks = Pubnub::SubscribeCallback.new(
        message:  ->(envelope) { @messages  << envelope },
        presence: ->(envelope) { @presences << envelope },
        status:   ->(envelope) { @statuses  << envelope }
    )

    @pubnub = Pubnub.new(
        subscribe_key: 'demo',
        publish_key: 'demo',
        uuid: 'ruby-test',
        request_message_count_threshold: 100
    )

    @pubnub.add_listener(callback: @callbacks)
  end

  it 'works' do
      VCR.use_cassette('examples/status_request_message_count_exceeded', record: :once) do
        @pubnub.subscribe(channel: :demo)

      eventually do
        expect(@statuses[1].status[:category]).to eq(Pubnub::Constants::STATUS_REQUEST_MESSAGE_COUNT_EXCEEDED)
      end
    end
  end
end