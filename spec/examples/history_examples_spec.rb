require 'spec_helper'

describe Pubnub::History do
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

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000723', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000695', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000271', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000616', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000490', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000414', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000505', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000446', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000479', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000881', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000829', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000640', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000273', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000450', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000453', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000823', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000817', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000318', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000698', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000709', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000282', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000697', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000309', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000777', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000263', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000835', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000265', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000261', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000627', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000413', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000765', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000550', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000438', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000281', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000848', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000722', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000649', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000677', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000880', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000301', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000637', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000375', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000643', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000571', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000347', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000363', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000680', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000717', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000533', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000463', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000470', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000659', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000675', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000844', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000743', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000736', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000707', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000480', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000460', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000353', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000666', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000639', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000820', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000358', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000504', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000689', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000568', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000493', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000495', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000286', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000853', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000725', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000300', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000260', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000667', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000461', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000340', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000348', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000551', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000578', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000759', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000457', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000552', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000798', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000566', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000805', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000422', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000420', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000822', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000701', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000845', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000626', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000324', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000818', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000849', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000696', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000858', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000316', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000303', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000633', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000873', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000482', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000404', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000530', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000840', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000700', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000877', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000512', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000779', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000808', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000452', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000661', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000429', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000524', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000694', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000602', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000500', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000539', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000376', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000486', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000341', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000890', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000372', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000497', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000653', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000755', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000847', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000519', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000605', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000516', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000664', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000774', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000394', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000315', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000507', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000814', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000557', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000269', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000833', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000630', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000660', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000674', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000638', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000867', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000371', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000423', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000854', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000298', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000879', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000716', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000558', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000684', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000603', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000275', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000796', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000364', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000793', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000401', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000780', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000465', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000739', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000455', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000378', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000770', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000266', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000644', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000738', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000629', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000549', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000888', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000443', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000613', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000431', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000488', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000502', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000830', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000903', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000786', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000608', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000800', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000712', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000468', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000713', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000828', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000772', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000837', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000693', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000665', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000270', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000711', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000320', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000614', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000541', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000868', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000395', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000572', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000807', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000426', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000719', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000333', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000554', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000570', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000658', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000390', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000580', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000477', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000267', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000683', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000467', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000901', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000501', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000635', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000430', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000370', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000319', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000604', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000290', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000416', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000795', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000601', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000403', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000836', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000367', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000313', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000268', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000650', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000596', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000871', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000555', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000514', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000787', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000865', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000485', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000406', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000543', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000662', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000492', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000433', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000582', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000283', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000612', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000368', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000623', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000274', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000331', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000288', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000690', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000797', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000688', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000383', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000515', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000526', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000352', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000821', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000768', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000776', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000398', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000573', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000618', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000771', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000513', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000594', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000607', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000593', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000804', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000374', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000323', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000563', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000547', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000400', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000882', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000322', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000335', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000889', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000885', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000532', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000799', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000850', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000527', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000354', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000733', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000574', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000328', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000388', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000506', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000647', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000655', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000361', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000592', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000338', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000534', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000342', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000396', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000870', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000425', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000577', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000642', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000440', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000326', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000445', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000728', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000843', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000346', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000292', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000892', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000428', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000746', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000624', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000548', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000523', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000656', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000334', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000794', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000857', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000329', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000562', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000306', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000256', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000622', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000449', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000802', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000296', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000631', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000473', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000437', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000412', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000305', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000732', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000411', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000898', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000289', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000645', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000542', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000703', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000724', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000567', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000886', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000565', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000291', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000475', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000355', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000517', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000834', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000365', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000654', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000369', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000410', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000792', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000856', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000276', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000669', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000284', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000408', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000706', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000478', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000781', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000863', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000277', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000726', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000419', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000851', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000496', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000824', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000841', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000278', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000327', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000897', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000304', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000790', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000587', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000487', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000775', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000459', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000311', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000481', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000883', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000442', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000691', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000262', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000456', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000544', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000522', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000720', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000782', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000556', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000735', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000676', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000767', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000809', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000686', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000454', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000427', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000621', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000609', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000763', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000349', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000749', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000484', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000598', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000285', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000466', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000294', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000397', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000435', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000869', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000634', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000747', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000699', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000648', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000754', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000293', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000287', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000585', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000784', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000391', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000846', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000748', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000389', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000545', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000766', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000692', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000295', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000620', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000673', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000447', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000583', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000874', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000708', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000471', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000330', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000681', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000332', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000380', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000894', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000600', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000641', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000806', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000742', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000652', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000878', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000788', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000813', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000392', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000685', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000862', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000336', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000469', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000657', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000439', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000617', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000511', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000441', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000264', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000745', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000499', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000307', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000386', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000825', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000852', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000591', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000672', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000385', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000415', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000579', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000581', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000714', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000321', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000826', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000528', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000757', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000876', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000584', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000498', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000531', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000535', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000761', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000729', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000525', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000737', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000360', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000559', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000884', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000483', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000702', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000343', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000832', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000586', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000891', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000472', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000801', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000314', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000421', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000564', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000379', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000773', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000257', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000619', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000588', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000357', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000740', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000752', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000769', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000764', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000687', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000356', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000302', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000615', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000671', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000625', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000750', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000546', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000494', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000734', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000448', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000337', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000887', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000576', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000366', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000312', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000758', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000864', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000896', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000521', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000393', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000509', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000811', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000785', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000317', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000569', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000816', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000810', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000760', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000308', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000855', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000344', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000682', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000575', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000529', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000503', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000589', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000606', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000831', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000444', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000744', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000710', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000451', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000893', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000474', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000350', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000405', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000520', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000417', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000899', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000536', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000762', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000432', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000756', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000778', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000560', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000351', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000679', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000339', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000753', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000861', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000875', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000872', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/1000731', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000272', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000812', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000297', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000510', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000258', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000595', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000668', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000590', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/1000866', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000721', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000704', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000599', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000791', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000418', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000597', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000462', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000663', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/1000402', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000538', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000325', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000489', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000373', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000842', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000815', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000458', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000280', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/1000259', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000424', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000859', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000751', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000384', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000827', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000839', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000561', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000651', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/1000310', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000359', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000632', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000407', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000838', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000783', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000518', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000718', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000678', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/1000387', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000730', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000399', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000409', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000491', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000382', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000610', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000860', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000715', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/1000900', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000670', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000705', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000464', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000727', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000741', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000381', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000436', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000540', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/1000508', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000345', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000434', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000819', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000628', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000803', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000895', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000537', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000476', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/1000636', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000646', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000377', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000553', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000902', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000611', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/1000279', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000299', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/1000789', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end


end

