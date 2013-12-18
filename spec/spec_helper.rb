require 'rubygems'
require 'pubnub'
require 'pry'
require 'rr'
require 'stringio'
require 'webmock/rspec'
require 'vcr'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.color_enabled = true
  config.tty = true
end
