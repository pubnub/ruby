require 'spec_helper'
require 'rr'
require 'vcr'

describe Pubnub do
  describe 'while creating new instance' do
    it 'returns Client instance.' do
      Pubnub.new({}).should be_kind_of(Pubnub::Client)
    end

  end
end