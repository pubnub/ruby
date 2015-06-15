require 'spec_helper'

describe Pubnub::HereNow do
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

  it 'http_sync: true, callback: block' do
VCR.use_cassette('test_examples/here_now-5135_http_sync_true_callback_block', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :block)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: true, callback: block, channel: channel' do
VCR.use_cassette('test_examples/here_now-9252_http_sync_true_callback_block_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :block, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: true, callback: block, channel: channel' do
VCR.use_cassette('test_examples/here_now-1480_http_sync_true_callback_block_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :block, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: true, callback: parameter' do
VCR.use_cassette('test_examples/here_now-3794_http_sync_true_callback_parameter', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: true, callback: parameter, channel: channel' do
VCR.use_cassette('test_examples/here_now-8138_http_sync_true_callback_parameter_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: true, callback: parameter, channel: channel' do
VCR.use_cassette('test_examples/here_now-2439_http_sync_true_callback_parameter_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: block' do
VCR.use_cassette('test_examples/here_now-3327_http_sync_false_callback_block', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :block)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: block, channel: channel' do
VCR.use_cassette('test_examples/here_now-4005_http_sync_false_callback_block_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :block, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: block, channel: channel' do
VCR.use_cassette('test_examples/here_now-3418_http_sync_false_callback_block_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :block, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: parameter' do
VCR.use_cassette('test_examples/here_now-6720_http_sync_false_callback_parameter', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: parameter, channel: channel' do
VCR.use_cassette('test_examples/here_now-6091_http_sync_false_callback_parameter_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter, 'channel' => :channel)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end

it 'http_sync: false, callback: parameter, channel: channel' do
VCR.use_cassette('test_examples/here_now-5965_http_sync_false_callback_parameter_channel_channel', record: :once) do
event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
expect(event.value.map{ |e| e.message}).to eq ["No valid channels specified"]
end
end


end

