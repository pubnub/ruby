require 'spec_helper'

describe Pubnub::Publish do
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

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-6985_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => :message, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719110624915\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-7211_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719114804739\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-1102_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719119887196\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-1689_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719124142186\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-9165_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719131279637\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-8280_http_sync_true_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719135526853\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-1490_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719139806252\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-1350_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719151137717\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7674_http_sync_true_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719155821576\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7472_http_sync_true_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719159947603\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-8650_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719164171537\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-7669_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719168334475\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-9952_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719172575183\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-586_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719176868746\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-6482_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719181045915\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-5152_http_sync_true_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719187247284\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-4427_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719191574474\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-3003_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719195829473\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7139_http_sync_true_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719201908167\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-1642_http_sync_true_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719206081890\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3307_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719210350162\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-5102_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719214538666\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3191_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719218707437\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2001_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719222881852\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-7844_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719227080899\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-1073_http_sync_false_callback_block_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719231341030\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7810_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719235698083\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-5394_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719239913646\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-8308_http_sync_false_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719244038750\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-1637_http_sync_false_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719248162971\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2427_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719252280514\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3010_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719256396124\"]"]
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2323_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719260516089\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-8174_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719264748705\"]"]
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-8877_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719268901365\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-964_http_sync_false_callback_parameter_message_["me", "ssage"]_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719273574919\"]"]
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7569_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719278679738\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7652_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719284367105\"]"]
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-3491_http_sync_false_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719288508278\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-8514_http_sync_false_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }).to eq ["[1,\"Sent\",\"14356719292668080\"]"]
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end


end

