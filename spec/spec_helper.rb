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

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      :match_requests_on => [:method, VCR.request_matchers.uri_without_param(:pnsdk, :uuid)]
  }
end