require 'pry'
require 'logger'
require 'pubnub'

class PubTest

  attr_reader :counter

  MAX_CYCLES = 10
  FREQUENCY = 0.25

  def error_callback(error)
    @logger.debug "Error: #{error.inspect}"
  end

  def connect_callback(x)
    @logger.debug "Subscribe connected: #{x.inspect}"
    @logger.debug 'Commencing publishes...'
    publish_cycle
  end

  def initialize
    @logger = Logger.new(File.dirname(__FILE__) + '/../log/simple_test.log', 0, 10 * 1024 * 1024)

    @counter = 0
    @p = Pubnub.new(:subscribe_key => 'demo',
                    :publish_key => 'demo',
                    :logger => @logger,
                    :error_callback => method(:error_callback),
                    :connect_callback => method(:connect_callback))

    @publish_cb = lambda { |x|
      @logger.debug "Publish #{x.channel}: msg: #{x.message} response: #{x.response}"
    }

    @subscribe_cb = lambda { |x|
      @logger.debug "Subscribe #{x.channel}: msg: #{x.message} response: #{x.response}"
      @counter+=1
    }

  end

  def publish_cycle
    MAX_CYCLES.times do |x|
      @logger.debug "AT #{x} CYCLE"
      sleep(FREQUENCY)
      msg = {:serial => x}
      @p.publish(:message => msg, :channel => 'hello_world_for_test', :callback => @publish_cb)
    end
    #while @counter < 10 do
    #  sleep 1
    #  print '.'
    #end
    sleep(3)
    puts "Received #{@counter} of #{MAX_CYCLES}"
    @logger.info "Received #{@counter} of #{MAX_CYCLES}"
    while counter < 10 do end
    EM.stop
  end


  def subscribe
    @p.subscribe(:channel => 'hello_world_for_test', :callback => @subscribe_cb)
  end

  def self.go
    pt = PubTest.new
    pt.subscribe
    pt
  end

end

t = Time.now
PubTest.go

while EM.reactor_running? do
  sleep 0.3
  print '.'
end
puts t - Time.now
#binding.pry