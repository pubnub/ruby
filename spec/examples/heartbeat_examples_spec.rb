require "spec_helper"

describe Pubnub::Heartbeat do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-c-b42cec2f-f468-4784-8833-dd2b074538c4",
      subscribe_key: "sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  it "__channel___demo___channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/29", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/27", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/28", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/26", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/24", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/25", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/23", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/21", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/22", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/20", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/18", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/19", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/35", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/33", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/34", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/32", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/30", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo___channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/31", record: :none) do
      envelope = @pubnub.heartbeat(channel: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/11", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/9", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/10", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/8", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/6", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/7", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/5", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/3", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/4", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/2", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/0", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/1", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/17", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/15", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/16", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/14", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/12", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel___demo____channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/13", record: :none) do
      envelope = @pubnub.heartbeat(channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/47", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/45", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/46", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/44", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/42", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/43", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/41", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/heartbeat/39", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/40", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/heartbeat/38", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/heartbeat/36", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end

  it "__channel__nil___channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/heartbeat/37", record: :none) do
      envelope = @pubnub.heartbeat(channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:heartbeat)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
    end
  end
end
