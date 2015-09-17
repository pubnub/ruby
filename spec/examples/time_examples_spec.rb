require 'spec_helper'

describe Pubnub::Time do
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

  it 'http_sync: true, callback: block' do
    VCR.use_cassette('test_examples/1001078', record: :once) do
      event = @pubnub.time('http_sync' => true, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[14356719940240853]"]
      expect(event.value.map { |e| e.message }).to eq [14356719940240853]
    end
  end

  it 'http_sync: true, callback: parameter' do
    VCR.use_cassette('test_examples/1001077', record: :once) do
      event = @pubnub.time('http_sync' => true, 'callback' => :parameter)
      expect(event.value.map { |e| e.response }).to eq ["[14356719944430349]"]
      expect(event.value.map { |e| e.message }).to eq [14356719944430349]
    end
  end

  it 'http_sync: false, callback: block' do
    VCR.use_cassette('test_examples/1001079', record: :once) do
      event = @pubnub.time('http_sync' => false, &@callback)
      expect(event.value.map { |e| e.response }).to eq ["[14356719948566824]"]
      expect(event.value.map { |e| e.message }).to eq [14356719948566824]
    end
  end

  it 'http_sync: false, callback: parameter' do
    VCR.use_cassette('test_examples/1001076', record: :once) do
      event = @pubnub.time('http_sync' => false, 'callback' => :parameter)
      expect(event.value.map { |e| e.response }).to eq ["[14356719955166949]"]
      expect(event.value.map { |e| e.message }).to eq [14356719955166949]
    end
  end


end

