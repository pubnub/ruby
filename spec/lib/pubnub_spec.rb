require 'spec_helper'

describe Pubnub do

  around :each do |example|
    example.run
  end

  context 'version' do
    it 'has VERSION' do
      expect(Pubnub::VERSION).to match(/\d+\.\d+\..+/)
    end
  end

  context 'logger' do
    it 'is settable' do
      logger = Logger.new('pubnub.log')
      _pubnub = Pubnub.new(subscribe_key: 'valid', logger: logger)
      expect(Pubnub.logger).to be logger
    end

    it 'is set by default if not provided' do
      _pubnub = Pubnub.new(subscribe_key: 'valid')
      expect(Pubnub.logger.class).to be Logger
    end
  end
end
