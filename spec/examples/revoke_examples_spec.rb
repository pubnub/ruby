require 'spec_helper'

describe Pubnub::Revoke do
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
VCR.use_cassette('test_examples/revoke-2743_http_sync_true_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4064_http_sync_true_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8586_http_sync_true_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-858_http_sync_true_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9530_http_sync_true_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3613_http_sync_true_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4302_http_sync_true_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8294_http_sync_true_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3487_http_sync_true_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-715_http_sync_true_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8102_http_sync_true_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1361_http_sync_true_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4063_http_sync_true_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4319_http_sync_true_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5779_http_sync_true_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3673_http_sync_true_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7728_http_sync_true_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1666_http_sync_true_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-575_http_sync_true_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6526_http_sync_true_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9836_http_sync_true_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-601_http_sync_true_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5915_http_sync_true_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2004_http_sync_true_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6773_http_sync_true_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6593_http_sync_true_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2194_http_sync_true_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :block, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1442_http_sync_true_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7306_http_sync_true_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1774_http_sync_true_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6940_http_sync_true_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8057_http_sync_true_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9819_http_sync_true_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4550_http_sync_true_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2041_http_sync_true_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3743_http_sync_true_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-466_http_sync_true_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4872_http_sync_true_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9801_http_sync_true_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1089_http_sync_true_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1086_http_sync_true_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9255_http_sync_true_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9084_http_sync_true_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-918_http_sync_true_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6851_http_sync_true_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4609_http_sync_true_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7825_http_sync_true_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7716_http_sync_true_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1333_http_sync_true_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9140_http_sync_true_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6324_http_sync_true_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5751_http_sync_true_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3731_http_sync_true_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2118_http_sync_true_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3435_http_sync_false_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1128_http_sync_false_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5644_http_sync_false_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4154_http_sync_false_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9184_http_sync_false_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7213_http_sync_false_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9689_http_sync_false_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7689_http_sync_false_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3764_http_sync_false_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3105_http_sync_false_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1489_http_sync_false_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4286_http_sync_false_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8627_http_sync_false_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5351_http_sync_false_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7237_http_sync_false_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7664_http_sync_false_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-332_http_sync_false_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9451_http_sync_false_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2829_http_sync_false_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1415_http_sync_false_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8044_http_sync_false_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6118_http_sync_false_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8901_http_sync_false_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7443_http_sync_false_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2624_http_sync_false_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7983_http_sync_false_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: block, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-6985_http_sync_false_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :block, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5357_http_sync_false_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3066_http_sync_false_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7930_http_sync_false_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7049_http_sync_false_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8216_http_sync_false_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4582_http_sync_false_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2366_http_sync_false_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1458_http_sync_false_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2382_http_sync_false_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-8892_http_sync_false_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5157_http_sync_false_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-755_http_sync_false_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1024_http_sync_false_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4257_http_sync_false_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7846_http_sync_false_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2953_http_sync_false_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-430_http_sync_false_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5489_http_sync_false_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9617_http_sync_false_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-1390_http_sync_false_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-4274_http_sync_false_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-5523_http_sync_false_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7211_http_sync_false_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-9326_http_sync_false_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-2201_http_sync_false_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-3030_http_sync_false_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: demo_channel' do
VCR.use_cassette('test_examples/revoke-7521_http_sync_false_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":403,\"message\":\"Signature Does Not Match\",\"service\":\"Access Manager\",\"error\":true}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end


end

