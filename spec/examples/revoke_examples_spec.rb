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
    VCR.use_cassette('test_examples/revoke-7308_http_sync_true_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/revoke-9348_http_sync_true_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/revoke-3899_http_sync_true_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671929
    VCR.use_cassette('test_examples/revoke-9076_http_sync_true_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671930
    VCR.use_cassette('test_examples/revoke-5740_http_sync_true_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671930
    VCR.use_cassette('test_examples/revoke-2728_http_sync_true_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671931
    VCR.use_cassette('test_examples/revoke-6093_http_sync_true_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671931
    VCR.use_cassette('test_examples/revoke-1351_http_sync_true_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671932
    VCR.use_cassette('test_examples/revoke-4600_http_sync_true_callback_block_read_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671932
    VCR.use_cassette('test_examples/revoke-6518_http_sync_true_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671933
    VCR.use_cassette('test_examples/revoke-2812_http_sync_true_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671933
    VCR.use_cassette('test_examples/revoke-3476_http_sync_true_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/revoke-8176_http_sync_true_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/revoke-3057_http_sync_true_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671934
    VCR.use_cassette('test_examples/revoke-9968_http_sync_true_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671935
    VCR.use_cassette('test_examples/revoke-4243_http_sync_true_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671935
    VCR.use_cassette('test_examples/revoke-2272_http_sync_true_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671936
    VCR.use_cassette('test_examples/revoke-514_http_sync_true_callback_block_read_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671936
    VCR.use_cassette('test_examples/revoke-110_http_sync_true_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671937
    VCR.use_cassette('test_examples/revoke-4828_http_sync_true_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671937
    VCR.use_cassette('test_examples/revoke-38_http_sync_true_callback_block_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671938
    VCR.use_cassette('test_examples/revoke-2355_http_sync_true_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671938
    VCR.use_cassette('test_examples/revoke-469_http_sync_true_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671939
    VCR.use_cassette('test_examples/revoke-8906_http_sync_true_callback_block_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671939
    VCR.use_cassette('test_examples/revoke-541_http_sync_true_callback_block_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671940
    VCR.use_cassette('test_examples/revoke-3788_http_sync_true_callback_block_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671940
    VCR.use_cassette('test_examples/revoke-8684_http_sync_true_callback_block_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671941
    VCR.use_cassette('test_examples/revoke-5213_http_sync_true_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671941
    VCR.use_cassette('test_examples/revoke-7880_http_sync_true_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671942
    VCR.use_cassette('test_examples/revoke-3757_http_sync_true_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671942
    VCR.use_cassette('test_examples/revoke-4311_http_sync_true_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/revoke-8820_http_sync_true_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/revoke-4083_http_sync_true_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671943
    VCR.use_cassette('test_examples/revoke-9103_http_sync_true_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671944
    VCR.use_cassette('test_examples/revoke-6048_http_sync_true_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671944
    VCR.use_cassette('test_examples/revoke-1311_http_sync_true_callback_parameter_read_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671945
    VCR.use_cassette('test_examples/revoke-7663_http_sync_true_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671945
    VCR.use_cassette('test_examples/revoke-5231_http_sync_true_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671946
    VCR.use_cassette('test_examples/revoke-6158_http_sync_true_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671947
    VCR.use_cassette('test_examples/revoke-8299_http_sync_true_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671947
    VCR.use_cassette('test_examples/revoke-3100_http_sync_true_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671948
    VCR.use_cassette('test_examples/revoke-1534_http_sync_true_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671948
    VCR.use_cassette('test_examples/revoke-6834_http_sync_true_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671949
    VCR.use_cassette('test_examples/revoke-5297_http_sync_true_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671949
    VCR.use_cassette('test_examples/revoke-2638_http_sync_true_callback_parameter_read_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671950
    VCR.use_cassette('test_examples/revoke-5345_http_sync_true_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671950
    VCR.use_cassette('test_examples/revoke-8865_http_sync_true_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/revoke-7299_http_sync_true_callback_parameter_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/revoke-588_http_sync_true_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671951
    VCR.use_cassette('test_examples/revoke-3403_http_sync_true_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671952
    VCR.use_cassette('test_examples/revoke-6443_http_sync_true_callback_parameter_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671952
    VCR.use_cassette('test_examples/revoke-320_http_sync_true_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671953
    VCR.use_cassette('test_examples/revoke-5325_http_sync_true_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671953
    VCR.use_cassette('test_examples/revoke-4175_http_sync_true_callback_parameter_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => true, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671954
    VCR.use_cassette('test_examples/revoke-6611_http_sync_false_callback_block_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671954
    VCR.use_cassette('test_examples/revoke-2566_http_sync_false_callback_block_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/revoke-3790_http_sync_false_callback_block_read_true_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/revoke-4199_http_sync_false_callback_block_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671955
    VCR.use_cassette('test_examples/revoke-6547_http_sync_false_callback_block_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671956
    VCR.use_cassette('test_examples/revoke-8905_http_sync_false_callback_block_read_true_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671956
    VCR.use_cassette('test_examples/revoke-2426_http_sync_false_callback_block_read_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671957
    VCR.use_cassette('test_examples/revoke-4294_http_sync_false_callback_block_read_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671957
    VCR.use_cassette('test_examples/revoke-6094_http_sync_false_callback_block_read_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671958
    VCR.use_cassette('test_examples/revoke-2508_http_sync_false_callback_block_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671958
    VCR.use_cassette('test_examples/revoke-9148_http_sync_false_callback_block_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671959
    VCR.use_cassette('test_examples/revoke-1003_http_sync_false_callback_block_read_false_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671959
    VCR.use_cassette('test_examples/revoke-4307_http_sync_false_callback_block_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671960
    VCR.use_cassette('test_examples/revoke-4_http_sync_false_callback_block_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671960
    VCR.use_cassette('test_examples/revoke-6282_http_sync_false_callback_block_read_false_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/revoke-8495_http_sync_false_callback_block_read_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/revoke-5121_http_sync_false_callback_block_read_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671961
    VCR.use_cassette('test_examples/revoke-2783_http_sync_false_callback_block_read_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'read' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671962
    VCR.use_cassette('test_examples/revoke-4310_http_sync_false_callback_block_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671962
    VCR.use_cassette('test_examples/revoke-6811_http_sync_false_callback_block_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671963
    VCR.use_cassette('test_examples/revoke-1641_http_sync_false_callback_block_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => true, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671963
    VCR.use_cassette('test_examples/revoke-567_http_sync_false_callback_block_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671964
    VCR.use_cassette('test_examples/revoke-5107_http_sync_false_callback_block_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671965
    VCR.use_cassette('test_examples/revoke-7244_http_sync_false_callback_block_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'write' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671965
    VCR.use_cassette('test_examples/revoke-5055_http_sync_false_callback_block_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'ttl' => 0, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671966
    VCR.use_cassette('test_examples/revoke-8032_http_sync_false_callback_block_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'ttl' => 600, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: block, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671966
    VCR.use_cassette('test_examples/revoke-9197_http_sync_false_callback_block_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'channel' => 'demo_channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671967
    VCR.use_cassette('test_examples/revoke-4241_http_sync_false_callback_parameter_read_true_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671967
    VCR.use_cassette('test_examples/revoke-9048_http_sync_false_callback_parameter_read_true_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671968
    VCR.use_cassette('test_examples/revoke-8280_http_sync_false_callback_parameter_read_true_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/revoke-2663_http_sync_false_callback_parameter_read_true_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/revoke-4065_http_sync_false_callback_parameter_read_true_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671969
    VCR.use_cassette('test_examples/revoke-9860_http_sync_false_callback_parameter_read_true_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671970
    VCR.use_cassette('test_examples/revoke-7713_http_sync_false_callback_parameter_read_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/revoke-7011_http_sync_false_callback_parameter_read_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/revoke-3206_http_sync_false_callback_parameter_read_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671971
    VCR.use_cassette('test_examples/revoke-7390_http_sync_false_callback_parameter_read_false_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671972
    VCR.use_cassette('test_examples/revoke-6613_http_sync_false_callback_parameter_read_false_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671972
    VCR.use_cassette('test_examples/revoke-557_http_sync_false_callback_parameter_read_false_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671973
    VCR.use_cassette('test_examples/revoke-2262_http_sync_false_callback_parameter_read_false_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671973
    VCR.use_cassette('test_examples/revoke-6862_http_sync_false_callback_parameter_read_false_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671974
    VCR.use_cassette('test_examples/revoke-1864_http_sync_false_callback_parameter_read_false_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671974
    VCR.use_cassette('test_examples/revoke-1414_http_sync_false_callback_parameter_read_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/revoke-4196_http_sync_false_callback_parameter_read_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, read: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/revoke-4389_http_sync_false_callback_parameter_read_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'read' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":1,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671975
    VCR.use_cassette('test_examples/revoke-8998_http_sync_false_callback_parameter_write_true_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671976
    VCR.use_cassette('test_examples/revoke-2473_http_sync_false_callback_parameter_write_true_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: true, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671977
    VCR.use_cassette('test_examples/revoke-8443_http_sync_false_callback_parameter_write_true_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => true, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671977
    VCR.use_cassette('test_examples/revoke-6944_http_sync_false_callback_parameter_write_false_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":0,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671978
    VCR.use_cassette('test_examples/revoke-8508_http_sync_false_callback_parameter_write_false_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":600,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, write: false, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671978
    VCR.use_cassette('test_examples/revoke-9473_http_sync_false_callback_parameter_write_false_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'write' => false, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":1}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1440,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 0, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671979
    VCR.use_cassette('test_examples/revoke-5763_http_sync_false_callback_parameter_ttl_0_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 0, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, ttl: 600, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671979
    VCR.use_cassette('test_examples/revoke-6525_http_sync_false_callback_parameter_ttl_600_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'ttl' => 600, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: demo_channel' do
    stub_const('Pubnub::VERSION', '4.0.0beta'); Pubnub::Revoke.any_instance.stub(:current_time).and_return 1435671980
    VCR.use_cassette('test_examples/revoke-6560_http_sync_false_callback_parameter_channel_demo_channel', record: :once) do
      event = @pubnub.revoke('http_sync' => false, 'callback' => :parameter, 'channel' => 'demo_channel')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"demo_channel\":{\"r\":0,\"m\":0,\"w\":0}},\"subscribe_key\":\"sub-c-719173ee-ff28-11e4-ab7c-0619f8945a4f\",\"ttl\":1,\"level\":\"channel\"}}"]
      expect(event.value.map { |e| e.message }).to eq ["Success"]
    end
  end


end

