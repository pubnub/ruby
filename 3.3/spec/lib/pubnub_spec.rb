require 'spec_helper'
require 'rr'
require 'vcr'

describe Pubnub do
  describe 'while creating new instance' do
    it 'returns Client instance.' do
      Pubnub.new("demo_pub_key", "demo_sub_key", "demo_md5_key", "demo_cipher_key", false).should be_kind_of(Pubnub::Client)
    end

    it 'requires hash of options or exactly 5 parameters.' do
      lambda { Pubnub.new }.should raise_exception(Pubnub::Error::InitError, 'Initialize with either a hash of options, or exactly 5 named parameters.')
    end

  end
end