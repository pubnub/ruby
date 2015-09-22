require 'rubygems'
require 'pry'
require 'rr'
require 'stringio'
require 'webmock/rspec'
require 'vcr'
require 'celluloid/current'
require 'celluloid/test'

require 'pubnub'

Celluloid.task_class = Celluloid::Task::Threaded

# AsyncHelper allows us to wait for async operations
module AsyncHelper
  def eventually(options = {})
    timeout = options[:timeout] || 0.5
    interval = options[:interval] || 0.1
    time_limit = Time.now + timeout
    loop_it(interval, time_limit) do yield end
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

  logfile = File.open(File.expand_path('../../test.log', __FILE__), 'a')
  logfile.sync = true
  Celluloid.logger = Logger.new(logfile)

  config.around do |example|
    Timeout.timeout(1) do
      example.run
    end
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    match_requests_on: [:method,
                        VCR.request_matchers.uri_without_param(:pnsdk, :uuid)]
  }
end
