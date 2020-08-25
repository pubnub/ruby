require "spec_helper"

describe Pubnub::History do
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

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_meta__true_" do
    VCR.use_cassette("examples/history/100", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest, include_meta: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => {"message"=>"text"}, "meta" => {"metaKey"=>"metaValue"}, "timetoken" => 15965666789169854}], :end => 15965666789169854, :start => 15965666789169854})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___encrypted__true_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
    )
    VCR.use_cassette("examples/history/no_includes__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest, count: 10, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [100], :end => 15965666789169854, :start => 15965666789169854})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_meta__true___encrypted__true_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
    )
    VCR.use_cassette("examples/history/include_meta__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest, count: 10, include_meta: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "meta" => "", "timetoken" => 15965666789169854}], :end => 15965666789169854, :start => 15965666789169854})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_token__true___encrypted__true_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
    )
    VCR.use_cassette("examples/history/include_token__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest, count: 10, include_token: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "timetoken" => 15965666789169854}], :end => 15965666789169854, :start => 15965666789169854})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/53", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/51", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/52", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/50", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/48", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__true___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/49", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/41", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/39", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/40", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/38", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/36", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/37", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, reverse: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/47", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/45", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/46", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/44", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/42", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/43", record: :none) do
      envelope = @pubnub.history(channel: :demo, count: 10, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/71", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/69", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/70", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/68", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/66", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/67", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/59", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/57", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/58", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/56", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/54", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/55", record: :none) do
      envelope = @pubnub.history(channel: :demo, reverse: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/65", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/63", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/64", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/62", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/60", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo___count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/61", record: :none) do
      envelope = @pubnub.history(channel: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/17", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/15", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/16", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/14", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/12", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__true___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/13", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/5", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/3", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/4", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/2", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/0", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__false___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/1", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, reverse: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/11", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/9", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/10", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/8", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/6", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__10___start__nil___end__nil___reverse__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/7", record: :none) do
      envelope = @pubnub.history(channel: "demo", count: 10, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/35", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/33", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/34", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/32", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/30", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__true___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/31", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: true, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/23", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/21", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/22", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/20", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/18", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__false___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/19", record: :none) do
      envelope = @pubnub.history(channel: "demo", reverse: false, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/history/29", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/history/27", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/28", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/history/26", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/history/24", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end

  it "__channel___demo____count__nil___start__nil___end__nil___reverse__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/25", record: :none) do
      envelope = @pubnub.history(channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"text" => "Enter Message Here"}], :end => 14641838216911695, :start => 14641838216911695})
    end
  end
end
