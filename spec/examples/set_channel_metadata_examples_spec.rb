require "spec_helper"

describe Pubnub::HereNow do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: 'sub-a-mock-key',
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      random_iv: false
    )

    example.run_with_retry retry: 10
  end

  it "__channel__channel___metadata__name_some_name___include__custom___http_sync__true___cipher_key__nil___random_iv__false___callback__lambda_" do
    VCR.use_cassette("examples/channel_metadata/001", record: :once) do
      envelope = @pubnub.set_channel_metadata(
        channel: 'channel',
        metadata: { name: 'some_name' },
        include: { custom: true },
        http_sync: true,
        callback: @callback
      )

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@fired).to eq true
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_channel_metadata)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/').last).to eq("channel")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__channel___metadata__name_some_name___include__nil___http_sync__true___cipher_key__enigma___random_iv__false___callback__nil_" do
    VCR.use_cassette("examples/channel_metadata/002", record: :once) do
      pubnub = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: 'sub-a-mock-key',
        user_id: "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        random_iv: false,
        cipher_key: "enigma"
      )

      envelope = pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_channel_metadata)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/').last).to eq("channel")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__channel___metadata__name_some_name___include__nil___http_sync__true___cipher_key__enigma___random_iv__true___callback__nil_" do
    VCR.use_cassette("examples/channel_metadata/003", record: :once) do
      pubnub = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: 'sub-a-mock-key',
        user_id: "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        cipher_key: "enigma"
      )

      envelope = pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(pubnub.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_channel_metadata)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/').last).to eq("channel")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end
end
