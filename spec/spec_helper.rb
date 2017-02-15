require 'rubygems'
require 'rr'
require 'stringio'
require 'webmock/rspec'
require 'vcr'
require 'celluloid/current'
require 'celluloid/test'
require 'pry'
require 'rspec/wait'
require 'spec_expectations'

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'pubnub'

if ENV['CI'] == 'true'
  require 'codacy-coverage'
  Codacy::Reporter.start
end

Celluloid.task_class = Celluloid::Task::Threaded

# AsyncHelper allows us to wait for async operations
module AsyncHelper
  def eventually(options = {})
    timeout = options[:timeout] || 20
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

  # config.around(:each) do |example|
  #   if example.metadata[:disable_vcr]
  #     WebMock.allow_net_connect!
  #     VCR.turned_off { example_method.run }
  #     WebMock.disable_net_connect!
  #   end
  # end
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    match_requests_on: [:method,
                        VCR.request_matchers.uri_without_param(:pnsdk, :uuid, :ortt, :seqn)]
  }
end
