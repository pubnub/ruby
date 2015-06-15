require 'spec_helper'

describe Pubnub::Publish do
  around(:each) do |example|
    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    @pubnub = Pubnub.new(
      :publish_key => 'pub-c-ef1905bd-3c9c-4bc7-9f20-f6ee1f50f79b',
      :subscribe_key => 'sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f',
      :secret_key => 'sec-c-OTA5NzI1YTMtOWEyNy00NTQzLTkzNzMtMjY3ZDlkYzk0NGU3',
      :error_callback => @error_callback
    )

    @pubnub.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-9537_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => :message, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-6070_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => :message, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-54_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => 'message', 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-3167_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => 'message', 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-474_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => ["me", "ssage"], 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-9135_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => ["me", "ssage"], 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-935_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => 100, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-5983_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => 100, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-3551_http_sync_true_callback_block_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => {:key=>:value}, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-6102_http_sync_true_callback_block_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :block, 'message' => {:key=>:value}, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-6311_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-5083_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-2156_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-1067_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-9098_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-4937_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-8326_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-1875_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-3315_http_sync_true_callback_parameter_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key=>:value}, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-7498_http_sync_true_callback_parameter_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key=>:value}, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-5762_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => :message, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-177_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => :message, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-5242_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => 'message', 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-4791_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => 'message', 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-9169_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => ["me", "ssage"], 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-4349_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => ["me", "ssage"], 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-9081_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => 100, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-9858_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => 100, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-703_http_sync_false_callback_block_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => {:key=>:value}, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-4649_http_sync_false_callback_block_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :block, 'message' => {:key=>:value}, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-4089_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-4111_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-2150_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish-8558_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-3117_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish-7036_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-2563_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish-2521_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-6820_http_sync_false_callback_parameter_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key=>:value}, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
VCR.use_cassette('test_examples/publish-2292_http_sync_false_callback_parameter_message_{:key=>:value}_channel_channel', record: :once) do
event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key=>:value}, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["[]"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end


end

