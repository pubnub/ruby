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
        :publish_key => 'pub-c-1e88e5ec-5a19-4ff1-a43a-5ad34a98cfd1',
        :subscribe_key => 'sub-c-0687cf3e-2b8e-11e5-b6bc-02ee2ddab7fe',
        :secret_key => 'sec-c-YzFiM2UzODctYzk2Ny00ZDEwLWEyYWMtYTBlODZkYTFhNmZi',
        :error_callback => @error_callback
    )

    @pubnub_wo_pam_client = Pubnub.new(
        :publish_key => 'pub-c-1e88e5ec-5a19-4ff1-a43a-5ad34a98cfd1',
        :subscribe_key => 'sub-c-0687cf3e-2b8e-11e5-b6bc-02ee2ddab7fe',
        :secret_key => 'sec-c-YzFiM2UzODctYzk2Ny00ZDEwLWEyYWMtYTBlODZkYTFhNmZi',
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
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-7211_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-1102_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-1689_http_sync_true_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-9165_http_sync_true_callback_block_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-8280_http_sync_true_callback_block_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-1490_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-1350_http_sync_true_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7674_http_sync_true_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7472_http_sync_true_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-8650_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-7669_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-9952_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-586_http_sync_true_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-6482_http_sync_true_callback_parameter_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-5152_http_sync_true_callback_parameter_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-4427_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-3003_http_sync_true_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-7139_http_sync_true_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-1642_http_sync_true_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3307_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-5102_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3191_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2001_http_sync_false_callback_block_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-7844_http_sync_false_callback_block_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-1073_http_sync_false_callback_block_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7810_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-5394_http_sync_false_callback_block_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-8308_http_sync_false_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-1637_http_sync_false_callback_block_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2427_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-3010_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-2323_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/publish-8174_http_sync_false_callback_parameter_message_message_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-8877_http_sync_false_callback_parameter_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/publish-964_http_sync_false_callback_parameter_message__me_ssage__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7569_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/publish-7652_http_sync_false_callback_parameter_message_100_channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-3491_http_sync_false_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/publish-8514_http_sync_false_callback_parameter_message__key_value__channel_channel', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end


end

