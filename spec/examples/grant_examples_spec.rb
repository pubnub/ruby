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

    @pubnub_wo_pam_client = Pubnub.new(
        :publish_key => 'pub-c-bda4e37b-f383-4acf-affd-cd8e66ed523b',
        :subscribe_key => 'sub-c-243e56aa-1b13-11e5-a5e2-02ee2ddab7fe',
        :secret_key => 'sec-c-OThjZDUyNjktY2ZlMS00MDc2LWJkODYtMmU4ZTk2MjY5ZGQ5',
        :uuid => 'gentest'
    )

    @pubnub.uuid = 'gentest'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'http_sync: true, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671530
VCR.use_cassette('test_examples/grant-8317_http_sync_true_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671530
VCR.use_cassette('test_examples/grant-2157_http_sync_true_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671531
VCR.use_cassette('test_examples/grant-1459_http_sync_true_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671531
VCR.use_cassette('test_examples/grant-776_http_sync_true_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671532
VCR.use_cassette('test_examples/grant-5434_http_sync_true_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671532
VCR.use_cassette('test_examples/grant-192_http_sync_true_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671533
VCR.use_cassette('test_examples/grant-1581_http_sync_true_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671533
VCR.use_cassette('test_examples/grant-9663_http_sync_true_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
VCR.use_cassette('test_examples/grant-2769_http_sync_true_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
VCR.use_cassette('test_examples/grant-1679_http_sync_true_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
VCR.use_cassette('test_examples/grant-3198_http_sync_true_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671535
VCR.use_cassette('test_examples/grant-9771_http_sync_true_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671535
VCR.use_cassette('test_examples/grant-9627_http_sync_true_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671536
VCR.use_cassette('test_examples/grant-5297_http_sync_true_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671536
VCR.use_cassette('test_examples/grant-7239_http_sync_true_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671537
VCR.use_cassette('test_examples/grant-9280_http_sync_true_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671537
VCR.use_cassette('test_examples/grant-1248_http_sync_true_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671538
VCR.use_cassette('test_examples/grant-7430_http_sync_true_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'read' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
VCR.use_cassette('test_examples/grant-1919_http_sync_true_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
VCR.use_cassette('test_examples/grant-5315_http_sync_true_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
VCR.use_cassette('test_examples/grant-6706_http_sync_true_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671540
VCR.use_cassette('test_examples/grant-7246_http_sync_true_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671542
VCR.use_cassette('test_examples/grant-8946_http_sync_true_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671542
VCR.use_cassette('test_examples/grant-6837_http_sync_true_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671543
VCR.use_cassette('test_examples/grant-1010_http_sync_true_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671543
VCR.use_cassette('test_examples/grant-9280_http_sync_true_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: block, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671544
VCR.use_cassette('test_examples/grant-2324_http_sync_true_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671544
VCR.use_cassette('test_examples/grant-8716_http_sync_true_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671545
VCR.use_cassette('test_examples/grant-4594_http_sync_true_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671545
VCR.use_cassette('test_examples/grant-5749_http_sync_true_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
VCR.use_cassette('test_examples/grant-4355_http_sync_true_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
VCR.use_cassette('test_examples/grant-1843_http_sync_true_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
VCR.use_cassette('test_examples/grant-7588_http_sync_true_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671547
VCR.use_cassette('test_examples/grant-1617_http_sync_true_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671548
VCR.use_cassette('test_examples/grant-740_http_sync_true_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671548
VCR.use_cassette('test_examples/grant-4472_http_sync_true_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671549
VCR.use_cassette('test_examples/grant-8163_http_sync_true_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671549
VCR.use_cassette('test_examples/grant-5354_http_sync_true_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671550
VCR.use_cassette('test_examples/grant-4177_http_sync_true_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671551
VCR.use_cassette('test_examples/grant-991_http_sync_true_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671551
VCR.use_cassette('test_examples/grant-63_http_sync_true_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671552
VCR.use_cassette('test_examples/grant-1690_http_sync_true_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671552
VCR.use_cassette('test_examples/grant-2302_http_sync_true_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671553
VCR.use_cassette('test_examples/grant-9963_http_sync_true_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671553
VCR.use_cassette('test_examples/grant-9570_http_sync_true_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671554
VCR.use_cassette('test_examples/grant-7195_http_sync_true_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671554
VCR.use_cassette('test_examples/grant-4804_http_sync_true_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671555
VCR.use_cassette('test_examples/grant-3370_http_sync_true_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671555
VCR.use_cassette('test_examples/grant-7273_http_sync_true_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671556
VCR.use_cassette('test_examples/grant-8844_http_sync_true_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671556
VCR.use_cassette('test_examples/grant-5782_http_sync_true_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671557
VCR.use_cassette('test_examples/grant-8656_http_sync_true_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671557
VCR.use_cassette('test_examples/grant-135_http_sync_true_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: true, callback: parameter, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671558
VCR.use_cassette('test_examples/grant-8315_http_sync_true_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671558
VCR.use_cassette('test_examples/grant-5697_http_sync_false_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671559
VCR.use_cassette('test_examples/grant-8904_http_sync_false_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
VCR.use_cassette('test_examples/grant-749_http_sync_false_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
VCR.use_cassette('test_examples/grant-5496_http_sync_false_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
VCR.use_cassette('test_examples/grant-7813_http_sync_false_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671561
VCR.use_cassette('test_examples/grant-3279_http_sync_false_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
VCR.use_cassette('test_examples/grant-6788_http_sync_false_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
VCR.use_cassette('test_examples/grant-8573_http_sync_false_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
VCR.use_cassette('test_examples/grant-8270_http_sync_false_callback_block_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671563
VCR.use_cassette('test_examples/grant-431_http_sync_false_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671564
VCR.use_cassette('test_examples/grant-4478_http_sync_false_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671564
VCR.use_cassette('test_examples/grant-5390_http_sync_false_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671565
VCR.use_cassette('test_examples/grant-9819_http_sync_false_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671565
VCR.use_cassette('test_examples/grant-6545_http_sync_false_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671566
VCR.use_cassette('test_examples/grant-856_http_sync_false_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671566
VCR.use_cassette('test_examples/grant-6037_http_sync_false_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671567
VCR.use_cassette('test_examples/grant-4344_http_sync_false_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671567
VCR.use_cassette('test_examples/grant-1399_http_sync_false_callback_block_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'read' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671568
VCR.use_cassette('test_examples/grant-8813_http_sync_false_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671569
VCR.use_cassette('test_examples/grant-6195_http_sync_false_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671569
VCR.use_cassette('test_examples/grant-3090_http_sync_false_callback_block_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671570
VCR.use_cassette('test_examples/grant-3025_http_sync_false_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671570
VCR.use_cassette('test_examples/grant-5144_http_sync_false_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671571
VCR.use_cassette('test_examples/grant-528_http_sync_false_callback_block_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671571
VCR.use_cassette('test_examples/grant-9583_http_sync_false_callback_block_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671572
VCR.use_cassette('test_examples/grant-65_http_sync_false_callback_block_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: block, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671572
VCR.use_cassette('test_examples/grant-4529_http_sync_false_callback_block_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'channel' => 'demo_channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671573
VCR.use_cassette('test_examples/grant-4168_http_sync_false_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671573
VCR.use_cassette('test_examples/grant-4441_http_sync_false_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671574
VCR.use_cassette('test_examples/grant-9029_http_sync_false_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671574
VCR.use_cassette('test_examples/grant-1835_http_sync_false_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671576
VCR.use_cassette('test_examples/grant-6771_http_sync_false_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671577
VCR.use_cassette('test_examples/grant-1225_http_sync_false_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671577
VCR.use_cassette('test_examples/grant-1506_http_sync_false_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
VCR.use_cassette('test_examples/grant-4846_http_sync_false_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
VCR.use_cassette('test_examples/grant-5788_http_sync_false_callback_parameter_read_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
VCR.use_cassette('test_examples/grant-5600_http_sync_false_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671579
VCR.use_cassette('test_examples/grant-4395_http_sync_false_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671579
VCR.use_cassette('test_examples/grant-9661_http_sync_false_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671580
VCR.use_cassette('test_examples/grant-508_http_sync_false_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671581
VCR.use_cassette('test_examples/grant-5876_http_sync_false_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671581
VCR.use_cassette('test_examples/grant-7913_http_sync_false_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671582
VCR.use_cassette('test_examples/grant-646_http_sync_false_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671582
VCR.use_cassette('test_examples/grant-485_http_sync_false_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671583
VCR.use_cassette('test_examples/grant-8939_http_sync_false_callback_parameter_read_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671583
VCR.use_cassette('test_examples/grant-542_http_sync_false_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671584
VCR.use_cassette('test_examples/grant-8780_http_sync_false_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671584
VCR.use_cassette('test_examples/grant-6717_http_sync_false_callback_parameter_write_true_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
VCR.use_cassette('test_examples/grant-8946_http_sync_false_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
VCR.use_cassette('test_examples/grant-9436_http_sync_false_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
VCR.use_cassette('test_examples/grant-5834_http_sync_false_callback_parameter_write_false_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671586
VCR.use_cassette('test_examples/grant-8399_http_sync_false_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671586
VCR.use_cassette('test_examples/grant-5488_http_sync_false_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end

it 'http_sync: false, callback: parameter, channel: demo_channel' do
Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671587
VCR.use_cassette('test_examples/grant-3684_http_sync_false_callback_parameter_channel_demo_channel', record: :once) do
event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
expect(event.value.map{ |e| e.message}).to eq ["Success"]
end
end


end

