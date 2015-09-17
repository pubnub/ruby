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
    VCR.use_cassette('test_examples/1000925', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => :message, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000927', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000905', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000910', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000941', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000936', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000907', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000906', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000932', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000928', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000939', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000931', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000943', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000923', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000924', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000921', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000919', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000914', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000926', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: true, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000909', record: :once) do
      event = @pubnub.publish('http_sync' => true, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000917', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000920', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => :message, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000916', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000911', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 'message', 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000934', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000904', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => ["me", "ssage"], 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000933', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000922', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => 100, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000937', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => 'channel', &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: block, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000908', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'message' => {:key => :value}, 'channel' => :channel, &@callback)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000913', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000915', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => :message, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [:message]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000912', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: message, channel: channel' do
    VCR.use_cassette('test_examples/1000935', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 'message', 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq ["message"]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000940', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: ["me", "ssage"], channel: channel' do
    VCR.use_cassette('test_examples/1000942', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => ["me", "ssage"], 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [["me", "ssage"]]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000929', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: 100, channel: channel' do
    VCR.use_cassette('test_examples/1000930', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => 100, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [100]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000918', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => 'channel')
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end

  it 'http_sync: false, callback: parameter, message: {:key=>:value}, channel: channel' do
    VCR.use_cassette('test_examples/1000938', record: :once) do
      event = @pubnub.publish('http_sync' => false, 'callback' => :parameter, 'message' => {:key => :value}, 'channel' => :channel)
      expect(event.value.map { |e| e.response }.first).to match /\[1,\"Sent\",\"\d+\"\]/
      expect(event.value.map { |e| e.message }).to eq [{:key => :value}]
    end
  end


end

