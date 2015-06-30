require 'spec_helper'

describe Pubnub::WhereNow do
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

  it 'http_sync: true, callback: block, uuid: john' do
    VCR.use_cassette('test_examples/where_now-8990_http_sync_true_callback_block_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => true, 'uuid' => 'john', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, uuid: john' do
    VCR.use_cassette('test_examples/where_now-420_http_sync_true_callback_block_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => true, 'uuid' => :john, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: john' do
    VCR.use_cassette('test_examples/where_now-6057_http_sync_true_callback_parameter_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => true, 'callback' => :parameter, 'uuid' => 'john')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, uuid: john' do
    VCR.use_cassette('test_examples/where_now-4085_http_sync_true_callback_parameter_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => true, 'callback' => :parameter, 'uuid' => :john)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: john' do
    VCR.use_cassette('test_examples/where_now-6464_http_sync_false_callback_block_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => false, 'uuid' => 'john', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, uuid: john' do
    VCR.use_cassette('test_examples/where_now-8835_http_sync_false_callback_block_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => false, 'uuid' => :john, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: john' do
    VCR.use_cassette('test_examples/where_now-8283_http_sync_false_callback_parameter_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => false, 'callback' => :parameter, 'uuid' => 'john')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, uuid: john' do
    VCR.use_cassette('test_examples/where_now-1666_http_sync_false_callback_parameter_uuid_john', record: :once) do
      event = @pubnub.where_now('http_sync' => false, 'callback' => :parameter, 'uuid' => :john)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end


end

