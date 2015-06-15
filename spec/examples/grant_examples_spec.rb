require 'spec_helper'

describe Pubnub::Grant do
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

  it 'http_sync: true, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1315_http_sync_true_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2110_http_sync_true_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3864_http_sync_true_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2624_http_sync_true_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3026_http_sync_true_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6563_http_sync_true_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-264_http_sync_true_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2178_http_sync_true_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4552_http_sync_true_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5679_http_sync_true_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6317_http_sync_true_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5565_http_sync_true_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8652_http_sync_true_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9674_http_sync_true_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2848_http_sync_true_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2162_http_sync_true_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3303_http_sync_true_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7942_http_sync_true_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9509_http_sync_true_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7640_http_sync_true_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5924_http_sync_true_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-30_http_sync_true_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-980_http_sync_true_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1773_http_sync_true_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5950_http_sync_true_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-849_http_sync_true_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7774_http_sync_true_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :block, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8176_http_sync_true_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1758_http_sync_true_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8063_http_sync_true_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7077_http_sync_true_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8715_http_sync_true_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3545_http_sync_true_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2629_http_sync_true_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9708_http_sync_true_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-427_http_sync_true_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8969_http_sync_true_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6244_http_sync_true_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4267_http_sync_true_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7911_http_sync_true_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5134_http_sync_true_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7782_http_sync_true_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-44_http_sync_true_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4484_http_sync_true_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2664_http_sync_true_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2850_http_sync_true_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9992_http_sync_true_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-720_http_sync_true_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3328_http_sync_true_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3794_http_sync_true_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9089_http_sync_true_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5979_http_sync_true_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9546_http_sync_true_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5688_http_sync_true_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3348_http_sync_false_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8309_http_sync_false_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1020_http_sync_false_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4363_http_sync_false_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8502_http_sync_false_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9486_http_sync_false_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1710_http_sync_false_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1073_http_sync_false_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1556_http_sync_false_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2950_http_sync_false_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3054_http_sync_false_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5030_http_sync_false_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3276_http_sync_false_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2164_http_sync_false_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1944_http_sync_false_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9872_http_sync_false_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1832_http_sync_false_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6191_http_sync_false_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8424_http_sync_false_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2263_http_sync_false_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8644_http_sync_false_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9519_http_sync_false_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3351_http_sync_false_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6573_http_sync_false_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5283_http_sync_false_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7493_http_sync_false_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2725_http_sync_false_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :block, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1302_http_sync_false_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7006_http_sync_false_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-9945_http_sync_false_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3503_http_sync_false_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5169_http_sync_false_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7600_http_sync_false_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-154_http_sync_false_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-5732_http_sync_false_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-20_http_sync_false_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6224_http_sync_false_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1968_http_sync_false_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4155_http_sync_false_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8957_http_sync_false_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6209_http_sync_false_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3364_http_sync_false_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6168_http_sync_false_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7968_http_sync_false_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7033_http_sync_false_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-7987_http_sync_false_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-3318_http_sync_false_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4765_http_sync_false_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-2989_http_sync_false_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4699_http_sync_false_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-8883_http_sync_false_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-6546_http_sync_false_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-4199_http_sync_false_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: demo_channel' do
VCR.use_cassette('test_examples/grant-1181_http_sync_false_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"level\":\"subkey\",\"m\":0,\"r\":1,\"w\":1,\"ttl\":1440,\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end


end

