require 'helpers/spec_helper'

describe Pubnub::History do
  around :each do |example|
    @fired_count = 0
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
      @fired_count += 1
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
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

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___encrypted__true___random_iv__false_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
      random_iv: false
    )
    VCR.use_cassette("examples/history/no_includes__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest1, count: 10, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [100], :end => 16148147101366576, :start => 16148147101366576})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_meta__true___encrypted__true___random_iv__false_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
      random_iv: false
    )
    VCR.use_cassette("examples/history/include_meta__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest2, count: 10, include_meta: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "meta" => "", "timetoken" => 16148149695171741}], :end => 16148149695171741, :start => 16148149695171741})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_token__true___encrypted__true___random_iv__false_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key",
      random_iv: false
    )
    VCR.use_cassette("examples/history/include_token__encrypted", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest3, count: 10, include_token: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "timetoken" => 16148151241848372}], :end => 16148151241848372, :start => 16148151241848372})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___encrypted__true___random_iv__true_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key"
    )
    VCR.use_cassette("examples/history/no_includes__encrypted_random_iv", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest4, count: 10, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [100], :end => 16148153795208310, :start => 16148153795208310})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_meta__true___encrypted__true___random_iv__false_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key"
    )
    VCR.use_cassette("examples/history/include_meta__encrypted_random_iv", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest5, count: 10, include_meta: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "meta" => "", "timetoken" => 16148154562721969}], :end => 16148154562721969, :start => 16148154562721969})
    end
  end

  it "__channel___demo___count__10___start__nil___end__nil___reverse__false___http_sync__true___callback__nil___include_token__true___encrypted__true___random_iv__true_" do
    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "super-secret-cipher-key"
    )
    VCR.use_cassette("examples/history/include_token__encrypted_random_iv", :record => :none) do
      envelope = @pubnub.history(channel: :rubytest6, count: 10, include_token: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(@pubnub.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({:messages => [{"message" => 100, "timetoken" => 16148155532212500}], :end => 16148155532212500, :start => 16148155532212500})
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

  it "paged_history___channel___demo____page__2___limit__2___start__nil___end__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/paged_history_1", record: :none) do
      envelopes = @pubnub.paged_history(channel: "demo", page: 2, limit: 2, http_sync: true, callback: @callback)
      expect(@fired_count).to eq 2
      expect(envelopes.length).to eq 2

      envelopes.each do |envelope|
        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.error?).to eq false
        expect(envelope.status[:code]).to eq(200)
        expect(envelope.status[:category]).to eq(:ack)

        expect(envelope.result[:code]).to eq(200)
        expect(envelope.result[:operation]).to eq(:history)
      end

      expect(envelopes[0].result[:data]).to eq({:messages => [{"text" => "Test message #9"}, {"text" => "Test message #10"}], :end => 16376216052005483, :start => 16376216012185785})
      expect(envelopes[1].result[:data]).to eq({:messages => [{"text" => "Test message #7"}, {"text" => "Test message #8"}], :end => 16376215974611464, :start => 16376215943848282})
    end
  end

  it "paged_history___channel___demo____page__2___limit__2___start__nil___end__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/paged_history_1", record: :none) do
      envelopes = @pubnub.paged_history(channel: "demo", page: 2, limit: 2, http_sync: false, callback: @callback)
      envelopes = envelopes.value
      expect(@fired_count).to eq 2
      expect(envelopes.length).to eq 2

      envelopes.each do |envelope|
        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.error?).to eq false
        expect(envelope.status[:code]).to eq(200)
        expect(envelope.status[:category]).to eq(:ack)

        expect(envelope.result[:code]).to eq(200)
        expect(envelope.result[:operation]).to eq(:history)
      end

      expect(envelopes[0].result[:data]).to eq({:messages => [{"text" => "Test message #9"}, {"text" => "Test message #10"}], :end => 16376216052005483, :start => 16376216012185785})
      expect(envelopes[1].result[:data]).to eq({:messages => [{"text" => "Test message #7"}, {"text" => "Test message #8"}], :end => 16376215974611464, :start => 16376215943848282})
    end
  end

  # Test that second page won't have required limit because of reaching the end of storage.
  it "paged_history___channel___demo____page__4___limit__2___start__16376215835141821___end__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/paged_history_2", record: :none) do
      # 16376215835141820 should be incremented by one to make it inclusive.
      envelopes = @pubnub.paged_history(channel: "demo", page: 4, limit: 2, start: 16376215835141821, http_sync: false, callback: @callback)
      envelopes = envelopes.value
      expect(@fired_count).to eq 2

      envelopes.each do |envelope|
        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.error?).to eq false
        expect(envelope.status[:code]).to eq(200)
        expect(envelope.status[:category]).to eq(:ack)

        expect(envelope.result[:code]).to eq(200)
        expect(envelope.result[:operation]).to eq(:history)
      end

      expect(envelopes[0].result[:data]).to eq({:messages => [{"text" => "Test message #2"}, {"text" => "Test message #3"}], :end => 16376215835141820, :start => 16376215812842130})
      expect(envelopes[1].result[:data]).to eq({:messages => [{"text" => "Test message #1"}], :end => 16376215769471824, :start => 16376215769471824})
    end
  end

  # Test that rest of pages won't be filled because between two timetokens only 6 messages.
  it "paged_history___channel___demo____page__4___limit__2___start__16376216052005483___end__16376215880582193___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/paged_history_3", record: :none) do
      # 16376216052005483 should be incremented by one to make it inclusive.
      envelopes = @pubnub.paged_history(channel: "demo", page: 4, limit: 3, start: 16376216052005484, end: 16376215880582193, http_sync: false, callback: @callback)
      envelopes = envelopes.value
      expect(@fired_count).to eq 2

      envelopes.each do |envelope|
        expect(envelope.is_a?(Pubnub::Envelope)).to eq true
        expect(envelope.error?).to eq false
        expect(envelope.status[:code]).to eq(200)
        expect(envelope.status[:category]).to eq(:ack)

        expect(envelope.result[:code]).to eq(200)
        expect(envelope.result[:operation]).to eq(:history)
      end

      expect(envelopes[0].result[:data]).to eq({:messages => [{"text" => "Test message #8"}, {"text" => "Test message #9"}, {"text" => "Test message #10"}], :end => 16376216052005483, :start => 16376215974611464})
      expect(envelopes[1].result[:data]).to eq({:messages => [{"text" => "Test message #5"}, {"text" => "Test message #6"}, {"text" => "Test message #7"}], :end => 16376215943848282, :start => 16376215880582193})
    end
  end

  # Get all message prior specified date.
  it "paged_history___channel___demo____page_size__3___max__500___start__16376215943848282___end__nil__reverse__false___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/history/all_history_messages_1", record: :none) do
      # 16376215943848282 should be incremented by one to make it inclusive.
      envelope = @pubnub.all_history_messages(channel: "demo", page_size: 3, start: 16376215943848283, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(@fired_count).to eq 1
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({
                                             :messages => [
                                               {"message" => {"text" => "Test message #1"}, "timetoken" => 16376215769471824},
                                               {"message" => {"text" => "Test message #2"}, "timetoken" => 16376215812842130},
                                               {"message" => {"text" => "Test message #3"}, "timetoken" => 16376215835141820},
                                               {"message" => {"text" => "Test message #4"}, "timetoken" => 16376215858523321},
                                               {"message" => {"text" => "Test message #5"}, "timetoken" => 16376215880582193},
                                               {"message" => {"text" => "Test message #6"}, "timetoken" => 16376215916206736},
                                               {"message" => {"text" => "Test message #7"}, "timetoken" => 16376215943848282}
                                             ],
                                             :end => 16376215943848282, :start => 16376215769471824
                                           })
    end
  end

  # Get all message after specified date.
  it "paged_history___channel___demo____page_size__3___max__500___start__16376215858523321___end__nil__reverse__true___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/all_history_messages_2", record: :none) do
      # 16376215858523321 should be decremented by one to make it inclusive.
      envelope = @pubnub.all_history_messages(channel: "demo", page_size: 3, start: 16376215858523320, reverse: true, http_sync: true, callback: @callback)

      expect(@fired_count).to eq 1
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({
                                             :messages => [
                                               {"message" => {"text" => "Test message #4"}, "timetoken" => 16376215858523321},
                                               {"message" => {"text" => "Test message #5"}, "timetoken" => 16376215880582193},
                                               {"message" => {"text" => "Test message #6"}, "timetoken" => 16376215916206736},
                                               {"message" => {"text" => "Test message #7"}, "timetoken" => 16376215943848282},
                                               {"message" => {"text" => "Test message #8"}, "timetoken" => 16376215974611464},
                                               {"message" => {"text" => "Test message #9"}, "timetoken" => 16376216012185785},
                                               {"message" => {"text" => "Test message #10"}, "timetoken" => 16376216052005483}
                                             ],
                                             :end => 16376216052005483, :start => 16376215858523321
                                           })
    end
  end

  # Get all message in timeframe ignoring max value (because all messages between dates requested).
  it "paged_history___channel___demo____page_size__4___max__3___start__16377095731901577___end__16377095974621056__reverse__false___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/history/all_history_messages_3", record: :once) do
      # 16377095731901577 should be decremented by one to make it inclusive.
      envelope = @pubnub.all_history_messages(channel: "demo", page_size: 4, max: 3, start: 16377095731901576, end: 16377095974621056, http_sync: true, callback: @callback)

      expect(@fired_count).to eq 1
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:history)
      expect(envelope.result[:data]).to eq({
                                             :messages => [
                                               {"message" => {"text" => "Test message #1"}, "timetoken" => 16377095731901577},
                                               {"message" => {"text" => "Test message #2"}, "timetoken" => 16377095753435756},
                                               {"message" => {"text" => "Test message #3"}, "timetoken" => 16377095776142785},
                                               {"message" => {"text" => "Test message #4"}, "timetoken" => 16377095796303676},
                                               {"message" => {"text" => "Test message #5"}, "timetoken" => 16377095818104733},
                                               {"message" => {"text" => "Test message #6"}, "timetoken" => 16377095850534863},
                                               {"message" => {"text" => "Test message #7"}, "timetoken" => 16377095883609014},
                                               {"message" => {"text" => "Test message #8"}, "timetoken" => 16377095912474163},
                                               {"message" => {"text" => "Test message #9"}, "timetoken" => 16377095941299801},
                                               {"message" => {"text" => "Test message #10"}, "timetoken" => 16377095974621056}
                                             ],
                                             :end => 16377095974621056, :start => 16377095731901577
                                           })
    end
  end
end
