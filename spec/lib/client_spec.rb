require "spec_helper"

describe Pubnub::Client do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  it "has valid version constant" do
    expect(Pubnub::Client::VERSION).to match(/\d+\.\d+\..+/)
  end

  context "#initialize" do
    it "returns new Pubnub::Client" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :key)
      expect(pubnub.is_a?(Pubnub::Client)).to eq true
    end

    it "requires arguments" do
      expect { Pubnub.new }.to raise_error(Pubnub::InitializationError)
    end

    it "requires uuid" do
      expect { Pubnub.new(subscribe_key: :key) }.to raise_error(Pubnub::InitializationError)
    end

    it "by default sets Pubnub.logger that logs to pubnub.log" do
      _pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :key)
      expect(Pubnub.logger.instance_eval("@logdev").filename).to eq "pubnub.log"
    end

    it "sets Pubnub.logger to new one if given" do
      _rd, wr = IO.pipe

      logger = Logger.new(wr)
      _pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :key, logger: logger)
      expect(Pubnub.logger).to eq(logger)
    end

    it "creates required pools" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "key")

      # Connections
      expect(pubnub.env[:single_event_conn_pool]).to eq({})
      expect(pubnub.env[:subscribe_event_conn_pool]).to eq({})

      # Callback and error callbacks
      expect(pubnub.env[:c_cb_pool]).to eq({})
      expect(pubnub.env[:e_cb_pool]).to eq({})

      # Subscriptions
      expect(pubnub.env[:subscription_pool]).to eq({})
    end

    context "parameters" do
      it "changes string keys to sym keys" do
        pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, "subscribe_key" => "key")
        pubnub.env.each_key do |key|
          expect(key.class).to eq Symbol
        end
      end

      it "removes empty parameters" do
        pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, publish_key: "", subscribe_key: "key")
        expect(pubnub.env[:publish_key]).to eq(nil)
      end

      it "does not remove non-empty parameters" do
        pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, publish_key: "", subscribe_key: "key")
        expect(pubnub.env[:subscribe_key]).to eq("key")
      end

      context "validates" do
        context "parameter :origin" do
          it "must be valid" do
            expect { Pubnub.new(uuid: Pubnub::UUID.generate, origin: 123, subscribe_key: "key") }.to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, origin: {a: :b}, subscribe_key: "key") }.to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, origin: nil, subscribe_key: "key") }.not_to raise_error

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, origin: "", subscribe_key: "key") }.not_to raise_error

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, origin: "http://a.com", subscribe_key: "key") }.not_to raise_error
          end
        end

        context "parameter :subscribe_key" do
          it "is required" do
            expect { Pubnub.new(uuid: Pubnub::UUID.generate, http_sync: true) }.to raise_error(Pubnub::InitializationError)
          end

          it "must be valid" do
            expect { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: 123) }.to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: []) }.to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: {}) }.to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "key") }.not_to raise_error
            expect { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :key) }.not_to raise_error
          end
        end

        context "parameter :publish_key" do
          it "must be valid" do
            expect do
              Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "valid", publish_key: ["invalid"])
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(uuid: Pubnub::UUID.generate, 
                subscribe_key: "valid",
                publish_key: {invalid: "yeah"},
              )
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "valid", publish_key: ["invalid"])
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "valid", publish_key: "key")
            end.not_to raise_error

            expect do
              Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "valid", publish_key: :key)
            end.not_to raise_error
          end
        end
      end
    end
  end

  context "timetoken manipulation" do
    let(:pubnub_client) { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "demo") }

    context "#timetoken" do
      it "returns timetoken hold in env" do
        pubnub_client.env[:timetoken] = "0987654321"
        expect(pubnub_client.timetoken).to eq "0987654321"
      end
    end

    context "#timetoken=" do
      it "sets given timetoken in env" do
        pubnub_client.timetoken = "1234567890"
        expect(pubnub_client.env[:timetoken]).to eq "1234567890"
      end
    end
  end

  context "callback listeners" do
    let(:pubnub_client) { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "demo") }

    it "can be added" do
      callbacks = Pubnub::SubscribeCallback.new(
        message: -> (_envelope) { },
        presence: -> (_envelope) { },
        status: -> (_envelope) { },
      )

      expect(pubnub_client.subscribed?).to eq false

      pubnub_client.add_listener(
        callback: callbacks,
        name: :callbacks,
      )

      expect(pubnub_client.subscriber.listeners[:callbacks]).not_to be_nil

      expect(pubnub_client.subscribed?).to eq false # we have callbacks but we're not subscribed yet
    end

    it "can be removed" do
      callbacks = Pubnub::SubscribeCallback.new(
        message: -> (_envelope) { },
        presence: -> (_envelope) { },
        status: -> (_envelope) { },
      )

      pubnub_client.add_listener(
        callback: callbacks,
        name: :callbacks,
      )

      expect(pubnub_client.subscriber.listeners[:callbacks]).not_to be_nil

      pubnub_client.remove_listener(name: :callbacks)

      expect(pubnub_client.subscriber.listeners[:callbacks]).to be_nil

      pubnub_client.add_listener(
        callback: callbacks,
      )

      expect(pubnub_client.subscriber.listeners).not_to be_empty

      pubnub_client.remove_listener(callback: callbacks)

      expect(pubnub_client.subscriber.listeners).to be_empty
    end
  end

  context "helper methods" do
    let(:pubnub_client) { Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: "demo") }

    it "can change uuid while not subscribed" do
      expect(pubnub_client.change_uuid("whatever")).to eq "whatever"
    end

    it "cannot change uuid when subscribed" do
      pubnub_client.subscribe(channel: :demo)

      expect { pubnub_client.change_uuid("whatever") }.to raise_error(RuntimeError)
    end

    it "cannot change uuid to empty" do
      expect { pubnub_client.change_uuid("") }.to raise_error(Pubnub::InitializationError)
    end

    it "can show what channels are subscribed" do
      expect(pubnub_client.subscribed?).to eq(false)
      pubnub_client.subscribe(channel: ["demo", "demo.*"], presence: "demo", group: "demo")
      expect(pubnub_client.subscribed?).to eq(true)

      expect(pubnub_client.subscribed_to).to eq(channel: ["demo", "demo-pnpres", "demo.*"], group: ["demo"])
      expect(pubnub_client.subscribed_to(true)).to eq(channel: ["demo", "demo-pnpres"], wildcard_channel: ["demo.*"], group: ["demo"])
    end
  end

  context "connections" do
    it "are keep_alive by default" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :demo, publish_key: :demo)

      VCR.use_cassette("lib/client/keep_alive_default", record: :once) do
        pubnub.subscribe(channel: :demo)

        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:subscribe_event].tcp_keepalive).to eq true }
        pubnub.leave(channel: :demo)
      end
    end

    it "respect :disable_keep_alive" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :demo, publish_key: :demo, disable_keepalive: true)

      VCR.use_cassette("lib/client/keep_alive_disabled", record: :once) do
        pubnub.subscribe(channel: :demo)

        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:subscribe_event].tcp_keepalive).to eq false }
        pubnub.leave(channel: :demo)
      end
    end

    it "respect :disable_subscribe_keep_alive init parameter" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :demo, publish_key: :demo, disable_subscribe_keepalive: true)

      VCR.use_cassette("lib/client/keep_alive_disable_subscribe_keep_alive", record: :once) do
        pubnub.subscribe(channel: :demo)

        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:subscribe_event].tcp_keepalive).to eq false }
        pubnub.leave(channel: :demo)

        pubnub.publish(channel: :demo, message: :whatever)
        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:single_event].tcp_keepalive).to eq true }
      end
    end

    it "respect :disable_non_subscribe_keep_alive init parameter" do
      pubnub = Pubnub.new(uuid: Pubnub::UUID.generate, subscribe_key: :demo, publish_key: :demo, disable_non_subscribe_keepalive: true)

      VCR.use_cassette("lib/client/keep_alive_disable_non_subscribe_keep_alive", record: :once) do
        pubnub.subscribe(channel: :demo)

        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:subscribe_event].tcp_keepalive).to eq true }
        pubnub.leave(channel: :demo)

        pubnub.publish(channel: :demo, message: :whatever)
        eventually { expect(pubnub.env[:req_dispatchers_pool][:async]["ps.pndsn.com"][:single_event].tcp_keepalive).to eq false }
      end
    end
  end
end
