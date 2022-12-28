require 'helpers/spec_helper'

describe Pubnub::Audit do
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

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/11", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186843"
      Pubnub::Audit.any_instance.stub(:signature).and_return "QYT-McoRqpPCoXnKTZ3cGs5Ad0IUXQgiMfyO2wrto-o="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/9", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186844"
      Pubnub::Audit.any_instance.stub(:signature).and_return "QXwMqXUiKbL8-Lbho-KVx2BjQAgkrrcK3W5D3vN-B7E="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/10", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186844"
      Pubnub::Audit.any_instance.stub(:signature).and_return "QXwMqXUiKbL8-Lbho-KVx2BjQAgkrrcK3W5D3vN-B7E="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/8", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187175"
      Pubnub::Audit.any_instance.stub(:signature).and_return "fXZ_XH3NJl8fGfcrKUMoRseS_zjBncur_uAA9oRoxs4="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/6", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187023"
      Pubnub::Audit.any_instance.stub(:signature).and_return "LZ3T5rp8BCnQRVBA6fsmU6l_UDgjLjVHyXp3tlou1zY="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo___channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/7", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186846"
      Pubnub::Audit.any_instance.stub(:signature).and_return "tc9XOqQGC3Qp123bP_MN45y9qrEIv2cdhP0OsWwo1bc="
      envelope = @pubnub.audit(auth_key: "key", channel: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/5", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186847"
      Pubnub::Audit.any_instance.stub(:signature).and_return "VQtsxNpNl8fCdTBt2VtZvblP5M7_xKQfV2cH1QJ9y0U="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/3", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186848"
      Pubnub::Audit.any_instance.stub(:signature).and_return "NXoP5si5ESsJjDhJck3EpkhfEeB49Km0R9w-XSutrto="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/4", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186848"
      Pubnub::Audit.any_instance.stub(:signature).and_return "NXoP5si5ESsJjDhJck3EpkhfEeB49Km0R9w-XSutrto="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/2", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187024"
      Pubnub::Audit.any_instance.stub(:signature).and_return "29x7wwIMVzIsnIo-pb6Yj0cxRMM1V_IkjePBFvQ169w="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/0", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186849"
      Pubnub::Audit.any_instance.stub(:signature).and_return "HUsH3eyTPCiYR_5gQ2YefizV6SswirTY5eaGHhsXbGw="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel___demo____channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/1", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187176"
      Pubnub::Audit.any_instance.stub(:signature).and_return "zxDcoxKlyAvaeNvZ-W8i5DfEyQd2n_F-xrZtRbBAy4I="
      envelope = @pubnub.audit(auth_key: "key", channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/23", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186850"
      Pubnub::Audit.any_instance.stub(:signature).and_return "e7K35-o7JSo_hb9BQ-mngvBeLSehMkK9WRmyXDgNnYs="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/21", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186852"
      Pubnub::Audit.any_instance.stub(:signature).and_return "DYgPQnA92yetJq9KbQxSsLhRGHlaNHnjSRYIvLPSitA="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/22", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186853"
      Pubnub::Audit.any_instance.stub(:signature).and_return "49a7LhCsjBuTvkU9K9ykAc9Lkx6AxgrS1XG889huW1k="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/20", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186853"
      Pubnub::Audit.any_instance.stub(:signature).and_return "49a7LhCsjBuTvkU9K9ykAc9Lkx6AxgrS1XG889huW1k="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/18", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187177"
      Pubnub::Audit.any_instance.stub(:signature).and_return "bbwfIwB8oOCFDEsGasGCcRxaP47z00fvfDQQmXJpSa0="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/19", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186854"
      Pubnub::Audit.any_instance.stub(:signature).and_return "M-KnF7e_7v-iUn3SO8PGkXy02SQREti9_YtlphWc8Qs="
      envelope = @pubnub.audit(auth_key: "key", channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/17", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186855"
      Pubnub::Audit.any_instance.stub(:signature).and_return "NA1NFJPGb5pWDbpizMeomPRyeVFS-WLHpqHZaKCaF38="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/15", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186856"
      Pubnub::Audit.any_instance.stub(:signature).and_return "tHV8HKGgqs3x3gobrvkqQDIvJ6Toez0Yoqd4NwxFdow="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/16", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186856"
      Pubnub::Audit.any_instance.stub(:signature).and_return "tHV8HKGgqs3x3gobrvkqQDIvJ6Toez0Yoqd4NwxFdow="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/14", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187026"
      Pubnub::Audit.any_instance.stub(:signature).and_return "UEIbIDJHe4JwvFBnRnIpasW0eMk_bomC8-eaiOKFH08="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/12", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186857"
      Pubnub::Audit.any_instance.stub(:signature).and_return "rmHnzE7AJ44yE24WnHYBJ7qXNUV_VO-9nLfk2n4I8H8="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/13", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187179"
      Pubnub::Audit.any_instance.stub(:signature).and_return "47CV5KR4pEoYKTS6_q4y3vXOjzq9DYC9dRpWz-4glzM="
      envelope = @pubnub.audit(auth_key: "key", channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/29", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186858"
      Pubnub::Audit.any_instance.stub(:signature).and_return "dgjBlW8dNAdEpyi8Mv7QcXY9_cxvrTlhCPnEsiexPJU="
      envelope = @pubnub.audit(auth_key: "key", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 287}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1441}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1441, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 137}}}}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/27", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186860"
      Pubnub::Audit.any_instance.stub(:signature).and_return "u1l9yustVc-pGEn0HlJOhIS92jZZ-t0f5pUxHtnY96c="
      envelope = @pubnub.audit(auth_key: "key", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 287}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1441, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 137}}}}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/28", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186862"
      Pubnub::Audit.any_instance.stub(:signature).and_return "rDnYUUgtiji8KV5x3aynVC6UtxyamTvA_A8vyoVgxP8="
      envelope = @pubnub.audit(auth_key: "key", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 287}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 137}}}}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/26", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187180"
      Pubnub::Audit.any_instance.stub(:signature).and_return "9wkrJlRhyUBRqSlFvTbNTWn-xKLvzL11IzhCnf0oqec="
      envelope = @pubnub.audit(auth_key: "key", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 131}}}}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/24", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187181"
      Pubnub::Audit.any_instance.stub(:signature).and_return "tsn5u0yycPJCZYK-vkbQ2oF18TtXsSlJYufJkjo8TWA="
      envelope = @pubnub.audit(auth_key: "key", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 131}}}}})
    end
  end

  it "__auth_key___key____channel__nil___channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/25", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186863"
      Pubnub::Audit.any_instance.stub(:signature).and_return "9RN6L5X-Nu3T12G5ZWloZCk3c0CEr0SvnSmR7R5WdGE="
      envelope = @pubnub.audit(auth_key: "key", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 287}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 137}}}}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/41", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464697015"
      Pubnub::Audit.any_instance.stub(:signature).and_return "5ZfjOxWir6bGaGkEP4eUH-767wTFN_ssDaoWep4Hkb0="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/39", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186866"
      Pubnub::Audit.any_instance.stub(:signature).and_return "usnDxndAATqV1coJa4gi98wXpZqZeABZfVnaB8Wj1qw="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/40", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186867"
      Pubnub::Audit.any_instance.stub(:signature).and_return "ABUVcFuZjtM-cwXrzr75SnERRqEaVkvc-W0WoB4tWTQ="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/38", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464697103"
      Pubnub::Audit.any_instance.stub(:signature).and_return "BE23sz5fM0NFfOnj5tY517l-kDbUt9k-gHToxlZ31oc="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/36", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187183"
      Pubnub::Audit.any_instance.stub(:signature).and_return "cDNc_FY2QVP6yEC_G0IILwDxYKppEmHsWTV3HN8nas8="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo___channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/37", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187029"
      Pubnub::Audit.any_instance.stub(:signature).and_return "owH-615JpjXjMH9BE-wqxSwHQb2iNT7GZAfuiNDV13A="
      envelope = @pubnub.audit(auth_key: :key, channel: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/35", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186868"
      Pubnub::Audit.any_instance.stub(:signature).and_return "xsUvKRUuuN2uvZxPusRjwUoR8A_aAlGrVad6mwTVWBg="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/33", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186870"
      Pubnub::Audit.any_instance.stub(:signature).and_return "pHjJryzjA3ZV9KbsGXRPfj97hAxptOGFiwO-Mr8Rq6Y="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/34", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186870"
      Pubnub::Audit.any_instance.stub(:signature).and_return "pHjJryzjA3ZV9KbsGXRPfj97hAxptOGFiwO-Mr8Rq6Y="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/32", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186871"
      Pubnub::Audit.any_instance.stub(:signature).and_return "B0RNLxxNNLm7iRCUv9mSQLg1YUORR35yFQsm86tNfWw="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/30", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186872"
      Pubnub::Audit.any_instance.stub(:signature).and_return "-h7c12J12qAHVvyFZExhv8DXo_C6ZOCz6Q-MwMvxrrE="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel___demo____channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/31", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187184"
      Pubnub::Audit.any_instance.stub(:signature).and_return "NNkSqfTwlGTTYyZwz6ZkM8a92ZvDAaFRbwDwQAe-L2Q="
      envelope = @pubnub.audit(auth_key: :key, channel: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "user", "subscribe_key" => "sub-a-mock-key", "channel" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/53", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186873"
      Pubnub::Audit.any_instance.stub(:signature).and_return "Lb6Q2aZk5IB2Lrkwo25GtV1d34JHMG136w7tWf295rA="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/51", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186873"
      Pubnub::Audit.any_instance.stub(:signature).and_return "Lb6Q2aZk5IB2Lrkwo25GtV1d34JHMG136w7tWf295rA="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/52", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186874"
      Pubnub::Audit.any_instance.stub(:signature).and_return "PM7ONrJcAeIVvVMW4t8rPTu-eCCqwHNL4NX8J4rHyh8="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/50", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186875"
      Pubnub::Audit.any_instance.stub(:signature).and_return "8Liys-fFEhn5tIacHdq2AweRaTfgqaCLWd3i04WjEgs="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/48", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186875"
      Pubnub::Audit.any_instance.stub(:signature).and_return "8Liys-fFEhn5tIacHdq2AweRaTfgqaCLWd3i04WjEgs="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/49", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186876"
      Pubnub::Audit.any_instance.stub(:signature).and_return "Z8ak07OMYU0nwKFi-i2AgeIGT0zMTmMgH6XChQM8En4="
      envelope = @pubnub.audit(auth_key: :key, channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/47", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186876"
      Pubnub::Audit.any_instance.stub(:signature).and_return "Z8ak07OMYU0nwKFi-i2AgeIGT0zMTmMgH6XChQM8En4="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/45", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186877"
      Pubnub::Audit.any_instance.stub(:signature).and_return "I86HpxwUA17o4B9wJDUMYByE_Pl02-3zSV2zvCl57Ms="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/46", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186878"
      Pubnub::Audit.any_instance.stub(:signature).and_return "1DbUmg1E5EtNd_ngB11_3sxl-Z7vEZdvhyiCGmrdvys="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/44", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187185"
      Pubnub::Audit.any_instance.stub(:signature).and_return "pflH9F0DGUisemPrvn7_hkBpcQsf0ccHQJBZvzkPpio="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/42", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187030"
      Pubnub::Audit.any_instance.stub(:signature).and_return "cn9x4223RiNmk54DsBZ5Nym6b--AUOTcT4fwM9dJ2jw="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/43", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187187"
      Pubnub::Audit.any_instance.stub(:signature).and_return "z9WKikWdsOotjTwmqs5lf1YLz1j1f8Q_A06BN1zriPo="
      envelope = @pubnub.audit(auth_key: :key, channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group+auth", "subscribe_key" => "sub-a-mock-key", "channel-group" => "demo", "auths" => {}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/59", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186880"
      Pubnub::Audit.any_instance.stub(:signature).and_return "o6qOMJqHZ8kwc6QFD3ZCQY1w1CqRfnHAGaR3-tnAFf0="
      envelope = @pubnub.audit(auth_key: :key, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 286}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1441, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/57", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186882"
      Pubnub::Audit.any_instance.stub(:signature).and_return "lkXa7M-JXUXCvodcGfKRiUlYf8fg0hfVwngEGK6zN9g="
      envelope = @pubnub.audit(auth_key: :key, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 286}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/58", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186885"
      Pubnub::Audit.any_instance.stub(:signature).and_return "pZjPZucMs0WP_2awPTm8_ms-_Pc2OF_lwrgfvHAF0dw="
      envelope = @pubnub.audit(auth_key: :key, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 0, "ttl" => 286}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 9}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/56", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187188"
      Pubnub::Audit.any_instance.stub(:signature).and_return "qNi51Jq8iMdZzM5sPRlfzmovZTvXx3YqSl2s2NwnXwE="
      envelope = @pubnub.audit(auth_key: :key, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 131}}}}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/54", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187031"
      Pubnub::Audit.any_instance.stub(:signature).and_return "7v-HexlXeKhnJ2BajRS2p97U4d6FFGtMakx1JrTMV3M="
      envelope = @pubnub.audit(auth_key: :key, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 6}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 6}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 134}}}}})
    end
  end

  it "__auth_key___key___channel__nil___channel_group__nil___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/55", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187189"
      Pubnub::Audit.any_instance.stub(:signature).and_return "KegVli9MqXXPj3L-awtHyK-ekzfDXGw4k-3esnltka0="
      envelope = @pubnub.audit(auth_key: :key, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "subkey", "subscribe_key" => "sub-a-mock-key", "channels" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}, "ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo-pnpres" => {"r" => 1, "m" => 1, "w" => 1, "auths" => {"ADMIN-hb89skz71v" => {"r" => 1, "m" => 0, "w" => 1, "ttl" => 4}}}, "demo.*" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}, "objects" => {}, "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 131}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/71", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464697104"
      Pubnub::Audit.any_instance.stub(:signature).and_return "EQJKSlERla2RqqCa8ieN1-5yZcskBULnIz6YUqKSq8Q="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1439}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/69", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464697105"
      Pubnub::Audit.any_instance.stub(:signature).and_return "WCmluR0sUF-xGs8gksI2ZQU6w5VxZ55BhK3bo8jV1Bk="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/70", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186889"
      Pubnub::Audit.any_instance.stub(:signature).and_return "8g09A0BvUXUKgLwPFstHy9A44w4VI6qNW9-NqKafBaU="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/68", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187033"
      Pubnub::Audit.any_instance.stub(:signature).and_return "8eDkK8LRPtT_VnfyU1otEfGmKfi284g0gDS6yytGCQo="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 134}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/66", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186890"
      Pubnub::Audit.any_instance.stub(:signature).and_return "EFlQZ2fQ756aPBryetYFd6EFMEuj1Ke9oCW5BpkFAi4="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo___http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/67", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187033"
      Pubnub::Audit.any_instance.stub(:signature).and_return "8eDkK8LRPtT_VnfyU1otEfGmKfi284g0gDS6yytGCQo="
      envelope = @pubnub.audit(channel_group: :demo, http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 134}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/audit/65", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186891"
      Pubnub::Audit.any_instance.stub(:signature).and_return "llWHzSYMTpc24K92E6ZhBACHbCOGqS4Dg-Fo94PjpR8="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__true___callback___block_" do
    VCR.use_cassette("examples/audit/63", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186892"
      Pubnub::Audit.any_instance.stub(:signature).and_return "0Y4khklcMAg1rSpr4z-G_Hu7EjLWVWwgWJUEbRy7uVc="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__true___callback___lambda_" do
    VCR.use_cassette("examples/audit/64", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464186893"
      Pubnub::Audit.any_instance.stub(:signature).and_return "xGfzbLCBFZQLiRjO47QkfQ_6wtm_dAtFxWw85moUuGM="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 136}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/audit/62", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187190"
      Pubnub::Audit.any_instance.stub(:signature).and_return "re-CZsBJXIV7q-ySlvmf57h5QoY2yDID6wNztkL4aWs="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 131}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__false___callback___block_" do
    VCR.use_cassette("examples/audit/60", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187229"
      Pubnub::Audit.any_instance.stub(:signature).and_return "EM6BOT3BYNZt7kopcHA-WrncvnSwE4Ghlj75IjZ4gdM="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: false, &@callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 130}}}}})
    end
  end

  it "__auth_key__nil___channel__nil___channel_group___demo____http_sync__false___callback___lambda_" do
    VCR.use_cassette("examples/audit/61", record: :none) do
      Pubnub::Audit.any_instance.stub(:current_time).and_return "1464187230"
      Pubnub::Audit.any_instance.stub(:signature).and_return "Eesqu6eJcmypG3KGURLJO8Qd_Z0ZsmyH9YJPCDaOeak="
      envelope = @pubnub.audit(channel_group: "demo", http_sync: false, callback: @callback)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:audit)
      expect(envelope.result[:data]).to eq({"level" => "channel-group", "subscribe_key" => "sub-a-mock-key", "channel-groups" => {"demo" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 1440, "auths" => {"ruby-authkey" => {"r" => 1, "m" => 1, "w" => 1, "ttl" => 130}}}}})
    end
  end
end
