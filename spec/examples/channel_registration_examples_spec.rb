require 'spec_helper'

describe Pubnub::ChannelRegistration do
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

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5870_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-2012_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-2412_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-8918_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6165_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6773_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-7317_http_sync_true_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-2453_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-8388_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-7451_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-7808_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-523_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-8689_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-2205_http_sync_true_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5156_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-6820_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-3402_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-5722_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-3829_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-4923_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-5066_http_sync_true_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-9090_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-1965_http_sync_true_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-1490_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-2303_http_sync_true_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6318_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-5414_http_sync_true_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-3632_http_sync_true_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-9973_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-6840_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-5252_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-5589_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-413_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1595_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-5948_http_sync_true_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-6913_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-3686_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-6699_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4459_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1474_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-3794_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-2039_http_sync_true_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-9698_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5106_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-8150_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4185_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6913_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-8695_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-4811_http_sync_true_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5271_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-9400_http_sync_true_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-3502_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-8475_http_sync_true_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1752_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-539_http_sync_true_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-7985_http_sync_true_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-7596_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-6850_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-3907_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-1644_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1844_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-4888_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-7569_http_sync_false_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-4398_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-1378_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-514_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-1524_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1696_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-9126_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-3318_http_sync_false_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-4355_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-8539_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4880_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-2102_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-7698_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-201_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-5912_http_sync_false_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-142_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-9633_http_sync_false_callback_block_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-6432_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-3006_http_sync_false_callback_block_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-3296_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-7485_http_sync_false_callback_block_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-5152_http_sync_false_callback_block_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-555_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-3183_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4493_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-5234_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6699_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-5212_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-7939_http_sync_false_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-6584_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-4515_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-8580_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-7215_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6200_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-1133_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-7413_http_sync_false_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5628_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-5597_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-503_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-8787_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-7451_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-6852_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-2979_http_sync_false_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-2073_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/channel_registration-915_http_sync_false_callback_parameter_channel_gchannel_group_group_action_list_groups', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4716_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/channel_registration-4588_http_sync_false_callback_parameter_channel_gchannel_group_group_action_get', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-3001_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/channel_registration-7423_http_sync_false_callback_parameter_channel_gchannel_group_group_action_add', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/channel_registration-6058_http_sync_false_callback_parameter_channel_gchannel_group_group_action_remove', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end


end

