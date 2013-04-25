require 'spec_helper'
require 'rr'
require 'vcr'

describe Pubnub::Request do
  before do
    @pubnub_request = Pubnub::Request.new
  end
end