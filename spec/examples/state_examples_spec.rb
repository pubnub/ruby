require 'spec_helper'

describe Pubnub::State do
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

  it 'http_sync: true, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001063', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => 'uuid', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001055', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => 'uuid', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, uuid: uuid' do
    VCR.use_cassette('test_examples/1001061', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => 'uuid', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: true, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001060', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => :uuid, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001064', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => :uuid, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, uuid: uuid' do
    VCR.use_cassette('test_examples/1001067', record: :once) do
      event = @pubnub.state('http_sync' => true, 'uuid' => :uuid, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001054', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => 'uuid', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001058', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => 'uuid', 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid' do
    VCR.use_cassette('test_examples/1001074', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => 'uuid')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001057', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => :uuid, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001059', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => :uuid, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: uuid' do
    VCR.use_cassette('test_examples/1001065', record: :once) do
      event = @pubnub.state('http_sync' => true, 'callback' => :parameter, 'uuid' => :uuid)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001070', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => 'uuid', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001068', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => 'uuid', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid' do
    VCR.use_cassette('test_examples/1001066', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => 'uuid', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001062', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => :uuid, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001072', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => :uuid, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: uuid' do
    VCR.use_cassette('test_examples/1001075', record: :once) do
      event = @pubnub.state('http_sync' => false, 'uuid' => :uuid, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001069', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => 'uuid', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001052', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => 'uuid', 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid' do
    VCR.use_cassette('test_examples/1001073', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => 'uuid')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001053', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => :uuid, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid, channel: channel' do
    VCR.use_cassette('test_examples/1001056', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => :uuid, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"uuid\": \"uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {}, \"channel\": \"channel\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: uuid' do
    VCR.use_cassette('test_examples/1001071', record: :once) do
      event = @pubnub.state('http_sync' => false, 'callback' => :parameter, 'uuid' => :uuid)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 400, \"message\": \"No valid channels specified\", \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["No valid channels specified"]
    end
  end


end

