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
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671530
    VCR.use_cassette('test_examples/1000218', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671530
    VCR.use_cassette('test_examples/1000151', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671531
    VCR.use_cassette('test_examples/1000141', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671531
    VCR.use_cassette('test_examples/1000212', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671532
    VCR.use_cassette('test_examples/1000183', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671532
    VCR.use_cassette('test_examples/1000150', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671533
    VCR.use_cassette('test_examples/1000143', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671533
    VCR.use_cassette('test_examples/1000239', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
    VCR.use_cassette('test_examples/1000154', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
    VCR.use_cassette('test_examples/1000145', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671534
    VCR.use_cassette('test_examples/1000157', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671535
    VCR.use_cassette('test_examples/1000240', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671535
    VCR.use_cassette('test_examples/1000237', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671536
    VCR.use_cassette('test_examples/1000178', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671536
    VCR.use_cassette('test_examples/1000205', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671537
    VCR.use_cassette('test_examples/1000232', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671537
    VCR.use_cassette('test_examples/1000138', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671538
    VCR.use_cassette('test_examples/1000209', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
    VCR.use_cassette('test_examples/1000149', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
    VCR.use_cassette('test_examples/1000179', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671539
    VCR.use_cassette('test_examples/1000199', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671540
    VCR.use_cassette('test_examples/1000206', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671542
    VCR.use_cassette('test_examples/1000230', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671542
    VCR.use_cassette('test_examples/1000203', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671543
    VCR.use_cassette('test_examples/1000136', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671543
    VCR.use_cassette('test_examples/1000233', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671544
    VCR.use_cassette('test_examples/1000153', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671544
    VCR.use_cassette('test_examples/1000223', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671545
    VCR.use_cassette('test_examples/1000171', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671545
    VCR.use_cassette('test_examples/1000188', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
    VCR.use_cassette('test_examples/1000165', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
    VCR.use_cassette('test_examples/1000148', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671546
    VCR.use_cassette('test_examples/1000211', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671547
    VCR.use_cassette('test_examples/1000144', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671548
    VCR.use_cassette('test_examples/1000208', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671548
    VCR.use_cassette('test_examples/1000168', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671549
    VCR.use_cassette('test_examples/1000215', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671549
    VCR.use_cassette('test_examples/1000180', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671550
    VCR.use_cassette('test_examples/1000162', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671551
    VCR.use_cassette('test_examples/1000242', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671551
    VCR.use_cassette('test_examples/1000195', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671552
    VCR.use_cassette('test_examples/1000146', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671552
    VCR.use_cassette('test_examples/1000152', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671553
    VCR.use_cassette('test_examples/1000243', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671553
    VCR.use_cassette('test_examples/1000235', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671554
    VCR.use_cassette('test_examples/1000204', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671554
    VCR.use_cassette('test_examples/1000172', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671555
    VCR.use_cassette('test_examples/1000159', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671555
    VCR.use_cassette('test_examples/1000207', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671556
    VCR.use_cassette('test_examples/1000226', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671556
    VCR.use_cassette('test_examples/1000189', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671557
    VCR.use_cassette('test_examples/1000222', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671557
    VCR.use_cassette('test_examples/1000139', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671558
    VCR.use_cassette('test_examples/1000217', record: :once) do
      event = @pubnub.grant('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671558
    VCR.use_cassette('test_examples/1000187', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671559
    VCR.use_cassette('test_examples/1000227', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
    VCR.use_cassette('test_examples/1000210', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
    VCR.use_cassette('test_examples/1000185', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671560
    VCR.use_cassette('test_examples/1000213', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671561
    VCR.use_cassette('test_examples/1000158', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
    VCR.use_cassette('test_examples/1000202', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
    VCR.use_cassette('test_examples/1000221', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671562
    VCR.use_cassette('test_examples/1000216', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671563
    VCR.use_cassette('test_examples/1000163', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671564
    VCR.use_cassette('test_examples/1000169', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671564
    VCR.use_cassette('test_examples/1000181', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671565
    VCR.use_cassette('test_examples/1000241', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671565
    VCR.use_cassette('test_examples/1000197', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671566
    VCR.use_cassette('test_examples/1000220', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671566
    VCR.use_cassette('test_examples/1000193', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671567
    VCR.use_cassette('test_examples/1000164', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671567
    VCR.use_cassette('test_examples/1000140', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671568
    VCR.use_cassette('test_examples/1000225', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671569
    VCR.use_cassette('test_examples/1000194', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671569
    VCR.use_cassette('test_examples/1000156', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671570
    VCR.use_cassette('test_examples/1000155', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671570
    VCR.use_cassette('test_examples/1000176', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671571
    VCR.use_cassette('test_examples/1000177', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671571
    VCR.use_cassette('test_examples/1000236', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671572
    VCR.use_cassette('test_examples/1000198', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671572
    VCR.use_cassette('test_examples/1000170', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671573
    VCR.use_cassette('test_examples/1000161', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671573
    VCR.use_cassette('test_examples/1000167', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671574
    VCR.use_cassette('test_examples/1000231', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671574
    VCR.use_cassette('test_examples/1000147', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671576
    VCR.use_cassette('test_examples/1000201', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671577
    VCR.use_cassette('test_examples/1000137', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671577
    VCR.use_cassette('test_examples/1000142', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
    VCR.use_cassette('test_examples/1000173', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
    VCR.use_cassette('test_examples/1000190', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671578
    VCR.use_cassette('test_examples/1000186', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671579
    VCR.use_cassette('test_examples/1000166', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671579
    VCR.use_cassette('test_examples/1000238', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671580
    VCR.use_cassette('test_examples/1000175', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671581
    VCR.use_cassette('test_examples/1000192', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671581
    VCR.use_cassette('test_examples/1000214', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671582
    VCR.use_cassette('test_examples/1000196', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671582
    VCR.use_cassette('test_examples/1000174', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671583
    VCR.use_cassette('test_examples/1000228', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671583
    VCR.use_cassette('test_examples/1000182', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671584
    VCR.use_cassette('test_examples/1000224', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671584
    VCR.use_cassette('test_examples/1000200', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
    VCR.use_cassette('test_examples/1000229', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
    VCR.use_cassette('test_examples/1000234', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671585
    VCR.use_cassette('test_examples/1000191', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671586
    VCR.use_cassette('test_examples/1000219', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671586
    VCR.use_cassette('test_examples/1000184', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Grant.any_instance.stub(:current_time).and_return 1435671587
    VCR.use_cassette('test_examples/1000160', record: :once) do
      event = @pubnub.grant('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":1,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end


end

