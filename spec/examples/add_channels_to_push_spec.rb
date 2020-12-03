require "spec_helper"

describe Pubnub::AddChannelsToPush do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      subscribe_key: 'sub-a-mock-key',
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one"
    )

    @device_token = '815ee724ccb0a6a84dc303be8ccbaa00d1c84dde6bcae6721b08f92100951113'

    example.run_with_retry retry: 1
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: true, &@callback)

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: true, callback: @callback)

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: false)
      envelope = envelope.value

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: false, &@callback)
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "001_channel___demo1_demo2___push_gateway___apns___push_token__valid___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/add_channels_to_push/001", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns', channel: 'demo1,demo2', http_sync: false, callback: @callback)
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "002_channel___demo1_demo2___push_gateway___apns2___push_token__valid___topic__ruby_test___environment__default___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/add_channels_to_push/002", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns2', channel: 'demo1,demo2', topic: 'ruby_test', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "003_channel___demo1_demo2___push_gateway___apns2___push_token__valid___topic__ruby_test___environment__production___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/add_channels_to_push/003", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: @device_token, push_gateway: 'apns2', channel: 'demo1,demo2', topic: 'ruby_test', environment: 'production', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_channels_to_push)
    end
  end

  it "004_channel___demo1_demo2___push_gateway___apns2___push_token__invalid___topic__ruby_test___environment__production___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/add_channels_to_push/004", record: :once) do
      envelope = @pubnub.add_channels_to_push(push_token: "invalid_token", push_gateway: 'apns2', channel: 'demo1,demo2', topic: 'ruby_test', environment: 'production', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq true

      expect(envelope.status[:code]).to eq(400)
      expect(envelope.status[:operation]).to eq(:add_channels_to_push)
      expect(envelope.status[:category]).to eq(:error)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end
end
