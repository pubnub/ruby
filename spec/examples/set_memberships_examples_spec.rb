require 'helpers/spec_helper'

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

  it "__uuid__nil___channels__channel___include__count___http_sync__true___cipher_key__nil___random_iv__false___callback__lambda_" do
    VCR.use_cassette("examples/memberships/001", record: :once) do
      @pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)
      @pubnub.set_uuid_metadata(uuid: nil, metadata: { name: 'magnum' }, http_sync: true)
      envelope = @pubnub.set_memberships(
        uuid: nil,
        channels: [{ channel: 'channel' }],
        include: { count: true },
        http_sync: true,
        callback: @callback
      )

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@fired).to eq true
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_memberships)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/')[-2]).to eq("ruby-test-uuid-client-one")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__uuid__bob___channels__channel___include__count___http_sync__true___cipher_key__nil___random_iv__false___callback__nil_" do
    VCR.use_cassette("examples/memberships/002", record: :once) do
      @pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)
      @pubnub.set_uuid_metadata(uuid: 'bob', metadata: { name: 'magnum' }, http_sync: true)
      envelope = @pubnub.set_memberships(
        uuid: 'bob',
        channels: [{ channel: 'channel' }],
        include: { count: true },
        http_sync: true
      )

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_memberships)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/')[-2]).to eq("bob")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__uuid__bob___channels__channel___include__nil___http_sync__true___cipher_key__enigma___random_iv__false___callback__nil_" do
    VCR.use_cassette("examples/memberships/003", record: :once) do
      @pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)
      @pubnub.set_uuid_metadata(uuid: 'bob', metadata: { name: 'magnum' }, http_sync: true)
      pubnub = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: 'sub-a-mock-key',
        user_id: "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        random_iv: false,
        cipher_key: "enigma"
      )

      envelope = pubnub.set_memberships(uuid: 'bob', channels: [{ channel: 'channel' }], http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_memberships)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/')[-2]).to eq("bob")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__uuid__bob___channels__channel___include__nil___http_sync__true___cipher_key__enigma___random_iv__true___callback__nil_" do
    VCR.use_cassette("examples/memberships/004", record: :once) do
      @pubnub.set_channel_metadata(channel: 'channel', metadata: { name: 'some_name' }, http_sync: true)
      @pubnub.set_uuid_metadata(uuid: 'bob', metadata: { name: 'magnum' }, http_sync: true)
      pubnub = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: 'sub-a-mock-key',
        user_id: "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        cipher_key: "enigma"
      )

      envelope = pubnub.set_memberships(uuid: 'bob', channels: [{ channel: 'channel' }], http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(pubnub.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:set_memberships)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:client_request].path.split('/')[-2]).to eq("bob")
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", auth_key: "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end
end
