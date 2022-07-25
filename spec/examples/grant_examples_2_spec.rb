require "spec_helper"

describe Pubnub::Grant do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      secret_key: "sec-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/21", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188069"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HGXIV3RlTUbLW7QqvMSMnGa2YjC_uegyU9TaspCV07s="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/22", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188070"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Vd4o4dbnZ7rn9z_hUFbBY1BcIl8cWut5h_w9-a9CPcA="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/20", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188070"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Vd4o4dbnZ7rn9z_hUFbBY1BcIl8cWut5h_w9-a9CPcA="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/18", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188071"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DoIargOS07VFfc5PBf-JMJZdXQ5YsawsiGdvYaAnR_M="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/19", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188071"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DoIargOS07VFfc5PBf-JMJZdXQ5YsawsiGdvYaAnR_M="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/29", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188072"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cneNp2ESiSS2vrvfV0g_qp_aB-HtH_X3k4UtwojAWzk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/27", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188072"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cneNp2ESiSS2vrvfV0g_qp_aB-HtH_X3k4UtwojAWzk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/28", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188073"
      Pubnub::Grant.any_instance.stub(:signature).and_return "w9cGp6enPxaPWlMyJvGa0KDD7Jt-DGJUR7IcR9LVM1I="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/26", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188073"
      Pubnub::Grant.any_instance.stub(:signature).and_return "w9cGp6enPxaPWlMyJvGa0KDD7Jt-DGJUR7IcR9LVM1I="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/24", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188074"
      Pubnub::Grant.any_instance.stub(:signature).and_return "AcoAi8XPc99UA-AgwUu_5f2nhCMGw9f3xB0C2TJVR6Q="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/25", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188075"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-DURpzVUgoTJfnnX-F2TROlnMubSirw__uKWL93g-fQ="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/35", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188075"
      Pubnub::Grant.any_instance.stub(:signature).and_return "VhVH0xn5pS5ZKlBjgp2t3P0hDQ1nToHSU_paYB70l3I="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/33", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188076"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kIOeA_hgn6EXXOrDvR4xaT61B4UCSafUssPUxgvAjxk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/34", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188076"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kIOeA_hgn6EXXOrDvR4xaT61B4UCSafUssPUxgvAjxk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/32", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188077"
      Pubnub::Grant.any_instance.stub(:signature).and_return "XUqHqwRAmY5d7ftuA6x_aPoKjLYeEzNQHQIPYElRt6k="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/30", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188077"
      Pubnub::Grant.any_instance.stub(:signature).and_return "XUqHqwRAmY5d7ftuA6x_aPoKjLYeEzNQHQIPYElRt6k="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/31", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188078"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xHJrW3a25oMwzDSmN0OuDe1Fkg4nEcw1Eg6Fkge3Z5w="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, manage: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/41", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188078"
      Pubnub::Grant.any_instance.stub(:signature).and_return "P-ol7w2SrPub6-H0G_wcqepDshpzxK67Ma7BUG28JH4="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/39", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188079"
      Pubnub::Grant.any_instance.stub(:signature).and_return "OkcRDbTkiEmoEM4PbyhmoUY48ALbCGYFiaBC-kYMSss="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/40", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188079"
      Pubnub::Grant.any_instance.stub(:signature).and_return "OkcRDbTkiEmoEM4PbyhmoUY48ALbCGYFiaBC-kYMSss="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/38", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188080"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IHBTIQ5xObXBfl5r6aP3v2XQjMAGlorYHbZCCSiNQ5g="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/36", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188081"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xdpq-Rr5sSZ4Q7EfPRe_hnxMmDVoh8MExQDpoqAMPgk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/37", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188081"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xdpq-Rr5sSZ4Q7EfPRe_hnxMmDVoh8MExQDpoqAMPgk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/47", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188082"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qZBKKv-xjOLGV42je9W-tZZQl1QaTCuTCHZTDYx-wNE="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/45", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188082"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qZBKKv-xjOLGV42je9W-tZZQl1QaTCuTCHZTDYx-wNE="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/46", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188083"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hS_PwqDvY0XUe4u3V2QNMwokZbUTo0-T47RfaQesJaE="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/44", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188083"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hS_PwqDvY0XUe4u3V2QNMwokZbUTo0-T47RfaQesJaE="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/42", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188084"
      Pubnub::Grant.any_instance.stub(:signature).and_return "i7fco65dr6y4PnX9fP9s84FeWvf0RgRLUFCA_A72Rcw="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/43", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188084"
      Pubnub::Grant.any_instance.stub(:signature).and_return "i7fco65dr6y4PnX9fP9s84FeWvf0RgRLUFCA_A72Rcw="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/53", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188085"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0FCEsEN7FK6Kz3vi4c_QHz4vnPKSZWleI7J-spQbpdg="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/51", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188085"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0FCEsEN7FK6Kz3vi4c_QHz4vnPKSZWleI7J-spQbpdg="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/52", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188086"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Av-kv19bu3-yJ8PXRWKbkBiwiBNK9LMvP11FbMiolXQ="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/50", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188087"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8zrK8uHRCTYCKblTEofF6-FJrderYziGobGD9naWaug="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/48", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188087"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8zrK8uHRCTYCKblTEofF6-FJrderYziGobGD9naWaug="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/49", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188088"
      Pubnub::Grant.any_instance.stub(:signature).and_return "6Thok8KJKYn6mXNxxzgRTQNVyj1Sz0fgdAhAN33SjJg="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/59", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188088"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ABkAIjSdzMWLHunbymbu2S4SBCEGWuMkwlsil_i0hnc="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/57", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188089"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_s6QOKJhG9cxFAaFQVC28rn9BA1KQHltoVWIkdvj4aU="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/58", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188089"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_s6QOKJhG9cxFAaFQVC28rn9BA1KQHltoVWIkdvj4aU="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/56", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188090"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DdWtshevLGwgpfgzgaYRhS38Al75eyKuSP8UY7Xeq8M="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/54", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188090"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DdWtshevLGwgpfgzgaYRhS38Al75eyKuSP8UY7Xeq8M="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/55", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188091"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ApmGB2jQ-UOzQXFEMdxJUqLhxGQEghICpbS0m5MjxTQ="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/65", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188091"
      Pubnub::Grant.any_instance.stub(:signature).and_return "F0SvctSp46owlBuwyWst9tdd8SRdURH6UdZ-HLXANU8="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/63", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188092"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Fpl4Nn9IGOqa1wZJo8OZOeiVvwLp6DSz320FEaS2iHo="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/64", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188092"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Fpl4Nn9IGOqa1wZJo8OZOeiVvwLp6DSz320FEaS2iHo="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/62", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188093"
      Pubnub::Grant.any_instance.stub(:signature).and_return "p0i476avkv8MjNvIyxTm3x2sDdq95HptDzi3kvG_C5E="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/60", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188094"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MBBK_2eTD6Jc2ZhQ3HzeTnq44h-gIAoiMPkWeuV-MjI="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/61", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188094"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MBBK_2eTD6Jc2ZhQ3HzeTnq44h-gIAoiMPkWeuV-MjI="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/71", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188095"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hvDm9hLKLmCQIuVBmhmxgc8qLLZjv1n4k5kriQKagmU="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/69", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188095"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hvDm9hLKLmCQIuVBmhmxgc8qLLZjv1n4k5kriQKagmU="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/70", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188096"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0LbHlJLvLf0GQWvxmyAKk5wwBBKPg6md7zH3qNZzgMw="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/68", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188096"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0LbHlJLvLf0GQWvxmyAKk5wwBBKPg6md7zH3qNZzgMw="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/66", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188097"
      Pubnub::Grant.any_instance.stub(:signature).and_return "C7EVzCjsi-iyrmNg7f1gmzyFVwPjcPK3wOoDM3x2Isk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/67", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188097"
      Pubnub::Grant.any_instance.stub(:signature).and_return "C7EVzCjsi-iyrmNg7f1gmzyFVwPjcPK3wOoDM3x2Isk="
      envelope = @pubnub.grant(channel: "demo", read: false, write: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/185", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188098"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HjzXjtm8Q1HQfyTuGzKBNxaiwAAvFL_bfJGtC_6P0r4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/183", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188098"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HjzXjtm8Q1HQfyTuGzKBNxaiwAAvFL_bfJGtC_6P0r4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/184", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188099"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BcdTv6-ec6jA10hKhF3gqO2qbYTV6_rUSYoOhZlk4jM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/182", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188099"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BcdTv6-ec6jA10hKhF3gqO2qbYTV6_rUSYoOhZlk4jM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/180", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188100"
      Pubnub::Grant.any_instance.stub(:signature).and_return "slIpkHCWjp8oehx3-8hwFCX3fAsAk0NJSLLK6kyuqJI="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/181", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188100"
      Pubnub::Grant.any_instance.stub(:signature).and_return "slIpkHCWjp8oehx3-8hwFCX3fAsAk0NJSLLK6kyuqJI="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/191", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188101"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2-wqMYp0EMoGJF6WCS5POokWThz2-7cs36IJkCCrqU0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/189", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188101"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2-wqMYp0EMoGJF6WCS5POokWThz2-7cs36IJkCCrqU0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/190", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188102"
      Pubnub::Grant.any_instance.stub(:signature).and_return "swTtFK_oyQAem1g4TYN15YJmecgy7p6XC3yabOWzLII="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/188", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188103"
      Pubnub::Grant.any_instance.stub(:signature).and_return "n1mdxIrQ4pwNtFmv_me_243agsn5nauXdnYOHCc1l-4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/186", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188103"
      Pubnub::Grant.any_instance.stub(:signature).and_return "n1mdxIrQ4pwNtFmv_me_243agsn5nauXdnYOHCc1l-4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/187", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188104"
      Pubnub::Grant.any_instance.stub(:signature).and_return "QqJQglgHHh16MBilj1KoZV6sflKtgPpo2eaFqWahcig="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/197", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188104"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DKKSLnhhR2XXFsms3mTdzZY0r3xVQFJd8wthaBjwKtY="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/195", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188105"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BmRFJrU4P-vnN83P2-A3lIVMfZq1uCPQsHG05Gz9V7Y="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/196", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188105"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BmRFJrU4P-vnN83P2-A3lIVMfZq1uCPQsHG05Gz9V7Y="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/194", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188106"
      Pubnub::Grant.any_instance.stub(:signature).and_return "b810SyMljXRbFV9dCw_BkzeXiVURRG02gqqd1lXgvjM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/192", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188106"
      Pubnub::Grant.any_instance.stub(:signature).and_return "b810SyMljXRbFV9dCw_BkzeXiVURRG02gqqd1lXgvjM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/193", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188107"
      Pubnub::Grant.any_instance.stub(:signature).and_return "47NmRNdaBSeL9BvUG3SlkTl8eSHcrRJmp9rLxuVa058="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/203", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188107"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MU-Kx_LcjlYIL99nL4E-Q57CIjlZn0L-70gyamgq0sM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/201", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188108"
      Pubnub::Grant.any_instance.stub(:signature).and_return "g6-2dTqXDuNAyFXWdFTeY2Z8izwaL_Dble83mvaHtf0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/202", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188108"
      Pubnub::Grant.any_instance.stub(:signature).and_return "g6-2dTqXDuNAyFXWdFTeY2Z8izwaL_Dble83mvaHtf0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/200", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188109"
      Pubnub::Grant.any_instance.stub(:signature).and_return "srjUZIU0qhRe2QRWCNnzugMXePWxTFCFyjRpsrbuHVQ="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/198", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188109"
      Pubnub::Grant.any_instance.stub(:signature).and_return "srjUZIU0qhRe2QRWCNnzugMXePWxTFCFyjRpsrbuHVQ="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/199", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188110"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8Xh_Jw6jzaR53hJ7YhyGHlZoDOviExSW1Qbfhtg09xM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/209", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188110"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kAOk3PO8i3pK7UTHjnW081j_J-1RzxSqaQVwC-JwQdQ="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/207", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188111"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eNm443rIgvX8EWmJQxvNIv_rM9-lQzLt3pxYSjqveyM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/208", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188112"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cjfHp2oN98C8KsyFlZkNQ_mSCiCGonQMtxiaRmrKapw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/206", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188112"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cjfHp2oN98C8KsyFlZkNQ_mSCiCGonQMtxiaRmrKapw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/204", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188113"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5mxPLF7usF1Ii6Rqbk_dHECKTPIlmP5WaqK1dBlCsCw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/205", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188113"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5mxPLF7usF1Ii6Rqbk_dHECKTPIlmP5WaqK1dBlCsCw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/215", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188114"
      Pubnub::Grant.any_instance.stub(:signature).and_return "AiWkp39IZ4tQ2pFi8gzbpxNVI2YlDfgrcExfBd0TdT0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/213", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188114"
      Pubnub::Grant.any_instance.stub(:signature).and_return "AiWkp39IZ4tQ2pFi8gzbpxNVI2YlDfgrcExfBd0TdT0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/214", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188115"
      Pubnub::Grant.any_instance.stub(:signature).and_return "wTRajBaWF7lhnQsPvR_LNIsVT25tRksEeLlHIVC0zzU="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/212", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188115"
      Pubnub::Grant.any_instance.stub(:signature).and_return "wTRajBaWF7lhnQsPvR_LNIsVT25tRksEeLlHIVC0zzU="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/210", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188116"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xF794kakC9l8BzUnwuNzn8A-7yiiSVvr-8I9qqoceL8="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/211", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188116"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xF794kakC9l8BzUnwuNzn8A-7yiiSVvr-8I9qqoceL8="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/113", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188117"
      Pubnub::Grant.any_instance.stub(:signature).and_return "uPzZIqr5MXAVJSNzSBYr3cba-PF6jzYzPnXmDH6fzhI="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/111", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188118"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zc6SKdS51QSXPsq_qIfYpnZaEDdUocgEbPi8il4Rst4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/112", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188118"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zc6SKdS51QSXPsq_qIfYpnZaEDdUocgEbPi8il4Rst4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/110", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188119"
      Pubnub::Grant.any_instance.stub(:signature).and_return "D5598q2tVPe_qZC_uBynCZ7Y1XJeDpc40NnvItx_ah4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/108", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188119"
      Pubnub::Grant.any_instance.stub(:signature).and_return "D5598q2tVPe_qZC_uBynCZ7Y1XJeDpc40NnvItx_ah4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/109", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188120"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zHEeCkdfTOhttube3aD-JQELfmykCzaCxt6NkG4MGG4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/119", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188120"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_CQNWDuI90uvDm9imS2myKOKF-epftS0NTUVBXF9C9s="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/117", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188121"
      Pubnub::Grant.any_instance.stub(:signature).and_return "jL-HzimKonWstrWODyeC1cj94VyWQsT0QfNeESTJKJY="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/118", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188121"
      Pubnub::Grant.any_instance.stub(:signature).and_return "jL-HzimKonWstrWODyeC1cj94VyWQsT0QfNeESTJKJY="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/116", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188122"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9YdNFUsf2iJYzZZyt3uDFaUnNETgI_zrWqGfBo2Pgbc="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/114", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188122"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9YdNFUsf2iJYzZZyt3uDFaUnNETgI_zrWqGfBo2Pgbc="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/115", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188123"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eWfAWZTitF5NKfh-amZLUZLkO0vJ7ccbjvXNb_6NM3o="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/125", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188123"
      Pubnub::Grant.any_instance.stub(:signature).and_return "OCOl1IRWMKm6QdaacicXGGaHXw3x4JQp4LaWxUxrOeg="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/123", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188124"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PPp-c-ikqOqvSK8RW97Ni1q9E7uWaVGPPXTXJEtIQqs="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/124", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188125"
      Pubnub::Grant.any_instance.stub(:signature).and_return "3X-MYYw4eFg4mNyok4fDRWYKcMznPnZp13b39zJun4s="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/122", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188126"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2CQV6lkRXFL0qCkeYFAqDZa1qyud8biCQec-3BfKBwE="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/120", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188127"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Chwy8JicsUCZ59j8FKWI90g7uar-ZLHTS1UNZWTek5s="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/121", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188127"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Chwy8JicsUCZ59j8FKWI90g7uar-ZLHTS1UNZWTek5s="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/131", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188128"
      Pubnub::Grant.any_instance.stub(:signature).and_return "c4k6OKw2WpqYXW1cgIBcy5XHgAKpqWsVkFGHlPQNkvA="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/129", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188128"
      Pubnub::Grant.any_instance.stub(:signature).and_return "c4k6OKw2WpqYXW1cgIBcy5XHgAKpqWsVkFGHlPQNkvA="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/130", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188129"
      Pubnub::Grant.any_instance.stub(:signature).and_return "LZd6KM-j76hbEaRyzozY7Ert5S9Nq8SD_HMM9CwFZIE="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/128", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188130"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JeVkt376RqhL_5k7axirVFDPJxc_x-ItL45zrO6d8V0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/126", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188130"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JeVkt376RqhL_5k7axirVFDPJxc_x-ItL45zrO6d8V0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/127", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188131"
      Pubnub::Grant.any_instance.stub(:signature).and_return "y65JBbezx3phyazoB3B7OWb2tSYoH7m357yH3h61uxg="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/137", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188131"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ieC62QEilIQGP04ums2PWSUaqo8jNT-JgRlX4kYyYrU="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/135", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188132"
      Pubnub::Grant.any_instance.stub(:signature).and_return "y-HmtyaW2GLhg6wbANNrVWdmJCesLXjkt-CfZo4cyj4="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/136", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188133"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xoqOohJ0yRNjfnS-cT7UbMvgtMxfuhfxevGsWPARYRw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/134", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188133"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xoqOohJ0yRNjfnS-cT7UbMvgtMxfuhfxevGsWPARYRw="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/132", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188134"
      Pubnub::Grant.any_instance.stub(:signature).and_return "3mJ_4LrbC-icOM-9tE1W15lL_jvz62aQwG9f4sup1Yo="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/133", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188134"
      Pubnub::Grant.any_instance.stub(:signature).and_return "3mJ_4LrbC-icOM-9tE1W15lL_jvz62aQwG9f4sup1Yo="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/143", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188135"
      Pubnub::Grant.any_instance.stub(:signature).and_return "VDJezdhU6HykKfLg5WbsgDJrnd_zlOeHJUC9HxXp7BM="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/141", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188136"
      Pubnub::Grant.any_instance.stub(:signature).and_return "p3F1-QZfsnWkSb3qr6cIbl7j8jN936Im9qzgkun3II0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/142", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188136"
      Pubnub::Grant.any_instance.stub(:signature).and_return "p3F1-QZfsnWkSb3qr6cIbl7j8jN936Im9qzgkun3II0="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/140", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188137"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7l-f9hLqG_ulMdEgEWFsEaEMlAXiGNoUvWIDSd7W29g="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/138", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188138"
      Pubnub::Grant.any_instance.stub(:signature).and_return "TOsNuBKmZ4bhzqR8hr7bVVC1wUV2X6N5-gz81ef8ExU="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/139", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188138"
      Pubnub::Grant.any_instance.stub(:signature).and_return "TOsNuBKmZ4bhzqR8hr7bVVC1wUV2X6N5-gz81ef8ExU="
      envelope = @pubnub.grant(channel: "demo", read: false, manage: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/149", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188139"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eJxeIKFLtiGzKHljrI08tIgoWHVOuL52Ac45osBdQN8="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/147", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188139"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eJxeIKFLtiGzKHljrI08tIgoWHVOuL52Ac45osBdQN8="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/148", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188140"
      Pubnub::Grant.any_instance.stub(:signature).and_return "FJTxlj8HhP59RoPcscPRkpTQ8dmgEkh07eDcALtsL9Y="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/146", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188140"
      Pubnub::Grant.any_instance.stub(:signature).and_return "FJTxlj8HhP59RoPcscPRkpTQ8dmgEkh07eDcALtsL9Y="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/144", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188141"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bISTyCmlCyW703o5v3oWWdiIFGEncxoUiCFGf5-7MsM="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/145", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188142"
      Pubnub::Grant.any_instance.stub(:signature).and_return "NGlTROHWWm3HD6QW4YOCw1duLNJ4EEDg5_4CQlfMTYM="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/155", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188142"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8YRJxh2-PtXXVgpzyiJ3xJPWZhnlnC16sXtYFOBqcaw="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/153", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188143"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8UCuku1fa0OS5aiIh-kKgmBufGq1476R6qWlk5n3eL4="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/154", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188143"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8UCuku1fa0OS5aiIh-kKgmBufGq1476R6qWlk5n3eL4="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/152", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188144"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MY1SKSnLfYTnK82s651qRlGBgsEKGpokQPhi7q6VQ8o="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/150", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188144"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MY1SKSnLfYTnK82s651qRlGBgsEKGpokQPhi7q6VQ8o="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/151", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188145"
      Pubnub::Grant.any_instance.stub(:signature).and_return "W-H7TLUpMQ4XhB2JbwMKlS0wISDpP1R_76ZyfKFG6_8="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/161", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188146"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ht8btfcnC3CaWVajsoIu5wQfIFPzqQpU-iDqevEGKfA="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/159", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188146"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ht8btfcnC3CaWVajsoIu5wQfIFPzqQpU-iDqevEGKfA="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/160", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188147"
      Pubnub::Grant.any_instance.stub(:signature).and_return "mWws2P4eG9YZ6e2A8UqOE7dSECyHKBlBU-LxU4Z6wao="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/158", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188147"
      Pubnub::Grant.any_instance.stub(:signature).and_return "mWws2P4eG9YZ6e2A8UqOE7dSECyHKBlBU-LxU4Z6wao="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/156", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188148"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Fke2P-M-4RyOJ6AxrfsrYn7TcGa9DVmzAh3F1Cl4AmM="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/157", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188149"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PnevhhbegGaS7HKeFdgAhwA-Xhq5Q0P7buK4Qiq1li4="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/167", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188149"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UPrJliawc6NJkBprRYpdvNezVxkXU3W6er3WtE8M2Lc="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/165", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188150"
      Pubnub::Grant.any_instance.stub(:signature).and_return "tYFsG84i5MTc-wmBXNwjz6sUoK30qZANOl9-NrA8RVo="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/166", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188151"
      Pubnub::Grant.any_instance.stub(:signature).and_return "movrA0D5nJHyShcaFDnbt4wwPp9ggoT-ux_-h-7owsw="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/164", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188151"
      Pubnub::Grant.any_instance.stub(:signature).and_return "movrA0D5nJHyShcaFDnbt4wwPp9ggoT-ux_-h-7owsw="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/162", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188152"
      Pubnub::Grant.any_instance.stub(:signature).and_return "aAacL7LXpmzEyhzxe-8htStRO5uW_EAz1yxIXdPpx0U="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/163", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188153"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ElFDb3VA00spzuXc8ojd40UPyVJp11hyFsoQxDsJQNQ="
      envelope = @pubnub.grant(channel: "demo", read: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/173", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188153"
      Pubnub::Grant.any_instance.stub(:signature).and_return "gMyLVKvV5w-w4bmS8COeHv_ekt_TcfBSg6DrdBVbfk8="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/171", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188154"
      Pubnub::Grant.any_instance.stub(:signature).and_return "etMRzx2Zun9CZUx6gKQAFX_hGhwdXGp-1_D6DyCdJeI="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/172", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188154"
      Pubnub::Grant.any_instance.stub(:signature).and_return "etMRzx2Zun9CZUx6gKQAFX_hGhwdXGp-1_D6DyCdJeI="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/170", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188155"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yRx4Cw4wtO5s_uhhCc1bO4fq1_lYw8nDlDFO_f9t8wk="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/168", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188155"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yRx4Cw4wtO5s_uhhCc1bO4fq1_lYw8nDlDFO_f9t8wk="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/169", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188156"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_Ujiw6dpww3seQcw_NVPPkwJzAwYjQD_SwnHGr8gWe4="
      envelope = @pubnub.grant(channel: "demo", read: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/179", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188157"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UxZX3RrY8s3i1fnjKkcxHdPWhQGeXflTLO6OUiQTZ4A="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/177", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188157"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UxZX3RrY8s3i1fnjKkcxHdPWhQGeXflTLO6OUiQTZ4A="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/178", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188158"
      Pubnub::Grant.any_instance.stub(:signature).and_return "In4_0ABxbSI1MYPczxpPE1am-W2VpYAixk0rbxa3_DI="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/176", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188158"
      Pubnub::Grant.any_instance.stub(:signature).and_return "In4_0ABxbSI1MYPczxpPE1am-W2VpYAixk0rbxa3_DI="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/174", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188159"
      Pubnub::Grant.any_instance.stub(:signature).and_return "nuo_nzdQjLxSpAaOLTlDmDYgWqqAAqBj1CyuKQS7lLY="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__false___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/175", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188160"
      Pubnub::Grant.any_instance.stub(:signature).and_return "aR3hFPzHT4ZJrvfAMCLqEi1caHamtLnliFBZx8-AETo="
      envelope = @pubnub.grant(channel: "demo", read: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 0, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/617", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188160"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_VIeSPCgF9BrmdiVa47iDMaJeN6wJAKggZM93KOQTr4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/615", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188161"
      Pubnub::Grant.any_instance.stub(:signature).and_return "rFisaHoIjhtf22xKJTDRx96QxiNMikHAIRFHSjf4UvI="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/616", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188161"
      Pubnub::Grant.any_instance.stub(:signature).and_return "rFisaHoIjhtf22xKJTDRx96QxiNMikHAIRFHSjf4UvI="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/614", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188162"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CY4vFAxkCuXiDVxizII7Htuzf1AGlgKPfD5WTnoTRX4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/612", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188162"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CY4vFAxkCuXiDVxizII7Htuzf1AGlgKPfD5WTnoTRX4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/613", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188163"
      Pubnub::Grant.any_instance.stub(:signature).and_return "LSIKNS9izEjd1w6Yc6U4SUNRvm5kCe_QIjVrZqocywc="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/623", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188164"
      Pubnub::Grant.any_instance.stub(:signature).and_return "FYKJx-SLLSn0-RAGQKiiGZdykHq7kxHDHNV2mvmCpE8="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/621", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188165"
      Pubnub::Grant.any_instance.stub(:signature).and_return "O-DkRHTazvdNgsM5cRbz4iAFRcJifLfEMytcZXrLZd0="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/622", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188165"
      Pubnub::Grant.any_instance.stub(:signature).and_return "O-DkRHTazvdNgsM5cRbz4iAFRcJifLfEMytcZXrLZd0="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/620", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188166"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zZmHLGy2PWGOb8JgZ58YmFPoHlnYlmm7S8JGOzGqzVs="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/618", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188166"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zZmHLGy2PWGOb8JgZ58YmFPoHlnYlmm7S8JGOzGqzVs="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/619", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188167"
      Pubnub::Grant.any_instance.stub(:signature).and_return "FBqFZXPguTpq9sVbkQCvlC6edgXWbVE9LyaJljwoWw0="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/629", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188168"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Pjdt0Lcf--JabeThSOfhUGcTylZvqbtWbwx05-XhfVg="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/627", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188168"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Pjdt0Lcf--JabeThSOfhUGcTylZvqbtWbwx05-XhfVg="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/628", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188169"
      Pubnub::Grant.any_instance.stub(:signature).and_return "4s5og1_idvKlDuFcdO8l6cK9U7J04KQ-mOqZSLO-o7k="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/626", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188169"
      Pubnub::Grant.any_instance.stub(:signature).and_return "4s5og1_idvKlDuFcdO8l6cK9U7J04KQ-mOqZSLO-o7k="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/624", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188170"
      Pubnub::Grant.any_instance.stub(:signature).and_return "lqjXdTkXNbmnT7XvoKwVManJDFQHpOhaFEFAtL9DWAQ="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/625", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188171"
      Pubnub::Grant.any_instance.stub(:signature).and_return "XQhHhqx5I1sCw8KWrhZT7XdAD5-a5jI0PNrlWUgCfWU="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/635", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188171"
      Pubnub::Grant.any_instance.stub(:signature).and_return "oeUS2V61AXZHnpulOifZ5NF4saBbx-zMDWTYbZnBJEU="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/633", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188172"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5XOHX5Xr91sTPnxrv7PhiY-7QalrrdYNDvsxo4QUKv4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/634", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188173"
      Pubnub::Grant.any_instance.stub(:signature).and_return "X7juCtEXP7UsKbzQ2ffdFH-MWGkBt4tT4TmS7S9Wk1g="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/632", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188174"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ihc7daLIaUQAUVHmwrMw_DuGOmT5Ro9bLhV47C3pynM="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/630", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188174"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ihc7daLIaUQAUVHmwrMw_DuGOmT5Ro9bLhV47C3pynM="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/631", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188175"
      Pubnub::Grant.any_instance.stub(:signature).and_return "th53MO5igW5swxizEtTH7FqeIM70rN1ZvnjUwQrgf_M="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/641", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188175"
      Pubnub::Grant.any_instance.stub(:signature).and_return "x9pVKjVJlIVIk4kZAW6mgoeFWiB4B7DL45KY5udkVNw="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/639", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188176"
      Pubnub::Grant.any_instance.stub(:signature).and_return "EpF_HUEGZTdmQ94aRpRNVSAq0qSEQj7yU0xDcc5A8VQ="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/640", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188176"
      Pubnub::Grant.any_instance.stub(:signature).and_return "EpF_HUEGZTdmQ94aRpRNVSAq0qSEQj7yU0xDcc5A8VQ="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/638", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188177"
      Pubnub::Grant.any_instance.stub(:signature).and_return "rrOCYjP3nW3m0PEk65bmz8nRPFJM-1VnY2HxJWEu6no="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/636", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188178"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7HpqYR11PrjHAifmLY3pGIp1oBZp8ppVhlInDU15408="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/637", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188178"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7HpqYR11PrjHAifmLY3pGIp1oBZp8ppVhlInDU15408="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/647", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188179"
      Pubnub::Grant.any_instance.stub(:signature).and_return "M_bfZXF14bCkF5y9twoV0fa7A-t18Tpv4n6Jqd2fuCs="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/645", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188180"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ytymleANFemmDlvkLyFye8_SjzibmtiB08rB9QHMQ2M="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/646", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188181"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IggxQZCUxEfFnXxyrKOTTsjAuIF0YeRBeFWtulvVE2c="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/644", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188181"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IggxQZCUxEfFnXxyrKOTTsjAuIF0YeRBeFWtulvVE2c="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/642", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188182"
      Pubnub::Grant.any_instance.stub(:signature).and_return "VaEANDu0eOpJcz4p8DH_iHb9lvtCUoj8fnkQVPCrO5U="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/643", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188183"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0MayR2QK3vtQxNjHZa8hlWZ8c0uB_a1wb3aIlUr2rsk="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/545", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188183"
      Pubnub::Grant.any_instance.stub(:signature).and_return "nfck4-0lx-jwsvQu2S68uTyGKjJ4vg7wbd-PPKCGiNs="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/543", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188184"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sI1QEPU5kCoyJa9XF3M4olZvEmhapKsOjIhNUVMKLes="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/544", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188184"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sI1QEPU5kCoyJa9XF3M4olZvEmhapKsOjIhNUVMKLes="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/542", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188185"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UqiDbOuwNu88-Pog0CnIjq1s2NZ6gu-Pm05TMKrPflw="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/540", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188186"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kaedbZ13uNVd3Wc2lFe1HJbB9a36wxQlCm_b6ZcHktA="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/541", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188186"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kaedbZ13uNVd3Wc2lFe1HJbB9a36wxQlCm_b6ZcHktA="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/551", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188189"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PFY58dYDYyGOdn-CF4rNBX0hiI1h3z2Q9jQ2QO4KWU4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/549", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188189"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PFY58dYDYyGOdn-CF4rNBX0hiI1h3z2Q9jQ2QO4KWU4="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/550", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188190"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BHM8NeaoSTjEhqbWksuHewTprUKMH8AD5FdqYzizpdI="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/548", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188191"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JgiutMzb1W0kYYmIlnEttloGUReUvpcftGNnQ8ZkNM8="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/546", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188191"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JgiutMzb1W0kYYmIlnEttloGUReUvpcftGNnQ8ZkNM8="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/547", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188192"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1oSRbZb7BpvYmwcFOguO8hJlM2RvOjb8_9o1LeyuI9U="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/557", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188192"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JZ4lO6E6aSGdut2pYmhGTgVC6nvOhWs_z15S7Vf15tY="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/555", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188193"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ip0-bxRTs4s8DhsHQiL1yCWtlrvpAXDYzho3xeSzB4Y="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/556", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188194"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IK_8V5l3iP5ioiDpBKRm_PdZe9ql8AbxydCFfTK8Dxo="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/554", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188194"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IK_8V5l3iP5ioiDpBKRm_PdZe9ql8AbxydCFfTK8Dxo="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/552", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188195"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2boENVOh_GuPB0SpzI_P1YU53cY_CmTccfxL9UkbG0Q="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/553", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188196"
      Pubnub::Grant.any_instance.stub(:signature).and_return "VA4TspEUoYsIq1yyLaUyZ_s1NIGrac19I-hN-xkXQ-Q="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/563", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188196"
      Pubnub::Grant.any_instance.stub(:signature).and_return "oSKcb8doibLMpIQuxGzZwpQrRPNW9NzaghQHYsSPlAc="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/561", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188197"
      Pubnub::Grant.any_instance.stub(:signature).and_return "GahsAlqbTvD42PWmjocYKOhuMeLxDi1qMCZLHG44ASg="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/562", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188197"
      Pubnub::Grant.any_instance.stub(:signature).and_return "GahsAlqbTvD42PWmjocYKOhuMeLxDi1qMCZLHG44ASg="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/560", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188198"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ipw9sAq_CxcwCaq9nBXKkg0PL6SgNnqrOoh8a_Bb_yc="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/558", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188199"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZpEBvQ1DrZWJ6s1CrLl7ce6R5N6opxFhE1NPB0BOX_g="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/559", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188199"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZpEBvQ1DrZWJ6s1CrLl7ce6R5N6opxFhE1NPB0BOX_g="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/569", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188200"
      Pubnub::Grant.any_instance.stub(:signature).and_return "uhNA0VDIbUtcQRsVdqGJ9NG3hO1SEsXKrGb7iC7G8wY="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/567", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188200"
      Pubnub::Grant.any_instance.stub(:signature).and_return "uhNA0VDIbUtcQRsVdqGJ9NG3hO1SEsXKrGb7iC7G8wY="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/568", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188201"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7znXMsEIo_LMpzyKMNekeJFka6RITZRATo4OsPLUdkw="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/566", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188202"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kEGG7UOfatrkfHKO3qY03bk3u6seyEiaJEpSCio82yQ="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/564", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188202"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kEGG7UOfatrkfHKO3qY03bk3u6seyEiaJEpSCio82yQ="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/565", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188203"
      Pubnub::Grant.any_instance.stub(:signature).and_return "J3Bs_l0o-JHyAprO1Q6q8xgASyGbHjcVKBEKQcMjBl0="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/575", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188204"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sg1lx_-8MzVlorzbFMhi41A5szBa28Auh09mKeUMYCU="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/573", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188204"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sg1lx_-8MzVlorzbFMhi41A5szBa28Auh09mKeUMYCU="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/574", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188205"
      Pubnub::Grant.any_instance.stub(:signature).and_return "LWvAVb5QWb5cRTLEXhRRgJbxMeChk7m9h2bv_kEoa9c="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/572", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188206"
      Pubnub::Grant.any_instance.stub(:signature).and_return "68vOJ6lLC2NiFJrVE1Qo12u5GALKkyKWho8UjSGYNzg="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/570", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188207"
      Pubnub::Grant.any_instance.stub(:signature).and_return "fMSxURY2hCdOz7duvvwCQdIUe3jgAK4gAD2EnIYwvi8="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/571", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188207"
      Pubnub::Grant.any_instance.stub(:signature).and_return "fMSxURY2hCdOz7duvvwCQdIUe3jgAK4gAD2EnIYwvi8="
      envelope = @pubnub.grant(channel: "demo", write: true, manage: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/581", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188208"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UkHv5uJybH8q5xhR0SI-hA6i9WptZkiu7b8scVXqL-M="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/579", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188208"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UkHv5uJybH8q5xhR0SI-hA6i9WptZkiu7b8scVXqL-M="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/580", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188209"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yApPZMwZgL1UpTy6DW0P2LVTbhAWAv6j6rO22MU-mZU="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/578", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188210"
      Pubnub::Grant.any_instance.stub(:signature).and_return "N4fG1KQDRJh8TxNEt76R3BNzeengtV-GY0hhuAu5l1g="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/576", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188210"
      Pubnub::Grant.any_instance.stub(:signature).and_return "N4fG1KQDRJh8TxNEt76R3BNzeengtV-GY0hhuAu5l1g="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/577", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188211"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9jWWT1A27if5b83hjxzonOGo-jJe2S8I26GDh0ag9Jw="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/587", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188212"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pHUUAENZR_9wCZRAAAvqqfjYPTyJlmgaXrwChVSiwQk="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/585", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188213"
      Pubnub::Grant.any_instance.stub(:signature).and_return "mSgB6y2hKGjg6-mpkTxb3ivBiUx0ig83Y1B0npW5PgQ="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/586", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188213"
      Pubnub::Grant.any_instance.stub(:signature).and_return "mSgB6y2hKGjg6-mpkTxb3ivBiUx0ig83Y1B0npW5PgQ="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/584", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188214"
      Pubnub::Grant.any_instance.stub(:signature).and_return "otZ9smHm8osgHvKHa0PRc7HgSty3tfug8db_qNWXn-0="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/582", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188214"
      Pubnub::Grant.any_instance.stub(:signature).and_return "otZ9smHm8osgHvKHa0PRc7HgSty3tfug8db_qNWXn-0="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/583", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188215"
      Pubnub::Grant.any_instance.stub(:signature).and_return "NyeWGdhNGFN89sVWc91e6w0P161n8vGzPS_I9GbpSug="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/593", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188216"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zxPMSsMhZxvFjWYHuxPgn-fEr-fyUKYZwDWJaZFIQbY="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/591", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188216"
      Pubnub::Grant.any_instance.stub(:signature).and_return "zxPMSsMhZxvFjWYHuxPgn-fEr-fyUKYZwDWJaZFIQbY="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/592", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188217"
      Pubnub::Grant.any_instance.stub(:signature).and_return "h5GxPKpgoOSdLK5jawspM3FgPaTi2hFe_teRYZwzxTw="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/590", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188218"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UH20pMbnUL-ZPHqFpP_mA9l5qydLC6sBIGpx1CXtC2s="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/588", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188218"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UH20pMbnUL-ZPHqFpP_mA9l5qydLC6sBIGpx1CXtC2s="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/589", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188219"
      Pubnub::Grant.any_instance.stub(:signature).and_return "TPawbFkJBdusCb-HvyZ0yCkkUc8bh0IrgE-0ZBzx9q8="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/599", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188220"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bqC8NU9KIaaWspuHk05c6kBzsXyUTRmjwYPK-iv04JU="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/597", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188221"
      Pubnub::Grant.any_instance.stub(:signature).and_return "YpdefZlQ8G0E67jYWEYNaJj-6hyCWQJDFXroqTHF_HY="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/598", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188221"
      Pubnub::Grant.any_instance.stub(:signature).and_return "YpdefZlQ8G0E67jYWEYNaJj-6hyCWQJDFXroqTHF_HY="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/596", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188222"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yGaOgd8BIVfbft5Yn8Phb8wWnMIfq4vfVw_zuZ2zsFA="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/594", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188223"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Fk8gz6-e9FqoM0C8A_cc2TAUSMv588it3l-g1khKNJg="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/595", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188223"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Fk8gz6-e9FqoM0C8A_cc2TAUSMv588it3l-g1khKNJg="
      envelope = @pubnub.grant(channel: "demo", write: true, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/605", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188224"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WIT2QTzPgq2BWeWllodQaqtkeIjRyHxkwPKrc7Z3UZM="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/603", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188224"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WIT2QTzPgq2BWeWllodQaqtkeIjRyHxkwPKrc7Z3UZM="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/604", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188225"
      Pubnub::Grant.any_instance.stub(:signature).and_return "by-ldllygoakxJWFImev5B4-cglEqV_IWxC8i1Xr5gI="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/602", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188226"
      Pubnub::Grant.any_instance.stub(:signature).and_return "d07a15F3T04cbqIGM8iLirGhidgIPAroR7YgcT4Rfhg="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/600", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188226"
      Pubnub::Grant.any_instance.stub(:signature).and_return "d07a15F3T04cbqIGM8iLirGhidgIPAroR7YgcT4Rfhg="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/601", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188227"
      Pubnub::Grant.any_instance.stub(:signature).and_return "dwX-TVQu35vafq0mpDfFvJlFH0OxEgcjCC2vkeeZSCs="
      envelope = @pubnub.grant(channel: "demo", write: true, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/611", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188227"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MBRC3xofPDf6d8C2ni_u10OrJMV1OH01nyPC7iOF0HA="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/609", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188228"
      Pubnub::Grant.any_instance.stub(:signature).and_return "x_7nuz8-7-fCXbyLFo4-6LZgYnnL0SlsCLuKAl-rM5U="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/610", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188229"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_Waw4Qz9X6cojjovr9OfG-NU4m7CxLfCeXOE1l9GLCQ="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/608", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188229"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_Waw4Qz9X6cojjovr9OfG-NU4m7CxLfCeXOE1l9GLCQ="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/606", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188230"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9FPg5CWeSLmfaIRrRn0Ih0vIhQypL2g0L9fV5bJtdd4="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__true___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/607", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188230"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9FPg5CWeSLmfaIRrRn0Ih0vIhQypL2g0L9fV5bJtdd4="
      envelope = @pubnub.grant(channel: "demo", write: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/401", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188231"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Cgjt3TRzUmPrWRJtrde8lkrDDChKlumOUiY__Vm5Uno="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/399", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188231"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Cgjt3TRzUmPrWRJtrde8lkrDDChKlumOUiY__Vm5Uno="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/400", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188232"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2iGMGwrgKNIfhrH1Gv6fo_Gd8mKBCbTqXsjd9kEkbTU="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/398", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188233"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DB63KXLSjV_dpvXyXHiHh0UZCA_Ht7-cgl1_Zv0eXxc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/396", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188233"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DB63KXLSjV_dpvXyXHiHh0UZCA_Ht7-cgl1_Zv0eXxc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/397", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188234"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MldDLAwp7q2l6CZETGWRpMQWc2vzdfaz7ziLUfsunyk="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/407", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188235"
      Pubnub::Grant.any_instance.stub(:signature).and_return "SDBJovZZ_MUBtfATbuDMu5R5auqvoEYJ5j7tbfEy9TA="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/405", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188235"
      Pubnub::Grant.any_instance.stub(:signature).and_return "SDBJovZZ_MUBtfATbuDMu5R5auqvoEYJ5j7tbfEy9TA="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/406", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188236"
      Pubnub::Grant.any_instance.stub(:signature).and_return "KZTHewo298WcSeXuHGCeVhqk6_hHcV-kV3rEk_J6ZDc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/404", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188236"
      Pubnub::Grant.any_instance.stub(:signature).and_return "KZTHewo298WcSeXuHGCeVhqk6_hHcV-kV3rEk_J6ZDc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/402", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188237"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_YN7OjKDb1PO7YhG7u2pTZC0hCBmUEpdAXHo500MYs0="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/403", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188238"
      Pubnub::Grant.any_instance.stub(:signature).and_return "gqdjf9ydsorOGvCGfST97opcMFXcmIzK8mxVM6IPXm8="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/413", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188238"
      Pubnub::Grant.any_instance.stub(:signature).and_return "gjOp21A3TFWRWxQhWrdRkAQxTMnsZOVpF-iwdblWI00="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/411", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188239"
      Pubnub::Grant.any_instance.stub(:signature).and_return "z6aGQpX6yyj8P8er4os9xiOBOFAPTnrcCLr6sAgJum0="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/412", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188240"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WwFtQDLS3C6aPHgTexxSGA1Vbh8DSfF0-x7v87uqlSo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/410", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188240"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WwFtQDLS3C6aPHgTexxSGA1Vbh8DSfF0-x7v87uqlSo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/408", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188241"
      Pubnub::Grant.any_instance.stub(:signature).and_return "X5cwXW2jXkJ6CkRacI_AGw7SB7IpjgCTiMHiPvzQM-4="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/409", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188241"
      Pubnub::Grant.any_instance.stub(:signature).and_return "X5cwXW2jXkJ6CkRacI_AGw7SB7IpjgCTiMHiPvzQM-4="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/419", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188242"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7zWznipDII7wFEZu2tOGlYApd7d5ckTfzekJdJEU_vw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/417", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188243"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cr1XHd5r21ht9oWLFNz-haV2H--swbc70gtboBgIEDE="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/418", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188243"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cr1XHd5r21ht9oWLFNz-haV2H--swbc70gtboBgIEDE="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/416", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188244"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-qzBAMxUxaI5qdA0AxvjE4J6NNh8nslOOaY23wZ3-Vs="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/414", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188244"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-qzBAMxUxaI5qdA0AxvjE4J6NNh8nslOOaY23wZ3-Vs="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/415", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188245"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BtTi6EgPr2cbja9nfFmyJkUR2kWzH3dKOiqjrQY799Q="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/425", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188245"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8Xx0a_kRq2cSCHi31-7tSd__cBaF6oszjUy1v-_7gdM="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/423", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188246"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sYOaYy4S1Djb8b1Yv9ZuN6BNfyAAHmfPf-Y1AR2_5fY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/424", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188246"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sYOaYy4S1Djb8b1Yv9ZuN6BNfyAAHmfPf-Y1AR2_5fY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/422", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188247"
      Pubnub::Grant.any_instance.stub(:signature).and_return "e1rB8_kIiFPZcvqTUwR2qKt76TnB0YFdpGABMIMFdJc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/420", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188247"
      Pubnub::Grant.any_instance.stub(:signature).and_return "e1rB8_kIiFPZcvqTUwR2qKt76TnB0YFdpGABMIMFdJc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/421", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188248"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bt4enUnqRllKMxyqtS4zv43MkNidl8Gx5DW7i-egcaw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/431", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188248"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2KoQT9fiF7uVKlVFtfBdkUeGXo_TAEwGry_yDVoF6Ms="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/429", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188249"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IDfrqbf7uZSjYbnR-j05cy2m_wpqJEdUxfPAoif7a-g="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/430", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188249"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IDfrqbf7uZSjYbnR-j05cy2m_wpqJEdUxfPAoif7a-g="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/428", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188250"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WrSrgZ6M5rbawd__NUaDeLp1gIKfs-Ot1vO2uL-veNk="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/426", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188250"
      Pubnub::Grant.any_instance.stub(:signature).and_return "WrSrgZ6M5rbawd__NUaDeLp1gIKfs-Ot1vO2uL-veNk="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/427", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188251"
      Pubnub::Grant.any_instance.stub(:signature).and_return "YeGtkFUs5fdA8_DGnsc6Kinp6qHto5k4j_b_LCD4AtQ="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/329", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188252"
      Pubnub::Grant.any_instance.stub(:signature).and_return "O7RvFwLg8Efn9nx_gFoIzifTn6_AjZpRa-CP8WLy6QY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/327", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188252"
      Pubnub::Grant.any_instance.stub(:signature).and_return "O7RvFwLg8Efn9nx_gFoIzifTn6_AjZpRa-CP8WLy6QY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/328", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188253"
      Pubnub::Grant.any_instance.stub(:signature).and_return "jMZEw3fmS28kRiR3m8CQJrTMVuYX_DTUmwC-viCMlj4="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/326", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188254"
      Pubnub::Grant.any_instance.stub(:signature).and_return "X1GivpH-xOLxnRn4qr5c4bhkSHvpL1NSXhGsja2nmNc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/324", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188254"
      Pubnub::Grant.any_instance.stub(:signature).and_return "X1GivpH-xOLxnRn4qr5c4bhkSHvpL1NSXhGsja2nmNc="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/325", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188255"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2Kf2ZybghszAgGHM0IaSSXv94rJ285OjhUT4xG8E0Ok="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/335", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188255"
      Pubnub::Grant.any_instance.stub(:signature).and_return "VLAdaBnOsvrkMMx202jQsnv332OcZiOBuOkA66BIxkk="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/333", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188256"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xnEFPhx-iSNw9zo02j6mHYhUhGExLJyonBhEoLmNkdY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/334", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188256"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xnEFPhx-iSNw9zo02j6mHYhUhGExLJyonBhEoLmNkdY="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/332", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188257"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xZnb8np3OkHv1iDjDct_yrpgXa8BTzmYJu2vje_dTFE="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/330", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188257"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xZnb8np3OkHv1iDjDct_yrpgXa8BTzmYJu2vje_dTFE="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/331", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188258"
      Pubnub::Grant.any_instance.stub(:signature).and_return "c_CFElXeBD9CED6yG0u2nOZ1EqE2R93YiGSV9PSgt8c="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/341", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188258"
      Pubnub::Grant.any_instance.stub(:signature).and_return "W9zqeUc9KAwrHoLm3xMwSm0gEDlWA03nK21vh9j6koo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/339", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188259"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UTM0SrGITQifmcSHndhe_fNerlioZkFH2i1TfJkrfN4="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/340", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188259"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UTM0SrGITQifmcSHndhe_fNerlioZkFH2i1TfJkrfN4="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/338", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188260"
      Pubnub::Grant.any_instance.stub(:signature).and_return "kSop-wmD7PnuxTIvTr-b1E7GcBH4NAeZGhrN5rW_-eg="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/336", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188261"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xKAOhS70HvGqwDTf59-m01B5u9SuKHNN9-YXUnkbqZw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/337", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188262"
      Pubnub::Grant.any_instance.stub(:signature).and_return "4OXDFP_WRePq7UuhAklJF5vqWzJmmqh5bdV3AoZJkIo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/347", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188262"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Mu-ycf6QGkcagsmL8FezMCdU6D4wBImBRbePfebFcHQ="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/345", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188263"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yQI8A3wN9hZEnHz7vFGAJ6eZrJXhrfGF4Vhkset-b7M="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/346", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188263"
      Pubnub::Grant.any_instance.stub(:signature).and_return "yQI8A3wN9hZEnHz7vFGAJ6eZrJXhrfGF4Vhkset-b7M="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/344", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188264"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZLA3go-SARtio7KpFELgU1h9_wkZw-bLI4VqX-Sz7Jw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/342", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188264"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZLA3go-SARtio7KpFELgU1h9_wkZw-bLI4VqX-Sz7Jw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/343", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188265"
      Pubnub::Grant.any_instance.stub(:signature).and_return "GGOa50BKLJMtWqcAgkG5oj96ickL8dyfNH3RXnMOU8c="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/353", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188265"
      Pubnub::Grant.any_instance.stub(:signature).and_return "uRuf7qGbftGgfnSwWTHGHvzceBt8ICdpsFdoLIlboSE="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/351", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188266"
      Pubnub::Grant.any_instance.stub(:signature).and_return "mENJa509OEqb5dQMMjhUXw8gdpxb0oj_ZkngS8wN-Jw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/352", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188267"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HSzXy8DZYgw37MTwNwUxhIk1o1BzVlne4vA6NfIsThw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/350", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188267"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HSzXy8DZYgw37MTwNwUxhIk1o1BzVlne4vA6NfIsThw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/348", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188268"
      Pubnub::Grant.any_instance.stub(:signature).and_return "RMlQaKpte4YAqClTsuAMNXXYczxlog6ECifgF9QHZLw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/349", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188268"
      Pubnub::Grant.any_instance.stub(:signature).and_return "RMlQaKpte4YAqClTsuAMNXXYczxlog6ECifgF9QHZLw="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/359", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188269"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9M3IaUS6d1e_Nu6j-2uCxgrVnkqmSLttDqG2S9K37j0="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/357", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188269"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9M3IaUS6d1e_Nu6j-2uCxgrVnkqmSLttDqG2S9K37j0="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/358", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188270"
      Pubnub::Grant.any_instance.stub(:signature).and_return "V_F8FuDFwGYqz4r-h3_gAD_mIJ0-Xj6mPcte3YHEJFo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/356", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188270"
      Pubnub::Grant.any_instance.stub(:signature).and_return "V_F8FuDFwGYqz4r-h3_gAD_mIJ0-Xj6mPcte3YHEJFo="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/354", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188271"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pUniuqSReHWy_Cvfy__OdHQuSN7NjFvkF0MyhXOHvyI="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/355", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188271"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pUniuqSReHWy_Cvfy__OdHQuSN7NjFvkF0MyhXOHvyI="
      envelope = @pubnub.grant(channel: "demo", write: false, manage: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/365", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188272"
      Pubnub::Grant.any_instance.stub(:signature).and_return "IXb3Up87aK37b9Y1msqjt5XthUh3xCDRW64L3fNG-9o="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/363", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188273"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1xRfaVFglu3rbmDTZ8FJW-yysZhAOfu8JZoc68Y3iqM="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/364", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188273"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1xRfaVFglu3rbmDTZ8FJW-yysZhAOfu8JZoc68Y3iqM="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/362", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188274"
      Pubnub::Grant.any_instance.stub(:signature).and_return "izNzLoC9t3n2kfdQVy2YRg-VIlPPV9QVoYKX2hPE4pE="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/360", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188274"
      Pubnub::Grant.any_instance.stub(:signature).and_return "izNzLoC9t3n2kfdQVy2YRg-VIlPPV9QVoYKX2hPE4pE="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/361", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188275"
      Pubnub::Grant.any_instance.stub(:signature).and_return "_DkkGpaNumC2I72rslBjlIEAQ0rPk05jc0BA4AeOwF4="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/371", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188275"
      Pubnub::Grant.any_instance.stub(:signature).and_return "29o2lCyBhGx2bt_Z-vde2ewfGxk7qhM5ms7iyGU2T6M="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/369", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188276"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZR7JsP7sa3Kcd26Oz5YrwSQAVwG8mqVk7ezvIYxUIwU="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/370", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188276"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZR7JsP7sa3Kcd26Oz5YrwSQAVwG8mqVk7ezvIYxUIwU="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/368", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188277"
      Pubnub::Grant.any_instance.stub(:signature).and_return "QyIaNlsRcurOtZOMvcLGtQzpziJWgZWQ_FxQAAQYXGY="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/366", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188277"
      Pubnub::Grant.any_instance.stub(:signature).and_return "QyIaNlsRcurOtZOMvcLGtQzpziJWgZWQ_FxQAAQYXGY="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/367", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188278"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BzIl9ySdoRjAMTgpRUUUP8jO-BD_J7m9YugjST3Ee2k="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/377", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188278"
      Pubnub::Grant.any_instance.stub(:signature).and_return "y6as74VW8wjdNKhF-dgQBrgsHjDevLNpiUs6sJylvy4="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/375", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188279"
      Pubnub::Grant.any_instance.stub(:signature).and_return "q88UWFQ6GeB4I81eTBAP-TC6MnIgVdPmEzpEXj05FBM="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/376", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188279"
      Pubnub::Grant.any_instance.stub(:signature).and_return "q88UWFQ6GeB4I81eTBAP-TC6MnIgVdPmEzpEXj05FBM="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/374", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188280"
      Pubnub::Grant.any_instance.stub(:signature).and_return "4PJsKYJmjMgc4cLj7xbO_iZCKF3Av7WROJNas9b58rk="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/372", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188280"
      Pubnub::Grant.any_instance.stub(:signature).and_return "4PJsKYJmjMgc4cLj7xbO_iZCKF3Av7WROJNas9b58rk="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/373", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188281"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0CcAwFr1E3lrTwpbiy2RBZXRneRPKET8XNUSU5wDIvk="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/383", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188282"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eMD03k8nvdp2-0QK8-fSGj3KtaKKZMIeqLmZPXhMec4="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/381", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188282"
      Pubnub::Grant.any_instance.stub(:signature).and_return "eMD03k8nvdp2-0QK8-fSGj3KtaKKZMIeqLmZPXhMec4="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/382", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188283"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pnftG-Ipmd7PttUmkVMHo9MkSd9OFOBcKaLsBSgrAU8="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/380", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188283"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pnftG-Ipmd7PttUmkVMHo9MkSd9OFOBcKaLsBSgrAU8="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/378", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188284"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JkZBM0x-sVlbjUfKGgJrX0gmT7v45nPsofriN5WUD-w="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/379", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188284"
      Pubnub::Grant.any_instance.stub(:signature).and_return "JkZBM0x-sVlbjUfKGgJrX0gmT7v45nPsofriN5WUD-w="
      envelope = @pubnub.grant(channel: "demo", write: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/389", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188285"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0GF2hMxegdU61TimeSrkFJi4JwK5N9pAHeIbElvVfhY="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/387", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188285"
      Pubnub::Grant.any_instance.stub(:signature).and_return "0GF2hMxegdU61TimeSrkFJi4JwK5N9pAHeIbElvVfhY="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/388", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188286"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qK_hxIWGmk-YAkWr_WM407gZLIYN3RSGw6oPmZdPwp4="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/386", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188286"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qK_hxIWGmk-YAkWr_WM407gZLIYN3RSGw6oPmZdPwp4="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/384", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188287"
      Pubnub::Grant.any_instance.stub(:signature).and_return "lqOMLbuB4KpIkJgtUfSh_KUtOguAmjc3gu4vzTD4AOk="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/385", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188288"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bWc3xkK9xUs_sJjTfrySCN1ly50SQ90clADxUJPT0Rg="
      envelope = @pubnub.grant(channel: "demo", write: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/395", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188288"
      Pubnub::Grant.any_instance.stub(:signature).and_return "xoPH1EQxhnB0r5kQrRQAA863056KeIALDucwCnmqeuw="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/393", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188289"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qexVfoyC7qPcrXfIXvCdsIrpMQF4lZmx9cZmkNKbkUc="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/394", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188289"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qexVfoyC7qPcrXfIXvCdsIrpMQF4lZmx9cZmkNKbkUc="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/392", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188290"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1WU-SPFaFLpdnReg49AOrIvCLLx9J3sdGPrGh6MV-CU="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/390", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188290"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1WU-SPFaFLpdnReg49AOrIvCLLx9J3sdGPrGh6MV-CU="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__false___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/391", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188291"
      Pubnub::Grant.any_instance.stub(:signature).and_return "NDQ9AqZsm6XgsPpetRi10e3z336fEsjOLmmaJBifIww="
      envelope = @pubnub.grant(channel: "demo", write: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 0, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/509", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188291"
      Pubnub::Grant.any_instance.stub(:signature).and_return "u-iB6HHjr_ANNeCkqguqdFxTUfMwuRHWIInMFM5aZmo="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/507", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188292"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Z2jd2AhWo1duQMfR0qWif_9EoA_SskSpBtXQDDjcLjc="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/508", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188292"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Z2jd2AhWo1duQMfR0qWif_9EoA_SskSpBtXQDDjcLjc="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/506", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188293"
      Pubnub::Grant.any_instance.stub(:signature).and_return "UCWJVwCGAXLGeWvak5eElrUVPScbev9SllIY9QVPudw="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/504", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188294"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BWH7XPcAcWN3rDJ47Lz0OATkNLbrdpqQg5sm9VLECXM="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/505", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188294"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BWH7XPcAcWN3rDJ47Lz0OATkNLbrdpqQg5sm9VLECXM="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/515", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188295"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZdupY1kLZfyO3xiRC9WOPZ_ccwoS00YfVNuB1kXBGYY="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/513", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188295"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZdupY1kLZfyO3xiRC9WOPZ_ccwoS00YfVNuB1kXBGYY="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/514", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188296"
      Pubnub::Grant.any_instance.stub(:signature).and_return "NkECJTYW6HFVILmrHKLuWN3B6d24vSpEFBnSLotJzQA="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/512", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188296"
      Pubnub::Grant.any_instance.stub(:signature).and_return "NkECJTYW6HFVILmrHKLuWN3B6d24vSpEFBnSLotJzQA="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/510", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188297"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CjxflTMd-gqOC_ft-vY4dLKUGW5mbk0AJ8Qaauus6Sk="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/511", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188297"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CjxflTMd-gqOC_ft-vY4dLKUGW5mbk0AJ8Qaauus6Sk="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/521", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188298"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qvQfA_XfaoAzJcd-hm8BsGL6sUy0nt1TczX6xhnaHZo="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/519", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188298"
      Pubnub::Grant.any_instance.stub(:signature).and_return "qvQfA_XfaoAzJcd-hm8BsGL6sUy0nt1TczX6xhnaHZo="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/520", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188299"
      Pubnub::Grant.any_instance.stub(:signature).and_return "vKSlamFht7yoHrkc2UI1S8OgUjWrUJB8Dr6BU0uXqZc="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/518", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188299"
      Pubnub::Grant.any_instance.stub(:signature).and_return "vKSlamFht7yoHrkc2UI1S8OgUjWrUJB8Dr6BU0uXqZc="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/516", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188300"
      Pubnub::Grant.any_instance.stub(:signature).and_return "H68T7cgOE6rLWhFKDFFTxvy1KIYvBMH2sQtU8L4fzko="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/517", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188300"
      Pubnub::Grant.any_instance.stub(:signature).and_return "H68T7cgOE6rLWhFKDFFTxvy1KIYvBMH2sQtU8L4fzko="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/527", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188301"
      Pubnub::Grant.any_instance.stub(:signature).and_return "8de3AwhAqAZyJaZUo2XtWnhpkYaB3rR-2bt7ycIHgv8="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/525", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188302"
      Pubnub::Grant.any_instance.stub(:signature).and_return "02pHKdFbOWZc3vvHaCisWskEgAM0Y9OCgM4s-LmR9Xw="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/526", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188302"
      Pubnub::Grant.any_instance.stub(:signature).and_return "02pHKdFbOWZc3vvHaCisWskEgAM0Y9OCgM4s-LmR9Xw="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/524", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188303"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bR8IprrS1n1rwAOrNiSVGIoeN9t_ClO94iiqFWzF8xA="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/522", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188303"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bR8IprrS1n1rwAOrNiSVGIoeN9t_ClO94iiqFWzF8xA="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/523", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188304"
      Pubnub::Grant.any_instance.stub(:signature).and_return "BVN-gYrVpq7MfWaQ3yO81hl9PtP9MS44aVXXql9zvYc="
      envelope = @pubnub.grant(channel: "demo", manage: true, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/533", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188304"
      Pubnub::Grant.any_instance.stub(:signature).and_return "RkNW5yMwEyJwbM3JRLT0PUYrlAjAesak1riLzy7WHvQ="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/531", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188305"
      Pubnub::Grant.any_instance.stub(:signature).and_return "K40jV7N4XDYM691j3KQptVd7AutydyVFgGnfGFswjt0="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/532", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188305"
      Pubnub::Grant.any_instance.stub(:signature).and_return "K40jV7N4XDYM691j3KQptVd7AutydyVFgGnfGFswjt0="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/530", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188306"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sUd5o2UQ0Tirn98kQemO1wtG16z6fwGlktQrZHEGAvk="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/528", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188306"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sUd5o2UQ0Tirn98kQemO1wtG16z6fwGlktQrZHEGAvk="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/529", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188307"
      Pubnub::Grant.any_instance.stub(:signature).and_return "bmdH3OL5UwUBGL8KWjAkfovDs-oc3y9KegaCMglo5dU="
      envelope = @pubnub.grant(channel: "demo", manage: true, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/539", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188308"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hns5Ykff4xyMRgFaq5wteK5VoDd3YrwZkZ5XlEAJhys="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/537", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188308"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hns5Ykff4xyMRgFaq5wteK5VoDd3YrwZkZ5XlEAJhys="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/538", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188309"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Yt2IuPvN1v7EY-8UPb1OchQyzlDXQnvtaAY-0COquUc="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/536", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188310"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7LiE-x5-Hc3vVbZjbetgl3Ksv8g3qYjbZ2reEXVPvaU="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/534", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188310"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7LiE-x5-Hc3vVbZjbetgl3Ksv8g3qYjbZ2reEXVPvaU="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__true___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/535", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188311"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Rr1YHvHbb-LIGScYFmDhOC7ngM1nX9t_mIDoaduEDNY="
      envelope = @pubnub.grant(channel: "demo", manage: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/437", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188311"
      Pubnub::Grant.any_instance.stub(:signature).and_return "59LulR5xSkNx2SyIrRYRb9JcxNDchTteD2lxUYIGHto="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/435", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188312"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5g5nQBdCdIr66y7qHs1xE5t_p0fcQlvSHoYlGU2V_lQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/436", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188313"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Yhck_OuW_zLGYqkxYVmUVZVFh0XzcEaItQ_RKGGDZYQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/434", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188313"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Yhck_OuW_zLGYqkxYVmUVZVFh0XzcEaItQ_RKGGDZYQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/432", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188314"
      Pubnub::Grant.any_instance.stub(:signature).and_return "C3qKvMgHgdXSHiKeZMH40-2kv78s6xMlhwP9FZSdZ2g="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/433", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188314"
      Pubnub::Grant.any_instance.stub(:signature).and_return "C3qKvMgHgdXSHiKeZMH40-2kv78s6xMlhwP9FZSdZ2g="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/443", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188315"
      Pubnub::Grant.any_instance.stub(:signature).and_return "k1UEa7e366cj02rVKXkBt-55HUO6i6eirkHc4yziNvA="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/441", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188315"
      Pubnub::Grant.any_instance.stub(:signature).and_return "k1UEa7e366cj02rVKXkBt-55HUO6i6eirkHc4yziNvA="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/442", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188316"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PEKqpbCBttlTHywa7xKPbSQ2NiXYrMBzV-tZ18B_3S4="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/440", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188316"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PEKqpbCBttlTHywa7xKPbSQ2NiXYrMBzV-tZ18B_3S4="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/438", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188317"
      Pubnub::Grant.any_instance.stub(:signature).and_return "hA_vprJRWwga4WNcywuCKGFXRtxoQqNTbSPdEzqBuPQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/439", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188318"
      Pubnub::Grant.any_instance.stub(:signature).and_return "6zxoqpyrKF-K2_d0hsDr5NSAeSDKnHYIg7NAESVABVQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/449", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188318"
      Pubnub::Grant.any_instance.stub(:signature).and_return "2LgiWu-FSQS7RTKJrHU8RovLlFi58q_1r3hYj2TzesA="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/447", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188319"
      Pubnub::Grant.any_instance.stub(:signature).and_return "dbsiydTGpuex5F1xvcFYChphpgPwRXOMA7hcL_daaS4="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/448", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188319"
      Pubnub::Grant.any_instance.stub(:signature).and_return "dbsiydTGpuex5F1xvcFYChphpgPwRXOMA7hcL_daaS4="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/446", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188320"
      Pubnub::Grant.any_instance.stub(:signature).and_return "V1T2dzLk0fgMqgZ-TNJdKhyUHrWloomLkB0mmM5NxWE="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/444", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188320"
      Pubnub::Grant.any_instance.stub(:signature).and_return "V1T2dzLk0fgMqgZ-TNJdKhyUHrWloomLkB0mmM5NxWE="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/445", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188321"
      Pubnub::Grant.any_instance.stub(:signature).and_return "dL6h-Fjt8wwgpMhMe1upQ1rYsOlf5TqxSaCoZPxubMw="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/455", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188322"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9GT9B8kOrbWUQUo7IzfthRw2K3nQ5-i3RPMBXQugysM="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/453", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188324"
      Pubnub::Grant.any_instance.stub(:signature).and_return "DwCHMXkBuPbSbxSmML-1z-f2henXtp7DGk7rE7PPz1M="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/454", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188325"
      Pubnub::Grant.any_instance.stub(:signature).and_return "gbnsF5MiT07LRzhG4B7VVuLywSOo0BxdTG_w1HR0T4s="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/452", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188325"
      Pubnub::Grant.any_instance.stub(:signature).and_return "gbnsF5MiT07LRzhG4B7VVuLywSOo0BxdTG_w1HR0T4s="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/450", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188326"
      Pubnub::Grant.any_instance.stub(:signature).and_return "GSoDnI5Ehv8YxGnorUPQPBH1j42LWf_8j9GY5O2m_3A="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/451", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188326"
      Pubnub::Grant.any_instance.stub(:signature).and_return "GSoDnI5Ehv8YxGnorUPQPBH1j42LWf_8j9GY5O2m_3A="
      envelope = @pubnub.grant(channel: "demo", manage: false, ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/461", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188327"
      Pubnub::Grant.any_instance.stub(:signature).and_return "YpIAhdEvJ2fc7gE0IENb6Lar4n1KAnX1V8_SyR06ikA="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/459", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188327"
      Pubnub::Grant.any_instance.stub(:signature).and_return "YpIAhdEvJ2fc7gE0IENb6Lar4n1KAnX1V8_SyR06ikA="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/460", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188328"
      Pubnub::Grant.any_instance.stub(:signature).and_return "KfQm-hDVxTbCj28QAGf14zC-YZ6lyGanplOp1eryZJ0="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/458", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188329"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ko3nsNgtSe4IbcJyrePaT50Gf7OKcBPTHcMbLBcT7r0="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/456", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188329"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Ko3nsNgtSe4IbcJyrePaT50Gf7OKcBPTHcMbLBcT7r0="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/457", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188330"
      Pubnub::Grant.any_instance.stub(:signature).and_return "ZQ8pnzbGnZtdrDyqJraeHeq9GOzgaWhOuXBrlsJ5CK8="
      envelope = @pubnub.grant(channel: "demo", manage: false, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/467", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188330"
      Pubnub::Grant.any_instance.stub(:signature).and_return "HqSzJWRo5xZGB-TKEt6CIzXmeMOWi1Z6srKk231z5JA="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/465", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188331"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Py2zNh30YKc3TOKzGmFlC1LGCRofDHHdnbEG8BtUKJQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/466", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188331"
      Pubnub::Grant.any_instance.stub(:signature).and_return "Py2zNh30YKc3TOKzGmFlC1LGCRofDHHdnbEG8BtUKJQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/464", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188332"
      Pubnub::Grant.any_instance.stub(:signature).and_return "me81aGOGfD3UHECsrqr5LqnkTiVimeHTiQbg9KoKXFs="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/462", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188333"
      Pubnub::Grant.any_instance.stub(:signature).and_return "15WUGMtJGPKE6NMOzjpL_HQQY0vz53AetYJKPa8gVao="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__false___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/463", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188334"
      Pubnub::Grant.any_instance.stub(:signature).and_return "cSImww4Doq-RLwWwltO_jkEaJeASBfvHWhq7NRvlRkQ="
      envelope = @pubnub.grant(channel: "demo", manage: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 0}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/473", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188334"
      Pubnub::Grant.any_instance.stub(:signature).and_return "TyNx6NN4weprNLS0nQBZHVyS4eW86SsB1X3Aqj6FGlE="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/471", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188335"
      Pubnub::Grant.any_instance.stub(:signature).and_return "RYU-fqaXVUclFyZcXu3WoAH2_rTvzifpqp1ipTIZZ9Y="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/472", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188335"
      Pubnub::Grant.any_instance.stub(:signature).and_return "RYU-fqaXVUclFyZcXu3WoAH2_rTvzifpqp1ipTIZZ9Y="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/470", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188336"
      Pubnub::Grant.any_instance.stub(:signature).and_return "EpbVZMvpSOoY4LA7Ir-K2bGLwSVTW93Btgs5YJCUPQE="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/468", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188336"
      Pubnub::Grant.any_instance.stub(:signature).and_return "EpbVZMvpSOoY4LA7Ir-K2bGLwSVTW93Btgs5YJCUPQE="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/469", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188337"
      Pubnub::Grant.any_instance.stub(:signature).and_return "3GfqIhkJsXyeuoi3y9CQx5i92tR2NooHW6gDiVkTUHw="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/479", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188338"
      Pubnub::Grant.any_instance.stub(:signature).and_return "r-RR5WV79V4Jzi1a4mlR0KuJDULfV8VXD9fQi1LgNMI="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/477", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188338"
      Pubnub::Grant.any_instance.stub(:signature).and_return "r-RR5WV79V4Jzi1a4mlR0KuJDULfV8VXD9fQi1LgNMI="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/478", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188339"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MLFrCbv6FUXnkl9A1j2pvf1K7SQUfWpQ-7bcLImjKZU="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/476", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188339"
      Pubnub::Grant.any_instance.stub(:signature).and_return "MLFrCbv6FUXnkl9A1j2pvf1K7SQUfWpQ-7bcLImjKZU="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/474", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188340"
      Pubnub::Grant.any_instance.stub(:signature).and_return "pqop-QimLAUHiK28rzUywIW_AWZi_ZMT5dNALIKZH-4="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__0___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/475", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188341"
      Pubnub::Grant.any_instance.stub(:signature).and_return "rNuCPOp0ciR7E9_SrHvevBC8T8cUbS8ON5Dk0ytkTng="
      envelope = @pubnub.grant(channel: "demo", ttl: 0, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 0, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/485", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188341"
      Pubnub::Grant.any_instance.stub(:signature).and_return "E410CzNWVwoBD13Qc6pjHlKld8dBVKVPlVbpdT6mPvM="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/483", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188342"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-z47vc9A3-7bGUMJNkrnY0CEAzZ0ub5uZkqHk5DQNaI="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/484", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188342"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-z47vc9A3-7bGUMJNkrnY0CEAzZ0ub5uZkqHk5DQNaI="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/482", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188343"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-7ubyWEz0K8c4qB8RKVlYk6fqoeG7FhizF3DWq6rAwo="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/480", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188343"
      Pubnub::Grant.any_instance.stub(:signature).and_return "-7ubyWEz0K8c4qB8RKVlYk6fqoeG7FhizF3DWq6rAwo="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/481", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188344"
      Pubnub::Grant.any_instance.stub(:signature).and_return "7KEMTG4QMEOOcclxJ7w3Q7aUebD1SNmqas7CsF27q9g="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/491", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188345"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CkOgQLQupCdOC5x-yg78QhzcSnqc8zGClKGtEAtMm54="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/489", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188345"
      Pubnub::Grant.any_instance.stub(:signature).and_return "CkOgQLQupCdOC5x-yg78QhzcSnqc8zGClKGtEAtMm54="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/490", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188346"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1pVxZoL0dHIrXeYewhJuJAzsQ9vvoU9BbQ-y4d9InoE="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/488", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188346"
      Pubnub::Grant.any_instance.stub(:signature).and_return "1pVxZoL0dHIrXeYewhJuJAzsQ9vvoU9BbQ-y4d9InoE="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/486", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188347"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5Ub9K_wLLuwxAg5RNTZ9ZcN39zJ2roL7G_VemfrrOaQ="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__300___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/487", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188347"
      Pubnub::Grant.any_instance.stub(:signature).and_return "5Ub9K_wLLuwxAg5RNTZ9ZcN39zJ2roL7G_VemfrrOaQ="
      envelope = @pubnub.grant(channel: "demo", ttl: 300, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 300, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/497", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188348"
      Pubnub::Grant.any_instance.stub(:signature).and_return "PSI4S9NkWvyig80KmhqKZSEVqXKS04mXJjnqHogv8JY="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/495", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188349"
      Pubnub::Grant.any_instance.stub(:signature).and_return "KxRg5HKMX-wILufW6kTo0YFh1MKJKIVBkSrVW2JoUSw="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/496", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188350"
      Pubnub::Grant.any_instance.stub(:signature).and_return "761WWuxje14o6vXdm4YR9KP2cy16HrjtyO5wQOgA2vs="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/494", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188350"
      Pubnub::Grant.any_instance.stub(:signature).and_return "761WWuxje14o6vXdm4YR9KP2cy16HrjtyO5wQOgA2vs="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/492", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188351"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9P8B-ywLibZ1S_p4kRQCAc9FYmrZRLeYZrQaVlogCsE="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key___ruby-authkey____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/493", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188351"
      Pubnub::Grant.any_instance.stub(:signature).and_return "9P8B-ywLibZ1S_p4kRQCAc9FYmrZRLeYZrQaVlogCsE="
      envelope = @pubnub.grant(channel: "demo", auth_key: "ruby-authkey", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channel" => "demo", "auths" => {"ruby-authkey" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/503", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188352"
      Pubnub::Grant.any_instance.stub(:signature).and_return "e31WH3Eu92BvD7h5Mei-qIkhLcJxWwyQCACzu5SEBjE="
      envelope = @pubnub.grant(channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant/501", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188352"
      Pubnub::Grant.any_instance.stub(:signature).and_return "e31WH3Eu92BvD7h5Mei-qIkhLcJxWwyQCACzu5SEBjE="
      envelope = @pubnub.grant(channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/grant/502", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188353"
      Pubnub::Grant.any_instance.stub(:signature).and_return "sAhM-d54QE6w9Ec2o-eATBilzb8-9ubFTNpMREjE3Ao="
      envelope = @pubnub.grant(channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/grant/500", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188354"
      Pubnub::Grant.any_instance.stub(:signature).and_return "OwDgAkVa1FT-Qq7e_n1JbN2pKroc54Hh3GVa-u_PbFQ="
      envelope = @pubnub.grant(channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/grant/498", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188354"
      Pubnub::Grant.any_instance.stub(:signature).and_return "OwDgAkVa1FT-Qq7e_n1JbN2pKroc54Hh3GVa-u_PbFQ="
      envelope = @pubnub.grant(channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo____group__nil___read__nil___write__nil___manage__nil___ttl__nil___auth_key__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/grant/499", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1464188355"
      Pubnub::Grant.any_instance.stub(:signature).and_return "by7RQiKOzsMVl82qiEAWa0XteLk-isH0gYhGJ9L15oo="
      envelope = @pubnub.grant(channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1}}})
    end
  end

  it "__channel___demo___group__nil___read__true___write__true___manage__nil___delete__true___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/1944", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1601665764"
      Pubnub::Grant.any_instance.stub(:signature).and_return "6_P9JKXY2G7gIdjuRsAhAgcHOcp5tgZt1VUiILsyim8="
      envelope = @pubnub.grant(channel: :demo, read: true, write: true, delete: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1, "d" => 1, "g" => 0, "u" => 0, "j" => 0}}})
    end
  end

  it "__channel___demo___group__nil___read__true___write__true___manage__nil___delete__false___ttl__nil___auth_key__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/1945", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1602781742"
      Pubnub::Grant.any_instance.stub(:signature).and_return "v2.e1xGxWqMtgai9T7lewHA0A3LiTaBHM7keT6L6sw0F08"
      envelope = @pubnub.grant(channel: :demo, read: true, write: true, delete: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({"level" => "channel", "subscribe_key" => "sub-a-mock-key", "ttl" => 1440, "channels" => {"demo" => {"r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 0, "u" => 0, "j" => 0}}})
    end
  end

  it "___uuids__bob___get__true___update__true___delete__false___ttl__nil___auth_key__demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/1946", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1605101896"
      Pubnub::Grant.any_instance.stub(:signature).and_return "v2.v9I738j7Zuks-MiomTBSKAYKviUDyUK8FtNPkPp8txQ"
      envelope = @pubnub.grant(uuids: :bob, get: true, update: true, delete: false, auth_key: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({
        "level" => "uuid",
        "subscribe_key" => "sub-a-mock-key",
        "ttl" => 1440,
        "uuids" => {
          "bob" => { "auths" => { "demo" => {"r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 1, "u" => 1, "j" => 0} } }
        }
      })
    end
  end

  it "___uuids__bob__steve___get__true___update__true___delete__false___ttl__nil___auth_key__demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/1947", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1605102454"
      Pubnub::Grant.any_instance.stub(:signature).and_return "v2.IRbEAStL3bqpDYg4ZkVAKpZCzJWxV0I5mw3gPcMxIDE"
      envelope = @pubnub.grant(uuids: [:bob, :steve], get: true, update: true, delete: false, auth_key: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({
        "level" => "uuid",
        "subscribe_key" => "sub-a-mock-key",
        "ttl" => 1440,
        "uuids" => {
          "bob" => { "auths" => { "demo" => { "r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 1, "u" => 1, "j" => 0 } } },
          "steve" => { "auths" => { "demo" => { "r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 1, "u" => 1, "j" => 0 } } }
        }
      })
    end
  end

  it "___uuids__bob__john___get__true___update__true___delete__false___ttl__nil___auth_key__demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/grant/1948", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1605102472"
      Pubnub::Grant.any_instance.stub(:signature).and_return "v2.52XSSWDJICI8GEBq9Da-KfMLIHDVRF4YQdUYcGjR4V0"
      envelope = @pubnub.grant(uuids: "bob,john", get: true, update: true, delete: false, auth_key: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant)
      expect(envelope.result[:data]).to eq({
        "level" => "uuid",
        "subscribe_key" => "sub-a-mock-key",
        "ttl" => 1440,
        "uuids" => {
          "bob" => { "auths" => {"demo" => { "r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 1,"u" => 1, "j" => 0 } } },
          "john" => { "auths" => { "demo" => { "r" => 1, "w" => 1, "m" => 1, "d" => 0, "g" => 1, "u" => 1, "j" => 0 } } }
        }
      })
    end
  end
end
