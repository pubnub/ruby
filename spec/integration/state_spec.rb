require 'spec_helper'

describe Pubnub::SetState do
  around(:each) do |example|
    @response_output = StringIO.new
    @message_output = StringIO.new

    @pubnub = Pubnub.new(
        :publish_key => :demo,
        :subscribe_key => :demo
    )

    @pubnub.uuid = 'gentest'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'via set_state' do
    it 'sets client state' do
      VCR.use_cassette("integration/set_state/1", :record => :once) do
        enve = @pubnub.set_state(channel: :test_channel, state: {one: :two, three: 4}, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"three\": 4, \"one\": \"two\"}, \"service\": \"Presence\"}"
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:one=>:two, :three=>4}}, :group=>{}}})
      end
    end

    it 'overwrites client state' do
      VCR.use_cassette("integration/set_state/2", :record => :once) do
        enve = @pubnub.set_state(channel: :test_channel, state: {one: :two, three: 4}, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"three\": 4, \"one\": \"two\"}, \"service\": \"Presence\"}"
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:one=>:two, :three=>4}}, :group=>{}}})
        sleep(0.1)
        enve = @pubnub.set_state(channel: :test_channel, state: {some: :other, value: 10}, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"some\": \"other\", \"value\": 10}, \"service\": \"Presence\"}"
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{some: :other, value: 10}}, :group=>{}}})
      end
    end

    it 'overwrites client state that has been set via subscribe' do
      VCR.use_cassette("integration/set_state/3", :record => :once) do
        @pubnub.subscribe(channel: :test_channel, state: {one: :two, three: 4})
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:one=>:two, :three=>4}}, :group=>{}}})
        enve = @pubnub.set_state(channel: :test_channel, state: {some: :other, value: 10}, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"some\": \"other\", \"value\": 10}, \"service\": \"Presence\"}"
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{some: :other, value: 10}}, :group=>{}}})
      end
    end
  end

  context 'via subscribe' do
    it 'sets client state' do
      VCR.use_cassette("integration/set_state/11", :record => :once) do
        @pubnub.subscribe(channel: :test_channel, state: {one: :two, three: 4})
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:one=>:two, :three=>4}}, :group=>{}}})
        enve = @pubnub.state(channel: :test_channel, uuid: @pubnub.uuid, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"uuid\": \"gentest\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"three\": 4, \"one\": \"two\"}, \"channel\": \"test_channel\"}"
      end
    end

    it 'overwrites client state' do
      VCR.use_cassette("integration/set_state/12", :record => :once) do
        @pubnub.subscribe(channel: :test_channel, state: {one: :two, three: 4})
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:one=>:two, :three=>4}}, :group=>{}}})
        @pubnub.subscribe(channel: :test_channel, state: {some: :other, value: 10})
        expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{some: :other, value: 10}}, :group=>{}}})
        enve = @pubnub.state(channel: :test_channel, uuid: @pubnub.uuid, http_sync: true)
        expect(enve.first.response).to eq "{\"status\": 200, \"uuid\": \"gentest\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"some\": \"other\", \"value\": 10}, \"channel\": \"test_channel\"}"
      end
    end

    # it 'overwrites client state that has been set via set_state' do
    #   VCR.use_cassette("integration/set_state/13", :record => :once) do
    #     enve = @pubnub.set_state(channel: :test_channel, state: {some: :other, value: 10}, http_sync: true)
    #     expect(@pubnub.env[:state]).to eq ({"pubsub.pubnub.com"=>{:channel=>{"test_channel"=>{:some=>:other, :value=>10}}, :group=>{}}})
    #     expect(enve.first.response).to eq "{\"status\": 200, \"message\": \"OK\", \"payload\": {\"some\": \"other\", \"value\": 10}, \"service\": \"Presence\"}"
    #     @pubnub.subscribe(channel: :test_channel, state: {one: :two, three: 4})
    #     sleep(2)
    #     enve = @pubnub.state(channel: :test_channel, uuid: @pubnub.uuid, http_sync: true)
    #     expect(enve.first.response).to eq "{\"status\": 200, \"uuid\": \"gentest\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"three\": 4, \"one\": \"two\"}, \"channel\": \"test_channel\"}"
    #
    #   end
    # end
  end

end