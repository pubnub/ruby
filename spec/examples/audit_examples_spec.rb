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

  it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671451
    VCR.use_cassette('test_examples/audit-8589_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => 'channel', 'auth-key' => 'key', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671452
    VCR.use_cassette('test_examples/audit-7196_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => 'channel', 'auth-key' => :key, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671452
    VCR.use_cassette('test_examples/audit-9636_http_sync_true_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => 'channel', 'auth-key' => 'key1, key2', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671452
    VCR.use_cassette('test_examples/audit-36_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => :channel, 'auth-key' => 'key', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671453
    VCR.use_cassette('test_examples/audit-2281_http_sync_true_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => :channel, 'auth-key' => :key, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671453
    VCR.use_cassette('test_examples/audit-4057_http_sync_true_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'channel' => :channel, 'auth-key' => 'key1, key2', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671454
    VCR.use_cassette('test_examples/audit-2976_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671455
    VCR.use_cassette('test_examples/audit-7135_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => :key)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671455
    VCR.use_cassette('test_examples/audit-1034_http_sync_true_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key1, key2')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671456
    VCR.use_cassette('test_examples/audit-5584_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671456
    VCR.use_cassette('test_examples/audit-2388_http_sync_true_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => :key)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671456
    VCR.use_cassette('test_examples/audit-6308_http_sync_true_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key1, key2')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671457
    VCR.use_cassette('test_examples/audit-4972_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => 'channel', 'auth-key' => 'key', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671459
    VCR.use_cassette('test_examples/audit-2670_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => 'channel', 'auth-key' => :key, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671459
    VCR.use_cassette('test_examples/audit-2093_http_sync_false_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => 'channel', 'auth-key' => 'key1, key2', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671460
    VCR.use_cassette('test_examples/audit-1268_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => :channel, 'auth-key' => 'key', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671461
    VCR.use_cassette('test_examples/audit-2457_http_sync_false_callback_block_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => :channel, 'auth-key' => :key, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671461
    VCR.use_cassette('test_examples/audit-9364_http_sync_false_callback_block_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'channel' => :channel, 'auth-key' => 'key1, key2', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671462
    VCR.use_cassette('test_examples/audit-6617_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671462
    VCR.use_cassette('test_examples/audit-5374_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => :key)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671462
    VCR.use_cassette('test_examples/audit-4593_http_sync_false_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'auth-key' => 'key1, key2')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671463
    VCR.use_cassette('test_examples/audit-2851_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671463
    VCR.use_cassette('test_examples/audit-4557_http_sync_false_callback_parameter_channel_channel_auth-key_key', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => :key)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, auth-key: key1, key2' do
    Pubnub::Audit.any_instance.stub(:current_time).and_return 1435671464
    VCR.use_cassette('test_examples/audit-2314_http_sync_false_callback_parameter_channel_channel_auth-key_key1, key2', record: :once) do
      event = @pubnub.audit('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'auth-key' => 'key1, key2')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end


end

