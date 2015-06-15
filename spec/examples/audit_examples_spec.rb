require 'spec_helper'

describe Pubnub::Audit do
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

  it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-8248_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-4559_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-7752_http_sync_true_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-7382_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-9717_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-4576_http_sync_true_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-7660_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-6606_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-7790_http_sync_true_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-7715_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-3075_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-1768_http_sync_true_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-3981_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-4424_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-7498_http_sync_false_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-611_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-3299_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-3502_http_sync_false_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-1892_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-9331_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-7315_http_sync_false_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-393_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
VCR.use_cassette('test_examples/audit-1847_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => :key)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, auth-key: key1, key2' do
VCR.use_cassette('test_examples/audit-5577_http_sync_false_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key1, key2')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo\":{\"r\":1,\"m\":0,\"w\":1},\"three\":{\"r\":1,\"m\":0,\"w\":1},\"two\":{\"r\":1,\"m\":0,\"w\":1},\"secret_channel\":{\"auths\":{\"john\":{\"r\":1,\"m\":0,\"w\":1}},\"r\":1,\"m\":0,\"w\":0},\"test\":{\"r\":1,\"m\":0,\"w\":1},\"one\":{\"r\":1,\"m\":0,\"w\":1},\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"objects\":{},\"channel-groups\":{\"cg\":{\"r\":1,\"m\":1,\"w\":1}},\"level\":\"subkey\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end


end

