require 'spec_helper'

shared_examples 'an event' do

  around(:each) do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'is a Celluloid actor' do
    expect(
        described_class.ancestors
        .select { |o| o.class == Module }.include? Celluloid
    ).to eq true
  end

  context '#initialize' do
    let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo') }

    it 'sets Pubnub::Client as @app' do
      event = described_class.new({ channel: 'channel' }, pubnub_client)
      expect(event.instance_variable_get('@app')).to eq pubnub_client
    end

    it 'logs when initialized' do
      rd, wr = IO.pipe
      logger = Logger.new(wr)
      pubnub = Pubnub.new(subscribe_key: :key, logger: logger)

      described_class.new({ channel: 'channel' }, pubnub)

      wr.close
      messages = rd.read

      expect(messages)
      .to match(/.*Initialized\s#{described_class}.*/)
    end


    it 'creates specific instance variables from options' do
      vars = [:@origin, :@channel, :@message, :@http_sync, :@callback,
              :@error_callback, :@connect_callback, :@ssl, :@cipher_key,
              :@secret_key, :@auth_key, :@publish_key, :@subscribe_key,
              :@timetoken, :@channels]

      event = described_class.new({ channel: 'channel' }, pubnub_client)
      expect(vars - event.instance_variables).to eq []
    end

    context 'variables' do
      it 'merges variables from app and options' do
        event = described_class.new({ channel: 'chan' }, pubnub_client)
        expect(event.instance_variable_get(:@subscribe_key)).to eq 'demo'
        if described_class == Pubnub::Presence
          expect(event.instance_variable_get(:@channel)).to       eq ['chan-pnpres']
        else
          expect(event.instance_variable_get(:@channel)).to       eq ['chan']
        end
      end

      it 'merges variables from app and options overwriting apps' do
        event = described_class.new({ subscribe_key: 'key' }, pubnub_client)
        expect(event.instance_variable_get(:@subscribe_key)).to eq 'key'
      end

      context '@channel' do
        if described_class == Pubnub::Presence
          it 'is set properly when passed as :channels' do
            event = described_class.new({ channels: 'chan' }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['chan-pnpres']
          end

          it 'is formatted to be an array' do
            event = described_class.new({ channel: 'chan' }, pubnub_client)
            expect(event.instance_variable_get(:@channel).class)
                .to eq Array
          end

          it 'is formatted when given as string' do
            event = described_class.new({ channel: '!with spec&' }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['%21with%20spec%26-pnpres']
          end

          it 'is formatted when given as symbol' do
            event = described_class.new({ channel: :demo }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['demo-pnpres']
          end

          it 'is formatted when given as array' do
            event = described_class.new(
                { channel: ['!with spec&', 'othe&r', 'th ir*!d', :four] },
                pubnub_client
            )
            expect(event.instance_variable_get(:@channel))
                .to eq ['%21with%20spec%26-pnpres', 'othe%26r-pnpres', 'th%20ir*%21d-pnpres', 'four-pnpres']
          end
        else
          it 'is set properly when passed as :channels' do
            event = described_class.new({ channels: 'chan' }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['chan']
          end

          it 'is formatted to be an array' do
            event = described_class.new({ channel: 'chan' }, pubnub_client)
            expect(event.instance_variable_get(:@channel).class)
                .to eq Array
          end

          it 'is formatted when given as string' do
            event = described_class.new({ channel: '!with spec&' }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['%21with%20spec%26']
          end

          it 'is formatted when given as symbol' do
            event = described_class.new({ channel: :demo }, pubnub_client)
            expect(event.instance_variable_get(:@channel))
                .to eq ['demo']
          end

          it 'is formatted when given as array' do
            event = described_class.new(
                { channel: ['!with spec&', 'othe&r', 'th ir*!d', :four] },
                pubnub_client
            )
            expect(event.instance_variable_get(:@channel))
                .to eq ['%21with%20spec%26', 'othe%26r', 'th%20ir*%21d', 'four']
          end
        end
      end
    end
  end
end
