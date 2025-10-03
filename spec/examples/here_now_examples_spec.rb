require 'helpers/spec_helper'

describe Pubnub::HereNow do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "demo",
      subscribe_key: "demo",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  it "__channel___demo___group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/29", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/27", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/28", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/26", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/24", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/25", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/23", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/21", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/22", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/20", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/18", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/19", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo___group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/35", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo___group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/33", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo___group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/34", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo___group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/32", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo___group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/30", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo___group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/31", record: :none) do
      envelope = @pubnub.here_now(channel: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/11", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/9", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/10", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/8", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/6", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/7", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/5", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/3", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/4", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/2", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/0", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/1", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => nil, :occupancy => nil, :total_occupancy => 1, :total_channels => 1, :channels => {"demo" => {"uuids" => ["ruby-test-uuid-client-one"], "occupancy" => 1}}})
    end
  end

  it "__channel___demo____group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/here_now/17", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/here_now/15", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/here_now/16", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/here_now/14", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/here_now/12", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel___demo____group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/here_now/13", record: :none) do
      envelope = @pubnub.here_now(channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({:uuids => ["ruby-test-uuid-client-one"], :occupancy => 1, :total_occupancy => nil, :total_channels => nil, :channels => nil})
    end
  end

  it "__channel__here_now_test_channel___group__nil___limit__2___http_sync__true_" do
    VCR.use_cassette("examples/here_now/36", record: :once) do
      envelope = @pubnub.here_now(channel: "here-now-test-channel", limit: 2, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
      expect(envelope.status[:client_request].query).to include("limit=2")
      expect(envelope.status[:client_request].query).to_not include("offset=0")

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({
                                             :occupancy => 4,
                                             :nextOffset => 2,
                                             :total_occupancy => nil,
                                             :total_channels => nil,
                                             :channels => nil,
                                             :uuids => envelope.result[:data][:uuids]
                                           })
    end
  end

  it "__channel__here_now_test_channel___group__nil___limit__10000___http_sync__true_" do
    VCR.use_cassette("examples/here_now/37", record: :once) do
      envelope = @pubnub.here_now(channel: "here-now-test-channel", limit: 10000, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
      expect(envelope.status[:client_request].query).to include("limit=1000")
      expect(envelope.status[:client_request].query).to_not include("offset=0")

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({
                                             :occupancy => 4,
                                             :nextOffset => nil,
                                             :total_occupancy => nil,
                                             :total_channels => nil,
                                             :channels => nil,
                                             :uuids => envelope.result[:data][:uuids]
                                           })
    end
  end

  it "__channels_test_channel_514_test_channel_56_test_channel_195___group__nil___limit__3___offset__2_4___http_sync__true_" do
    VCR.use_cassette("examples/here_now/38", record: :once) do
      channels_list = %w[test-channel-514 test-channel-56 test-channel-195]
      # Fetching first page.
      envelope = @pubnub.here_now(channels: channels_list, limit: 3, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
      expect(envelope.status[:client_request].query).to include("limit=3")
      expect(envelope.status[:client_request].query).to_not include("offset=0")

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({
                                             :occupancy => 12,
                                             :nextOffset => 3,
                                             :total_occupancy => 12,
                                             :total_channels => 3,
                                             :channels => envelope.result[:data][:channels],
                                             :uuids => nil
                                           })
      offset = envelope.result[:data][:nextOffset]
      channels = envelope.result[:data][:channels]

      # Fetching next page
      expect(offset).to eq(3)
      envelope = @pubnub.here_now(channels: channels_list, limit: 3, offset: offset, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
      expect(envelope.status[:client_request].query).to include("limit=3")
      expect(envelope.status[:client_request].query).to include("offset=#{offset}")

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({
                                             :occupancy => 12,
                                             :nextOffset => 6,
                                             :total_occupancy => 12,
                                             :total_channels => 3,
                                             :channels => envelope.result[:data][:channels],
                                             :uuids => nil
                                           })
      channels.each_pair do |channel_name, channel_data|
        channel_data['uuids'].each do |uuid|
          expect(envelope.result[:data][:channels][channel_name]['uuids']).not_to include(uuid)
        end
      end
      offset = envelope.result[:data][:nextOffset]
      channels = envelope.result[:data][:channels]


      # Fetching last page
      expect(offset).to eq(6)
      envelope = @pubnub.here_now(channels: channels_list, limit: 3, offset: offset, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})
      expect(envelope.status[:client_request].query).to include("limit=3")
      expect(envelope.status[:client_request].query).to include("offset=#{offset}")

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:here_now)
      expect(envelope.result[:data]).to eq({
                                             :occupancy => 12,
                                             :nextOffset => nil,
                                             :total_occupancy => 12,
                                             :total_channels => 3,
                                             :channels => envelope.result[:data][:channels],
                                             :uuids => nil
                                           })
      channels.each_pair do |channel_name, channel_data|
        channel_data['uuids'].each do |uuid|
          expect(envelope.result[:data][:channels][channel_name]['uuids']).not_to include(uuid)
        end
      end
    end
  end
end
