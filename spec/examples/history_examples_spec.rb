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
      :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
      :error_callback => @error_callback
    )

    @pubnub.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 1, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 10, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: :channel, limit: 100, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 1, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 10, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, channel: 'channel', limit: 100, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699, end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699, end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699', end: 14341271962242699)
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_true_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: true, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699', end: '14341271962242699')
expect(event.map{ |e| e.response}).to eq []
expect(event.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 1, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 10, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: :channel, limit: 100, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 1, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 10, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: 14341271962242699, end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: 14341271962242699, end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: '14341271962242699', end: 14341271962242699, &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_block_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, channel: 'channel', limit: 100, start: '14341271962242699', end: '14341271962242699', &@callback)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 1, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 10, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: :channel, limit: 100, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_1_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 1, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_10_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 10, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\"],14341271962242699,14341271962242699]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]", "[[[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271979108287,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: true, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, reverse: false, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq ["[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]", "[[\"message\",[\"me\",\"ssage\"],\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100,\"message\",[\"me\",\"ssage\"],100],14341271962242699,14341272041928762]"]
expect(event.value.map{ |e| e.message}).to eq ["message", ["me", "ssage"], "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100, "message", ["me", "ssage"], 100]
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699, end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: 14341271962242699, end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699', end: 14341271962242699)
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end

it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14341271962242699, end: 14341271962242699' do
VCR.use_cassette('test_examples/history_http_sync_false_callback_parameter_channel_channel_limit_100_start_14341271962242699_end_14341271962242699', record: :once) do
event = @pubnub.history(http_sync: false, callback: @callback, channel: 'channel', limit: 100, start: '14341271962242699', end: '14341271962242699')
expect(event.value.map{ |e| e.response}).to eq []
expect(event.value.map{ |e| e.message}).to eq []
end
end


end

