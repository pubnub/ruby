require "rubygems"
require "rr"
require "stringio"
require "webmock/rspec"
require "vcr"
require "pry"
require "spec_expectations"
require "concurrent"
require "concurrent-edge"
require "rspec/retry"
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "pubnub"
Pubnub::Constants::DEFAULT_RECONNECT_INTERVAL = 0
if ENV["CI"] == "true"
  require "codacy-coverage"
  Codacy::Reporter.start
end

# AsyncHelper allows us to wait for async operations
module AsyncHelper
  def eventually(options = {})
    timeout = options[:timeout] || 30
    interval = options[:interval] || 0.1
    time_limit = Time.now + timeout
    loop_it(interval, time_limit) do
      yield
    end
  end

  def loop_it(interval, time_limit)
    loop do
      begin
        yield
      rescue => error
        cought_error = error
      end
      return if cought_error.nil?
      fail cought_error if Time.now >= time_limit
      sleep interval
    end
  end
end

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include AsyncHelper
  config.mock_framework = :rspec
  config.tty = true

  logfile = File.open(File.expand_path("../../test.log", __FILE__), "a")
  logfile.sync = true
  Concurrent.global_logger = Logger.new(logfile)

  # config.around(:each) do |example|
  #   if example.metadata[:disable_vcr]
  #     WebMock.allow_net_connect!
  #     VCR.turned_off { example_method.run }
  #     WebMock.disable_net_connect!
  #   end
  # end
end

VCR.configure do |c|
  ignored_params = [
      :pnsdk, :uuid, :ortt, :seqn, :t, :l_pres, :l_pub, :l_pres, :l_hist, :l_cg, :l_time, :signature, :timestamp ]
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.ignore_hosts "api.codacy.com"
  c.default_cassette_options = {
    match_requests_on: [:method,
                        VCR.request_matchers.uri_without_param(*ignored_params)],
  }
  c.debug_logger = File.open("vcr.log", "w")
  c.before_record do |interaction, casette|
    interaction.request.uri.gsub!(/(pub|sub)-[\da-fA-F]-[\da-fA-F]{8}(-[\da-fA-F]{4}){3}-[\da-fA-F]{12}/, '\1-a-mock-key')
  end
end
