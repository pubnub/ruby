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

  it 'http_sync: true, callback: block' do
    VCR.use_cassette('test_examples/here_now-9205_http_sync_true_callback_block', record: :once) do
      event = @pubnub.here_now('http_sync' => true, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": {}, \"total_channels\": 0, \"total_occupancy\": 0}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel' do
    VCR.use_cassette('test_examples/here_now-9778_http_sync_true_callback_block_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => true, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel' do
    VCR.use_cassette('test_examples/here_now-2912_http_sync_true_callback_block_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => true, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter' do
    VCR.use_cassette('test_examples/here_now-7690_http_sync_true_callback_parameter', record: :once) do
      event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": {}, \"total_channels\": 0, \"total_occupancy\": 0}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel' do
    VCR.use_cassette('test_examples/here_now-281_http_sync_true_callback_parameter_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel' do
    VCR.use_cassette('test_examples/here_now-550_http_sync_true_callback_parameter_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block' do
    VCR.use_cassette('test_examples/here_now-9354_http_sync_false_callback_block', record: :once) do
      event = @pubnub.here_now('http_sync' => false, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": {}, \"total_channels\": 0, \"total_occupancy\": 0}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel' do
    VCR.use_cassette('test_examples/here_now-7991_http_sync_false_callback_block_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => false, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel' do
    VCR.use_cassette('test_examples/here_now-9135_http_sync_false_callback_block_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => false, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter' do
    VCR.use_cassette('test_examples/here_now-2298_http_sync_false_callback_parameter', record: :once) do
      event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": {}, \"total_channels\": 0, \"total_occupancy\": 0}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel' do
    VCR.use_cassette('test_examples/here_now-3758_http_sync_false_callback_parameter_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel' do
    VCR.use_cassette('test_examples/here_now-772_http_sync_false_callback_parameter_channel_channel', record: :once) do
      event = @pubnub.here_now('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [], \"occupancy\": 0}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end


end

