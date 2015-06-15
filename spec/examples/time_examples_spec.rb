require 'spec_helper'

describe Pubnub::Time do
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

  it 'http_sync: true, callback: block' do
VCR.use_cassette('test_examples/time_http_sync_true_callback_block', record: :once) do
event = @pubnub.time(http_sync: true, &@callback)
expect(event.map{ |e| e.response}).to eq ["[14341128698333736]"]
expect(event.map{ |e| e.message}).to eq [14341128698333736]
end
end

it 'http_sync: true, callback: parameter' do
VCR.use_cassette('test_examples/time_http_sync_true_callback_parameter', record: :once) do
event = @pubnub.time(http_sync: true, callback: @callback)
expect(event.map{ |e| e.response}).to eq ["[14341178749616890]"]
expect(event.map{ |e| e.message}).to eq [14341178749616890]
end
end

it 'http_sync: false, callback: block' do
VCR.use_cassette('test_examples/time_http_sync_false_callback_block', record: :once) do
event = @pubnub.time(http_sync: false, &@callback)
expect(event.value.map{ |e| e.response}).to eq ["[14341178799797610]"]
expect(event.value.map{ |e| e.message}).to eq [14341178799797610]
end
end

it 'http_sync: false, callback: parameter' do
VCR.use_cassette('test_examples/time_http_sync_false_callback_parameter', record: :once) do
event = @pubnub.time(http_sync: false, callback: @callback)
expect(event.value.map{ |e| e.response}).to eq ["[14341187343149655]"]
expect(event.value.map{ |e| e.message}).to eq [14341187343149655]
end
end


end

