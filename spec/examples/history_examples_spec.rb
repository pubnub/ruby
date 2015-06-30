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
    VCR.use_cassette('test_examples/history-7358_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6953_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1177_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6120_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4285_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3015_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4561_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3566_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4089_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-9650_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8804_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6348_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1206_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3656_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3697_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8755_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8675_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1798_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-6964_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7056_http_sync_true_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1368_http_sync_true_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-695_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1681_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8131_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1103_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8908_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1123_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-107_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6219_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2994_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7986_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5353_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3371_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1364_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9149_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7304_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-6421_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6735_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9640_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1601_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6325_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2534_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6366_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5519_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2198_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-2414_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6756_http_sync_true_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7242_http_sync_true_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5074_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3869_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3948_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-64_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6711_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9050_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-7673_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7554_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7049_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4103_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3841_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2268_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-65_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6338_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8724_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-2334_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4510_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6899_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-54_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4310_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4328_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1454_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9259_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7406_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-1579_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1078_http_sync_true_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6628_http_sync_true_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3849_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2090_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2204_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-535_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5580_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7909_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-3778_http_sync_true_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5364_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-846_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5474_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8523_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3127_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3110_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8749_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6987_http_sync_true_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-9085_http_sync_true_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6210_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1916_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8678_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9157_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6954_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9356_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1789_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1642_http_sync_true_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-6267_http_sync_true_callback_block_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9589_http_sync_true_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4130_http_sync_true_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2875_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4992_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-900_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6986_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9614_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4653_http_sync_true_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-8167_http_sync_true_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8540_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3677_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6531_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3240_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-477_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6949_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6004_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4431_http_sync_true_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-514_http_sync_true_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2546_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4240_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2105_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9739_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2501_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4357_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6434_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7862_http_sync_true_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-9145_http_sync_true_callback_block_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4725_http_sync_true_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-603_http_sync_true_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4710_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6593_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-807_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2759_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1788_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4601_http_sync_true_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-8655_http_sync_true_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5420_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1152_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8861_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-624_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6509_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6710_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6329_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9463_http_sync_true_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-249_http_sync_true_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3160_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9279_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1559_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9620_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7181_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5436_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-682_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6005_http_sync_true_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-1233_http_sync_true_callback_block_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8453_http_sync_true_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2433_http_sync_true_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8379_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2829_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8179_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3888_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7591_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3764_http_sync_true_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-2580_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-803_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1123_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6393_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7582_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6247_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-533_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9704_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3494_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-6107_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3250_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4280_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4483_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8850_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9981_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8276_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6074_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8481_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-7092_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3907_http_sync_true_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7111_http_sync_true_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-87_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-804_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8965_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6945_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6598_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1166_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-7088_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1826_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6109_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5179_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9490_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2760_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5519_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8532_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-318_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-7278_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2006_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5380_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5518_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6498_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2696_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5618_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4032_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1124_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-6800_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3904_http_sync_true_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9937_http_sync_true_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4457_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6297_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3247_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2484_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-17_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6023_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-147_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3050_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8414_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2852_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8930_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2479_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1759_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1149_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-6429_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5889_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9542_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5386_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4680_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8282_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9454_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4228_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2930_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-5195_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6579_http_sync_true_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4293_http_sync_true_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3261_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5663_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1403_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6107_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2480_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6176_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-1218_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2001_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1461_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-68_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-845_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6890_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2638_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-468_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4850_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-2252_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8730_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8035_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8105_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2801_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5519_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6137_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8044_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4653_http_sync_true_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-5883_http_sync_true_callback_parameter_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6064_http_sync_true_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5854_http_sync_true_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8521_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2507_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1914_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5450_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5290_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2828_http_sync_true_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-9650_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1912_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2039_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9713_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9663_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5033_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8474_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-916_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4914_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-2268_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7516_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5525_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1996_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2686_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-45_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6412_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6447_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2400_http_sync_true_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-5846_http_sync_true_callback_parameter_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2078_http_sync_true_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5084_http_sync_true_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-211_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2760_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-949_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3185_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-557_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6356_http_sync_true_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-3383_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1959_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3560_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7447_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9038_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2185_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-150_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9760_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3228_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-7740_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6195_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5337_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4776_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6480_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2009_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8397_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9348_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1998_http_sync_true_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-5450_http_sync_true_callback_parameter_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1654_http_sync_true_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1012_http_sync_true_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6160_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3642_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8505_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1545_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6252_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: true, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-39_http_sync_true_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => true, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-3357_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2978_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1651_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7515_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2967_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9910_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1467_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6405_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5193_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-700_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7380_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5476_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9699_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5470_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1499_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4022_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2308_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4721_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-8882_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2444_http_sync_false_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6444_http_sync_false_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2484_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2965_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8371_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9337_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1241_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6662_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-1410_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2952_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7043_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4052_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8181_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9434_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1245_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7423_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3086_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-9233_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4350_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8792_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9030_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-126_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1965_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-986_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1649_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8318_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-5734_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4243_http_sync_false_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8102_http_sync_false_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3829_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1690_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4130_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9660_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3459_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6933_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-1092_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3765_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5220_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4776_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7284_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8185_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5413_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7549_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6720_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-8011_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8547_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6864_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3712_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3225_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6157_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6100_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7953_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2229_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-7761_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4157_http_sync_false_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5954_http_sync_false_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1449_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3893_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1525_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2791_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3322_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9497_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-6269_http_sync_false_callback_block_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7745_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6979_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6416_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7845_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1514_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1460_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5693_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8200_http_sync_false_callback_block_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-2713_http_sync_false_callback_block_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-911_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7754_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-268_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5239_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-798_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6945_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1527_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6155_http_sync_false_callback_block_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-6702_http_sync_false_callback_block_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3580_http_sync_false_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5668_http_sync_false_callback_block_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9597_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7051_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3949_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1999_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6759_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2006_http_sync_false_callback_block_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-2611_http_sync_false_callback_block_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-982_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5970_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6354_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-852_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7656_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6433_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9617_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8302_http_sync_false_callback_block_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-8645_http_sync_false_callback_block_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2715_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6860_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9420_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2042_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3925_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6497_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3383_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6134_http_sync_false_callback_block_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-4650_http_sync_false_callback_block_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3385_http_sync_false_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1105_http_sync_false_callback_block_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-770_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4425_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1671_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2669_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8792_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9248_http_sync_false_callback_block_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-5844_http_sync_false_callback_block_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6683_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2665_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3047_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5589_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5654_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7121_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1883_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8799_http_sync_false_callback_block_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-4920_http_sync_false_callback_block_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7900_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9611_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5691_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4421_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5006_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5095_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-792_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-747_http_sync_false_callback_block_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-4815_http_sync_false_callback_block_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-756_http_sync_false_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2400_http_sync_false_callback_block_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5440_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9663_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4145_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7005_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2138_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362, &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: block, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8854_http_sync_false_callback_block_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362', &@callback)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-5727_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9744_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3970_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8498_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1776_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3121_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5462_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2589_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-805_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-102_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6148_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-574_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2334_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7613_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7793_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-803_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7966_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6864_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-2322_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1603_http_sync_false_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6113_http_sync_false_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6674_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2411_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6204_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7770_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5282_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4312_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-7548_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3627_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2076_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9701_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5568_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2459_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1749_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7902_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9448_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-9845_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-476_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2737_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4619_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8578_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8261_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1797_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5517_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8664_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-8558_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7918_http_sync_false_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1674_http_sync_false_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9328_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2141_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6794_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5554_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4951_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4499_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-5764_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6040_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8851_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3498_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-768_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7071_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3675_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9769_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4011_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-2248_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2915_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4761_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3051_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9924_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5109_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-793_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-325_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7890_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-8149_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5440_http_sync_false_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2250_http_sync_false_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6748_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2085_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7833_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9419_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9598_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9572_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => :channel, 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true' do
    VCR.use_cassette('test_examples/history-7501_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1193_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8602_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-1552_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4641_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1039_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5889_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6642_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5794_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false' do
    VCR.use_cassette('test_examples/history-9462_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7297_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7039_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5965_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8361_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3076_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5926_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3860_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6584_http_sync_false_callback_parameter_channel_channel_limit_1_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1' do
    VCR.use_cassette('test_examples/history-2847_http_sync_false_callback_parameter_channel_channel_limit_1', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5143_http_sync_false_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1957_http_sync_false_callback_parameter_channel_channel_limit_1_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4284_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2505_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9034_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8663_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3826_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 1, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1303_http_sync_false_callback_parameter_channel_channel_limit_1_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 1, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true' do
    VCR.use_cassette('test_examples/history-1069_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3174_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9374_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-7793_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2656_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-879_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9009_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5446_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6432_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false' do
    VCR.use_cassette('test_examples/history-1685_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2383_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6259_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2945_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-896_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-81_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-4722_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7257_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6736_http_sync_false_callback_parameter_channel_channel_limit_10_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10' do
    VCR.use_cassette('test_examples/history-2682_http_sync_false_callback_parameter_channel_channel_limit_10', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-749_http_sync_false_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2808_http_sync_false_callback_parameter_channel_channel_limit_10_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2959_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4288_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2631_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-6103_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9391_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 10, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7139_http_sync_false_callback_parameter_channel_channel_limit_10_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 10, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true' do
    VCR.use_cassette('test_examples/history-9925_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6673_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-703_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-3888_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7428_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-7627_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-2622_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3352_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: true, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-5171_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_true_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => true, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false' do
    VCR.use_cassette('test_examples/history-4612_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2179_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-3279_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-8688_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6246_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8512_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-9845_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-512_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, reverse: false, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-4022_http_sync_false_callback_parameter_channel_channel_limit_100_reverse_false_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'reverse' => false, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100' do
    VCR.use_cassette('test_examples/history-6305_http_sync_false_callback_parameter_channel_channel_limit_100', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6412_http_sync_false_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-2556_http_sync_false_callback_parameter_channel_channel_limit_100_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-5372_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-9969_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-6104_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => 14350501874493930, 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930' do
    VCR.use_cassette('test_examples/history-128_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-1579_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => 14350503487714362)
      expect(event.value.map { |e| e.message }).to eq []
    end
  end

  it 'http_sync: false, callback: parameter, channel: channel, limit: 100, start: 14350501874493930, end: 14350503487714362' do
    VCR.use_cassette('test_examples/history-8311_http_sync_false_callback_parameter_channel_channel_limit_100_start_14350501874493930_end_14350503487714362', record: :once) do
      event = @pubnub.history('http_sync' => false, 'callback' => :parameter, 'channel' => 'channel', 'limit' => 100, 'start' => '14350501874493930', 'end' => '14350503487714362')
      expect(event.value.map { |e| e.message }).to eq []
    end
  end


end

