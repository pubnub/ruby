require 'spec_helper'

describe Pubnub::Revoke do
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
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671928
    VCR.use_cassette('test_examples/1001025', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/1001048', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/1000973', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/1001044', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671930
    VCR.use_cassette('test_examples/1001003', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671930
    VCR.use_cassette('test_examples/1000961', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671931
    VCR.use_cassette('test_examples/1001007', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671931
    VCR.use_cassette('test_examples/1000947', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671932
    VCR.use_cassette('test_examples/1000987', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671932
    VCR.use_cassette('test_examples/1001012', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671933
    VCR.use_cassette('test_examples/1000963', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671933
    VCR.use_cassette('test_examples/1000969', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/1001031', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/1000964', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/1001051', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671935
    VCR.use_cassette('test_examples/1000981', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671935
    VCR.use_cassette('test_examples/1000953', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671936
    VCR.use_cassette('test_examples/1000994', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671936
    VCR.use_cassette('test_examples/1000945', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671937
    VCR.use_cassette('test_examples/1000989', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671937
    VCR.use_cassette('test_examples/1000974', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671938
    VCR.use_cassette('test_examples/1000954', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671938
    VCR.use_cassette('test_examples/1000988', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671939
    VCR.use_cassette('test_examples/1001041', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671939
    VCR.use_cassette('test_examples/1001000', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671940
    VCR.use_cassette('test_examples/1000971', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671940
    VCR.use_cassette('test_examples/1001037', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671941
    VCR.use_cassette('test_examples/1000995', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671941
    VCR.use_cassette('test_examples/1001029', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671942
    VCR.use_cassette('test_examples/1000970', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671942
    VCR.use_cassette('test_examples/1000985', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/1001038', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/1000976', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/1001045', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671944
    VCR.use_cassette('test_examples/1001006', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671944
    VCR.use_cassette('test_examples/1000946', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671945
    VCR.use_cassette('test_examples/1001027', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671945
    VCR.use_cassette('test_examples/1000996', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671946
    VCR.use_cassette('test_examples/1001009', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671947
    VCR.use_cassette('test_examples/1001033', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671947
    VCR.use_cassette('test_examples/1000965', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671948
    VCR.use_cassette('test_examples/1000949', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671948
    VCR.use_cassette('test_examples/1001019', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671949
    VCR.use_cassette('test_examples/1000997', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671949
    VCR.use_cassette('test_examples/1000959', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671950
    VCR.use_cassette('test_examples/1000999', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671950
    VCR.use_cassette('test_examples/1001039', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/1001024', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/1001005', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/1000968', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671952
    VCR.use_cassette('test_examples/1001011', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671952
    VCR.use_cassette('test_examples/1000967', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671953
    VCR.use_cassette('test_examples/1000998', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671953
    VCR.use_cassette('test_examples/1000977', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671954
    VCR.use_cassette('test_examples/1001016', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671954
    VCR.use_cassette('test_examples/1000958', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/1000972', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/1000979', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/1001014', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671956
    VCR.use_cassette('test_examples/1001040', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671956
    VCR.use_cassette('test_examples/1000955', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671957
    VCR.use_cassette('test_examples/1000982', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671957
    VCR.use_cassette('test_examples/1001008', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671958
    VCR.use_cassette('test_examples/1000957', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671958
    VCR.use_cassette('test_examples/1001046', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671959
    VCR.use_cassette('test_examples/1000944', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671959
    VCR.use_cassette('test_examples/1000983', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671960
    VCR.use_cassette('test_examples/1000990', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671960
    VCR.use_cassette('test_examples/1001010', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/1001035', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/1000993', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/1000962', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671962
    VCR.use_cassette('test_examples/1000984', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671962
    VCR.use_cassette('test_examples/1001018', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671963
    VCR.use_cassette('test_examples/1000950', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671963
    VCR.use_cassette('test_examples/1001002', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671964
    VCR.use_cassette('test_examples/1000992', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671965
    VCR.use_cassette('test_examples/1001023', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671965
    VCR.use_cassette('test_examples/1000991', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671966
    VCR.use_cassette('test_examples/1001030', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671966
    VCR.use_cassette('test_examples/1001047', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671967
    VCR.use_cassette('test_examples/1000980', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671967
    VCR.use_cassette('test_examples/1001043', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671968
    VCR.use_cassette('test_examples/1001032', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/1000960', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/1000975', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/1001050', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671970
    VCR.use_cassette('test_examples/1001028', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/1001022', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/1000966', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/1001026', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671972
    VCR.use_cassette('test_examples/1001017', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671972
    VCR.use_cassette('test_examples/1001001', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671973
    VCR.use_cassette('test_examples/1000952', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671973
    VCR.use_cassette('test_examples/1001020', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671974
    VCR.use_cassette('test_examples/1000951', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671974
    VCR.use_cassette('test_examples/1000948', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/1000978', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/1000986', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/1001042', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671976
    VCR.use_cassette('test_examples/1000956', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671977
    VCR.use_cassette('test_examples/1001034', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671977
    VCR.use_cassette('test_examples/1001021', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671978
    VCR.use_cassette('test_examples/1001036', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671978
    VCR.use_cassette('test_examples/1001049', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671979
    VCR.use_cassette('test_examples/1001004', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671979
    VCR.use_cassette('test_examples/1001013', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671980
    VCR.use_cassette('test_examples/1001015', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end


end

