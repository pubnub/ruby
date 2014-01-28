require 'spec_helper'

describe Pubnub::Client do
  it 'has valid version constant' do
    expect(Pubnub::Client::VERSION).to match(/\d+\.\d+\..+/)
  end

  context '#inititalize' do
    it 'requires arguments' do
      expect{ Pubnub.new() }.to raise_error
    end

    context 'parameter :subscribe_key' do
      it 'is required' do
        expect{ Pubnub.new(:http_sync => true) }.to raise_error(Pubnub::InitializationError)
      end

      it 'must be valid' do
        expect{ Pubnub.new(:subscribe_key => 123) }.to raise_error(Pubnub::InitializationError)
        expect{ Pubnub.new(:subscribe_key => [] ) }.to raise_error(Pubnub::InitializationError)
        expect{ Pubnub.new(:subscribe_key => {} ) }.to raise_error(Pubnub::InitializationError)

        expect{ Pubnub.new(:subscribe_key => 'key') }.not_to raise_error
        expect{ Pubnub.new(:subscribe_key => :key ) }.not_to raise_error
      end
    end

    context 'parameter :publish_key' do
      it 'must be valid' do
        expect{ Pubnub.new(:subscribe_key => 'valid', :publish_key => ['invalid']) }.to raise_error(Pubnub::InitializationError)
        expect{ Pubnub.new(:subscribe_key => 'valid', :publish_key => {'invalid' => 'yeah'}) }.to raise_error(Pubnub::InitializationError)
        expect{ Pubnub.new(:subscribe_key => 'valid', :publish_key => ['invalid']) }.to raise_error(Pubnub::InitializationError)

        expect{ Pubnub.new(:subscribe_key => 'valid', :publish_key => 'key') }.not_to raise_error
        expect{ Pubnub.new(:subscribe_key => 'valid', :publish_key => :key ) }.not_to raise_error
      end
    end

    context 'setups @env instance variable' do
      before(:each) do
        @defaults = {
            :error_callback             => Pubnub::Configuration::DEFAULT_ERROR_CALLBACK,
            :connect_callback           => Pubnub::Configuration::DEFAULT_CONNECT_CALLBACK,
            :ssl                        => Pubnub::Configuration::DEFAULT_SSL,
            :timetoken                  => Pubnub::Configuration::DEFAULT_TIMETOKEN,
            :port                       => Pubnub::Configuration::DEFAULT_CONNECTION_PORT,
            :origin                     => Pubnub::Configuration::DEFAULT_ORIGIN,
            :subscribe_timeout          => Pubnub::Configuration::DEFAULT_SUBSCRIBE_TIMEOUT,
            :timeout                    => Pubnub::Configuration::DEFAULT_NON_SUBSCRIBE_TIMEOUT,
            :max_retries                => Pubnub::Configuration::MAX_RETRIES,
            :non_subscribe_timeout      => Pubnub::Configuration::DEFAULT_NON_SUBSCRIBE_TIMEOUT,
            :reconnect_max_attempts     => Pubnub::Configuration::DEFAULT_RECONNECT_ATTEMPTS,
            :reconnect_retry_interval   => Pubnub::Configuration::DEFAULT_RECONNECT_INTERVAL,
            :reconnect_response_timeout => Pubnub::Configuration::DEFAULT_RECONNECT_RESPONSE_TIMEOUT,
            :ttl                        => Pubnub::Configuration::DEFAULT_TTL
        }
      end

      it 'with default values and passed keys' do
        options = { :subscribe_key => 'key', :publish_key => 'key' }
        pubnub = Pubnub.new(options)

        # i know it's a little ugly, but UUID is random if it's not passed :-(
        env = pubnub.env
        env.delete(:uuid)

        expect(env).to eq(@defaults.merge(options))
      end

      it 'with default values overriden by passed ones as parameters' do
        options = {
            :subscribe_key => 'key',
            :publish_key => 'key',
            :connect_callback => lambda { |envelope| puts envelope.msg },
            :origin => 'some.other.origin.com',
            :port => 1234,
            :reconnect_response_timeout => 360,
            :uuid => 'some_uuid'
        }

        pubnub = Pubnub.new(options)

        expect(pubnub.env).to eq(@defaults.merge(options))
      end
    end

    it 'starts EventMachine reactor in a separate thread' do
      pubnub = Pubnub.new(:subscribe_key => 'key')
      expect(EM.reactor_running?).to be true
      expect(EM.reactor_thread).not_to be eq Thread.current
    end

    it 'registers faraday middleware' do
      pubnub = Pubnub.new(:subscribe_key => 'key')
      expect(Pubnub::Middleware::Response.loaded?).to be true
      expect(Pubnub::Middleware::Request.loaded?).to be true
    end

    it 'setups connections pools' do
      pubnub = Pubnub.new(:subscribe_key => 'key')
      expect(pubnub.instance_variables.include?(:@subscribe_connections_pool)).to be true
      expect(pubnub.instance_variables.include?(:@single_event_connections_pool)).to be true

      expect(pubnub.instance_variable_get(:@subscribe_connections_pool).class).to eq Hash
      expect(pubnub.instance_variable_get(:@single_event_connections_pool).class).to eq Hash

      expect(pubnub.instance_variable_get(:@subscribe_connections_pool)[Pubnub::Configuration::DEFAULT_ORIGIN].class).to eq Faraday::Connection
      expect(pubnub.instance_variable_get(:@single_event_connections_pool)[Pubnub::Configuration::DEFAULT_ORIGIN].class).to eq Faraday::Connection
    end

  end

end