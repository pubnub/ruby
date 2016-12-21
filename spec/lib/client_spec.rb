require 'spec_helper'

describe Pubnub::Client do

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'has valid version constant' do
    expect(Pubnub::Client::VERSION).to match(/\d+\.\d+\..+/)
  end

  context '#initialize' do
    it 'returns new Pubnub::Client' do
      pubnub = Pubnub.new(subscribe_key: :key)
      expect(pubnub.is_a?(Pubnub::Client)).to eq true
    end

    it 'requires arguments' do
      expect { Pubnub.new }.to raise_error(Pubnub::InitializationError)
    end

    it 'by default sets Pubnub.logger that logs to pubnub.log' do
      _pubnub = Pubnub.new(subscribe_key: :key)
      expect(Pubnub.logger.instance_eval('@logdev').filename).to eq 'pubnub.log'
    end

    it 'sets Pubnub.logger to new one if given' do
      _rd, wr = IO.pipe

      logger = Logger.new(wr)
      _pubnub = Pubnub.new(subscribe_key: :key, logger: logger)
      expect(Pubnub.logger).to eq(logger)
    end

    it 'creates required pools' do
      pubnub = Pubnub.new(subscribe_key: 'key')

      # Connections
      expect(pubnub.env[:single_event_conn_pool]).to eq({})
      expect(pubnub.env[:subscribe_event_conn_pool]).to eq({})

      # Callback and error callbacks
      expect(pubnub.env[:c_cb_pool]).to eq({})
      expect(pubnub.env[:e_cb_pool]).to eq({})

      # Subscriptions
      expect(pubnub.env[:subscription_pool]).to eq({})
    end

    context 'parameters' do

      it 'changes string keys to sym keys' do
        pubnub = Pubnub.new('subscribe_key' => 'key')
        pubnub.env.each_key do |key|
          expect(key.class).to eq Symbol
        end
      end

      it 'removes empty parameters' do
        pubnub = Pubnub.new(publish_key: '', subscribe_key: 'key')
        expect(pubnub.env[:publish_key]).to eq(nil)
      end

      it 'does not remove non-empty parameters' do
        pubnub = Pubnub.new(publish_key: '', subscribe_key: 'key')
        expect(pubnub.env[:subscribe_key]).to eq('key')
      end

      context 'validates' do
        context 'parameter :origin' do
          it 'must be valid' do
            expect { Pubnub.new(origins_pool: 123, subscribe_key: 'key') }
            .to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(origins_pool: { a: :b }, subscribe_key: 'key') }
            .to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(origins_pool: nil, subscribe_key: 'key') }
            .not_to raise_error

            expect { Pubnub.new(origins_pool: '', subscribe_key: 'key') }
            .not_to raise_error

            expect { Pubnub.new(origins_pool: %w(http://a.com), subscribe_key: 'key') }
            .not_to raise_error
          end
        end

        context 'parameter :subscribe_key' do
          it 'is required' do
            expect { Pubnub.new(http_sync: true) }
            .to raise_error(Pubnub::InitializationError)
          end

          it 'must be valid' do
            expect { Pubnub.new(subscribe_key: 123) }
            .to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(subscribe_key: []) }
            .to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(subscribe_key: {}) }
            .to raise_error(Pubnub::InitializationError)

            expect { Pubnub.new(subscribe_key: 'key') }.not_to raise_error
            expect { Pubnub.new(subscribe_key: :key) }.not_to raise_error
          end
        end

        context 'parameter :publish_key' do
          it 'must be valid' do
            expect do
              Pubnub.new(subscribe_key: 'valid', publish_key: ['invalid'])
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(
                  subscribe_key: 'valid',
                  publish_key: { invalid: 'yeah' }
              )
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(subscribe_key: 'valid', publish_key: ['invalid'])
            end.to raise_error(Pubnub::InitializationError)

            expect do
              Pubnub.new(subscribe_key: 'valid', publish_key: 'key')
            end.not_to raise_error

            expect do
              Pubnub.new(subscribe_key: 'valid', publish_key: :key)
            end.not_to raise_error
          end
        end
      end
    end
  end

  context 'timetoken manipulation' do
    let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo') }

    context '#timetoken' do
      it 'returns timetoken hold in env' do
        pubnub_client.env[:timetoken] = '0987654321'
        expect(pubnub_client.timetoken).to eq '0987654321'
      end
    end

    context '#timetoken=' do
      it 'sets given timetoken in env' do
        pubnub_client.timetoken = '1234567890'
        expect(pubnub_client.env[:timetoken]).to eq '1234567890'
      end
    end
  end

  context 'callback listeners' do
    let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo') }

    it 'can be added' do
      callbacks = Pubnub::SubscribeCallback.new(
          message:  ->(_envelope) {},
          presence: ->(_envelope) {},
          status:   ->(_envelope) {}
      )

      expect(pubnub_client.subscribed?).to eq false

      pubnub_client.add_listener(
                       callback: callbacks,
                       name: :callbacks
      )

      expect(pubnub_client.subscriber.listeners[:callbacks]).not_to be_nil

      expect(pubnub_client.subscribed?).to eq false # we have callbacks but we're not subscribed yet
    end

    it 'can be removed' do
      callbacks = Pubnub::SubscribeCallback.new(
          message:  ->(_envelope) {},
          presence: ->(_envelope) {},
          status:   ->(_envelope) {}
      )

      pubnub_client.add_listener(
          callback: callbacks,
          name: :callbacks
      )

      expect(pubnub_client.subscriber.listeners[:callbacks]).not_to be_nil

      pubnub_client.remove_listener(name: :callbacks)

      expect(pubnub_client.subscriber.listeners[:callbacks]).to be_nil

      pubnub_client.add_listener(
          callback: callbacks
      )

      expect(pubnub_client.subscriber.listeners).not_to be_empty

      pubnub_client.remove_listener(callback: callbacks)

      expect(pubnub_client.subscriber.listeners).to be_empty
    end
  end

  context 'helper methods' do
    let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo') }

    it 'can change uuid while not subscribed' do
      expect(pubnub_client.change_uuid('whatever')).to eq 'whatever'
    end

    it 'cannot change uuid when subscribed' do
      pubnub_client.subscribe(channel: :demo)

      expect { pubnub_client.change_uuid('whatever') }.to raise_error(RuntimeError)
    end

    it 'can show what channels are subscribed' do
      expect(pubnub_client.subscribed?).to eq(false)
      pubnub_client.subscribe(channel: ['demo', 'demo.*'], presence: 'demo', group: 'demo')
      expect(pubnub_client.subscribed?).to eq(true)

      expect(pubnub_client.subscribed_to).to eq(channel: ['demo', 'demo-pnpres', 'demo.*'], group: ['demo'])
      expect(pubnub_client.subscribed_to(true)).to eq(channel: ['demo', 'demo-pnpres'], wildcard_channel: ['demo.*'], group: ['demo'])
    end
  end

  # context 'connections pool' do
  #   let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo', publish_key: 'demo') }
  #
  #   around :each do |example|
  #     Celluloid.boot
  #     example.run
  #     Celluloid.shutdown
  #   end
  #
  #   context '#connection_for' do
  #     it 'returns connection for non-subscribe events' do
  #       VCR.use_cassette('client/connection-for-non-subscribe', :record => :once) do
  #         pubnub_client.publish(message: :test, channel: :test, http_sync: true)
  #       end
  #
  #       expect(pubnub_client.env[:single_event_conn_pool]['ps.pndsn.com'].is_a?(Net::HTTP::Persistent)).to eq true
  #     end
  #
  #     it 'returns connection for subscribe events' do
  #       VCR.use_cassette('client/connection-for-subscribe', :record => :once) do
  #         pubnub_client.subscribe(channel: :test, http_sync: true)
  #       end
  #
  #       expect(pubnub_client.env[:subscribe_event_conn_pool]['ps.pndsn.com'].is_a?(Net::HTTP::Persistent)).to eq true
  #     end
  #   end
  #
  #   context '#setup_conn_for' do
  #     it 'creates connection for non-subscribe events' do
  #       expect(pubnub_client.env[:single_event_conn_pool]['ps.pndsn.com'].is_a?(NilClass)).to eq true
  #
  #       VCR.use_cassette('client/connection-for-non-subscribe', :record => :once) do
  #         pubnub_client.publish(message: :test, channel: :test, http_sync: true)
  #       end
  #
  #       expect(pubnub_client.env[:single_event_conn_pool]['ps.pndsn.com'].is_a?(Net::HTTP::Persistent)).to eq true
  #     end
  #
  #     it 'creates connection for subscribe events' do
  #       expect(pubnub_client.env[:subscribe_event_conn_pool]['ps.pndsn.com'].is_a?(NilClass)).to eq true
  #
  #       VCR.use_cassette('client/connection-for-subscribe', :record => :once) do
  #         pubnub_client.subscribe(channel: :test, http_sync: true)
  #       end
  #
  #       expect(pubnub_client.env[:subscribe_event_conn_pool]['ps.pndsn.com'].is_a?(Net::HTTP::Persistent)).to eq true
  #     end
  #   end
  # end

end
