require 'spec_helper'

describe Pubnub::History do
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

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-7780_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3434_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6521_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6561_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6496_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-171_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5116_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1947_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8975_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-3746_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8840_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4452_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8464_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9220_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4618_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-9737_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5381_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4040_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-7600_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9848_http_sync_true_callback_block_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3758_http_sync_true_callback_block_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-740_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1256_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1030_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8749_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-249_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1303_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-1073_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7243_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5742_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-7559_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2355_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1395_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5279_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2709_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7984_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-109_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1399_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5715_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6671_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6809_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5955_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-9099_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9045_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1481_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-4274_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6700_http_sync_true_callback_block_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8696_http_sync_true_callback_block_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-9343_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1505_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4753_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5511_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-49_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5810_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-2895_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6528_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6941_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-7871_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7172_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6741_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5304_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5614_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2695_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-8234_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4568_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4824_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4133_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2885_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7149_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8512_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9941_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3130_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-1775_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3527_http_sync_true_callback_block_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8251_http_sync_true_callback_block_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5164_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5328_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3957_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-444_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2247_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9134_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-7527_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4814_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4556_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4303_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9784_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8478_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2762_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3210_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1749_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-6797_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4722_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-936_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8615_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8408_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7085_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6577_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6257_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1245_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-3438_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2467_http_sync_true_callback_block_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4183_http_sync_true_callback_block_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-7400_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4193_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6959_http_sync_true_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-940_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6448_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8989_http_sync_true_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-4990_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7607_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4213_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6542_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9732_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1490_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-1852_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7710_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8851_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-5997_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-394_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3062_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-713_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4908_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7405_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-3307_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4857_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8247_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-3055_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7396_http_sync_true_callback_block_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8409_http_sync_true_callback_block_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-1086_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3093_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-647_http_sync_true_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-3027_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6736_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3822_http_sync_true_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-7151_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2246_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-633_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6156_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8534_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7497_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2310_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4815_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5135_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-7644_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3825_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8026_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-187_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-967_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9981_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8620_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5086_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4897_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-3913_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3279_http_sync_true_callback_block_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8644_http_sync_true_callback_block_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5074_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1555_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9358_http_sync_true_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8500_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2176_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3632_http_sync_true_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-8029_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8085_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5523_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-421_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8552_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8829_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4444_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2910_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2823_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-4427_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1643_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7537_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8458_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3375_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3955_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5751_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2164_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9028_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-5588_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4628_http_sync_true_callback_parameter_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4137_http_sync_true_callback_parameter_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-175_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4873_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5181_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-3895_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8957_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6850_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-1220_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7427_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3958_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-1375_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5320_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6097_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8141_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8310_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6709_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-166_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4004_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4171_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-3655_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7632_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6247_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-984_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6228_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9121_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-4097_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9085_http_sync_true_callback_parameter_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2178_http_sync_true_callback_parameter_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4514_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2832_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4109_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6513_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-706_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4679_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-37_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9283_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7151_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2819_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-153_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7879_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6920_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4739_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-436_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-7760_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5563_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5205_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-775_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3365_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4135_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-167_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1383_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2766_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-7435_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8368_http_sync_true_callback_parameter_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1260_http_sync_true_callback_parameter_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-3021_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4384_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3926_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7209_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1358_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5096_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-2863_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-997_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6013_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-984_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1651_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5451_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2069_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9409_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-756_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-6123_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5306_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5473_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4773_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5103_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1288_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-807_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8283_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4779_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-2778_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5209_http_sync_true_callback_parameter_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7599_http_sync_true_callback_parameter_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6608_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4549_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8998_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5934_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1212_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6631_http_sync_true_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-4345_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7029_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6359_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-26_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2967_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-462_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7167_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7251_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6040_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-5988_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4629_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5987_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-1301_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8958_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5721_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-747_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3050_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8223_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-1735_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6977_http_sync_true_callback_parameter_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2181_http_sync_true_callback_parameter_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8277_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4188_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6654_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-9697_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4270_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2098_http_sync_true_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-1128_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1733_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8319_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5891_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1693_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9458_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-978_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7595_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7883_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-1367_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-279_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-310_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-7722_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7986_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-134_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5067_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3060_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6929_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-6650_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7056_http_sync_true_callback_parameter_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5592_http_sync_true_callback_parameter_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2012_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8747_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7500_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-91_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4039_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2813_http_sync_true_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-5560_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3520_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9010_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-400_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-719_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-16_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8715_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7980_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7391_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-3403_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8092_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4985_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6189_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1368_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4882_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-316_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2225_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3820_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-3114_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2830_http_sync_false_callback_block_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9306_http_sync_false_callback_block_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2242_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7958_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1773_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4487_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4659_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3645_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-2007_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8358_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9121_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5526_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4296_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2653_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4797_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1446_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-564_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-4342_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-927_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8822_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-178_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8010_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1353_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4489_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2068_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2292_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-4528_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2502_http_sync_false_callback_block_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1468_http_sync_false_callback_block_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5863_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1434_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1655_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8859_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5895_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8264_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-3092_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4373_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5796_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-9805_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-493_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4771_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-9639_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-639_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4702_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-7546_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7792_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1975_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8446_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2455_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5068_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7151_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9562_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5089_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-50_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2950_http_sync_false_callback_block_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4011_http_sync_false_callback_block_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-345_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8296_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8391_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-216_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9754_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6095_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-635_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-170_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1302_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5023_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8296_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-988_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2319_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1902_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3442_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-1403_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8089_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-168_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4953_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4980_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8941_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2977_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8380_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5460_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-4021_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6047_http_sync_false_callback_block_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9116_http_sync_false_callback_block_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8357_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6994_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5809_http_sync_false_callback_block_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-462_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1688_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8126_http_sync_false_callback_block_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-3956_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6964_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4419_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4655_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9269_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-212_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6184_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7800_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4100_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-4078_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2802_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4050_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8858_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-661_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5904_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2656_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4965_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5627_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-8473_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7154_http_sync_false_callback_block_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7580_http_sync_false_callback_block_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2324_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1235_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3600_http_sync_false_callback_block_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7546_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2048_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1124_http_sync_false_callback_block_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-2474_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3046_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6626_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6403_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-515_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8839_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-379_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6073_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4635_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-4349_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2957_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4819_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-1568_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3358_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7282_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-1275_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9270_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9512_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-9486_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9578_http_sync_false_callback_block_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4503_http_sync_false_callback_block_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-9901_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5782_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1897_http_sync_false_callback_block_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7357_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8491_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3420_http_sync_false_callback_block_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :block, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-2426_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9161_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7860_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8363_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4088_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1310_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-1161_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-429_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5580_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-9282_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4340_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2225_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6322_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2153_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7254_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2600_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8975_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3280_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-437_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1786_http_sync_false_callback_parameter_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1480_http_sync_false_callback_parameter_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2507_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5804_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6472_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7030_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7250_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8522_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-8850_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2480_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5845_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-1429_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9181_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7737_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2876_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8945_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5200_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-3396_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5112_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4838_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8698_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3339_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7970_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4587_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4818_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1558_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-6302_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-217_http_sync_false_callback_parameter_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3620_http_sync_false_callback_parameter_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-8257_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3042_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9099_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6099_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2792_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5515_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-661_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5340_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3127_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5275_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8863_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6257_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5931_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3683_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7587_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-9091_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7108_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2536_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2876_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1579_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3118_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-5260_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3350_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3141_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-292_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7945_http_sync_false_callback_parameter_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7465_http_sync_false_callback_parameter_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4496_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3420_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6336_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-18_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3636_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-2973_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history-5951_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3193_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8727_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5546_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4749_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4188_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-676_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-706_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4949_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history-4283_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3405_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4908_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-2690_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5427_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-164_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6035_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2620_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6917_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history-445_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1589_http_sync_false_callback_parameter_channel_channel_limit_1_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-5549_http_sync_false_callback_parameter_channel_channel_limit_1_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6327_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9344_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7063_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-2694_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9703_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7212_http_sync_false_callback_parameter_channel_channel_limit_1_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history-463_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2950_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3120_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6912_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-8209_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7363_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-6250_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6121_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8677_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history-6364_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-5331_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4088_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-5905_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-621_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-7991_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-9241_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6063_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-4557_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history-1889_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-1554_http_sync_false_callback_parameter_channel_channel_limit_10_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6027_http_sync_false_callback_parameter_channel_channel_limit_10_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-7062_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-3148_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3038_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-7931_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2310_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8698_http_sync_false_callback_parameter_channel_channel_limit_10_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history-7752_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9786_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9661_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-4077_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4503_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6667_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-8802_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6873_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9791_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history-1808_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4351_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-759_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-9242_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-2152_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-3294_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-4947_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-6236_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-6001_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history-37_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-7559_http_sync_false_callback_parameter_channel_channel_limit_100_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-9190_http_sync_false_callback_parameter_channel_channel_limit_100_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989' do
VCR.use_cassette('test_examples/history-6502_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-4758_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343715741034989, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-1296_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343715741034989_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14343715741034989, 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123' do
VCR.use_cassette('test_examples/history-1872_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343715741034989' do
VCR.use_cassette('test_examples/history-9328_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343715741034989', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => 14343715741034989)
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14343716038522123, end: 14343716038522123' do
VCR.use_cassette('test_examples/history-8848_http_sync_false_callback_parameter_channel_channel_limit_100_start_14343716038522123_end_14343716038522123', record: :once) do
event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14343716038522123', 'end' => '14343716038522123')
expect(event.value.map{ |e| e.response}).to eq ["{\"status\":400,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Missing Channel\",\"payload\":{\"channels\":[\"\"]}}\n"]
expect(event.value.map{ |e| e.message}).to eq ["[0,\"Non 2xx server response.\"]"]
end
end


end

