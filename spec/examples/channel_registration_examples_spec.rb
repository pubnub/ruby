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
    VCR.use_cassette('test_examples/1000089', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000036', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000043', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000128', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000093', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000100', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000108', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000044', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000121', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000112', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000117', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000079', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000125', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000041', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000076', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000101', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000051', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000088', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000056', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000070', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000072', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000129', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000035', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000028', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000042', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000095', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000083', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000053', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'channel' => :gchannel, 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000135', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000102', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000080', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000085', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000058', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000030', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000091', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000106', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000054', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000099', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000062', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000027', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000055', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000038', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000134', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000073', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000120', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000059', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000105', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000126', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000067', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000081', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000132', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000052', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000122', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000033', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000082', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: true, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000119', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => true, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000115', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000103', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000057', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000031', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000034', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000069', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000114', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000061', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000025', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000074', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000029', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000032', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000130', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000050', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000060', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000123', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000068', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000040', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000116', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000037', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000090', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000026', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000133', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000096', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :get, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000047', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'get', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000049', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :add, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000113', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => 'add', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: block, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000075', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'channel' => :gchannel, 'group' => :group, 'action' => :remove, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000084', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000048', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000063', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000078', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000098', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000077', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000118', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000097', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000064', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000124', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000107', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000094', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000024', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000109', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => 'gchannel', 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000087', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000086', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000071', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000127', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000111', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000104', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000045', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => 'group', 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000039', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :list_groups)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: list_groups' do
    VCR.use_cassette('test_examples/1000131', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'list_groups')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"namespace\": \"\", \"groups\": []}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000066', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :get)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: get' do
    VCR.use_cassette('test_examples/1000065', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'get')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"payload\": {\"channels\": [], \"group\": \"group\"}, \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq [nil]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000046', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :add)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: add' do
    VCR.use_cassette('test_examples/1000110', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => 'add')
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end

  it 'http_sync: false, callback: parameter, channel: gchannel, group: group, action: remove' do
    VCR.use_cassette('test_examples/1000092', record: :once) do
      event = @pubnub_wo_pam_client.channel_registration('http_sync' => false, 'callback' => :parameter, 'channel' => :gchannel, 'group' => :group, 'action' => :remove)
      expect(event.value.map { |e| e.response }).to eq ["{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}"]
      expect(event.value.map { |e| e.message }).to eq ["OK"]
    end
  end


end

