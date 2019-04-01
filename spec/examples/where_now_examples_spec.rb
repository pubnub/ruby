require "spec_helper"

describe Pubnub::WhereNow do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  it "__uuid___ruby-test-uuid____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/where_now/5", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end

  it "__uuid___ruby-test-uuid____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/where_now/3", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end

  it "__uuid___ruby-test-uuid____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/where_now/4", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end

  it "__uuid___ruby-test-uuid____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/where_now/2", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end

  it "__uuid___ruby-test-uuid____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/where_now/0", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end

  it "__uuid___ruby-test-uuid____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/where_now/1", record: :none) do
      envelope = @pubnub.where_now(uuid: "ruby-test-uuid", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:where_now)
      expect(envelope.result[:data]).to eq({"channels" => []})
    end
  end
end
