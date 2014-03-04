require 'rubygems'
require 'pubnub'
require 'pry'
require 'rr'
require 'stringio'
require 'webmock/rspec'
require 'vcr'

module AsyncHelper
  def eventually(options = {})
    timeout = options[:timeout] || 3
    interval = options[:interval] || 0.1
    time_limit = Time.now + timeout
    loop do
      begin
        yield
      rescue => error
      end
      return if error.nil?
      raise error if Time.now >= time_limit
      sleep interval
    end
  end
end

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include AsyncHelper
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
