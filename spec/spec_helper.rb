require 'rubygems'
require 'pubnub'
require 'pry'
require 'rr'
require 'stringio'
require 'webmock/rspec'

WebMock.disable_net_connect!

$log = Logger.new('pubnub.log', 0, 100 * 1024 * 1024)

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end
