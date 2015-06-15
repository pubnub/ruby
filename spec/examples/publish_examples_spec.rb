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
      :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
      :error_callback => @error_callback
    )

    @pubnub.uuid = 'f0ac67ef-912f-4797-be67-a59745107306'

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: :message, channel: 'channel', &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271962242699\"]"]
expect(event.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: :message, channel: :channel, &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271962242699\"]"]
expect(event.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: 'message', channel: 'channel', &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271962242699\"]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: 'message', channel: :channel, &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271962242699\"]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: ["me", "ssage"], channel: 'channel', &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271979108287\"]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: ["me", "ssage"], channel: :channel, &@callback)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271979108287\"]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: true, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: 100, channel: 'channel', &@callback)
expect(event.map{ |e| e.response}).to eq ["{\"status\":403,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Forbidden\",\"payload\":{\"channels\":[\"channel\"]}}\n"]
expect(event.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, message: 100, channel: :channel, &@callback)
expect(event.map{ |e| e.response}).to eq ["{\"status\":403,\"service\":\"Access Manager\",\"error\":true,\"message\":\"Forbidden\",\"payload\":{\"channels\":[\"channel\"]}}\n"]
expect(event.map{ |e| e.message}).to eq ["[0,\"Unknown error\"]"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: :message, channel: 'channel')
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271989785660\"]"]
expect(event.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: :message, channel: :channel)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271989785660\"]"]
expect(event.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: 'message', channel: 'channel')
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271989785660\"]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: 'message', channel: :channel)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271989785660\"]"]
expect(event.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: ["me", "ssage"], channel: 'channel')
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271995107570\"]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: ["me", "ssage"], channel: :channel)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341271995107570\"]"]
expect(event.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: 100, channel: 'channel')
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272000317405\"]"]
expect(event.map{ |e| e.message}).to eq [100]
end
end

it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: true, callback: @callback, message: 100, channel: :channel)
expect(event.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272000317405\"]"]
expect(event.map{ |e| e.message}).to eq [100]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: :message, channel: 'channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272005312027\"]"]
expect(event.value.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: :message, channel: :channel, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272005312027\"]"]
expect(event.value.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: 'message', channel: 'channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272005312027\"]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: 'message', channel: :channel, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272005312027\"]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: ["me", "ssage"], channel: 'channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272010606894\"]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: ["me", "ssage"], channel: :channel, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272010606894\"]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: false, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: 100, channel: 'channel', &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272015679264\"]"]
expect(event.value.map{ |e| e.message}).to eq [100]
end
end

it 'http_sync: false, callback: block, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, message: 100, channel: :channel, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272015679264\"]"]
expect(event.value.map{ |e| e.message}).to eq [100]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: :message, channel: 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272020118322\"]"]
expect(event.value.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: :message, channel: :channel)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272020118322\"]"]
expect(event.value.map{ |e| e.message}).to eq [:message]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: 'message', channel: 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272020118322\"]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, message: message, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: 'message', channel: :channel)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272020118322\"]"]
expect(event.value.map{ |e| e.message}).to eq ["message"]
end
end

it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: ["me", "ssage"], channel: 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272025363318\"]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: ["me", "ssage"], channel: :channel)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272025363318\"]"]
expect(event.value.map{ |e| e.message}).to eq [["me", "ssage"]]
end
end

it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: 100, channel: 'channel')
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272041928762\"]"]
expect(event.value.map{ |e| e.message}).to eq [100]
end
end

it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
VCR.use_cassette('test_examples/publish_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
event = @pubnub.publish(http_sync: false, callback: @callback, message: 100, channel: :channel)
expect(event.value.map{ |e| e.response}).to eq ["[1,\"Sent\",\"14341272041928762\"]"]
expect(event.value.map{ |e| e.message}).to eq [100]
end
end


end

