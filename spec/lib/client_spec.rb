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

    it 'doesnt start EventMachine reactor' do
      pubnub = Pubnub.new(:subscribe_key => 'key')
      sleep(0.1)
      expect(EM.reactor_running?).to be false
    end

  end

end