require 'pry'
require 'logger'
require 'pubnub'

class PubTest

  MAX_CYCLES = 1000
  FREQUENCY = 1.0/3.0

  def error_callback(error)
    @logger.debug "Error: #{error.inspect}"
  end

  def connect_callback(x)
    @logger.debug "Subscribe connected: #{x.inspect}"
    @logger.debug 'Commencing publishes...'
    publish_cycle
  end

  def initialize
    @logger = Logger.new('rapid_fire_publish.log', 0, 10 * 1024 * 1024)

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

    while @counter < MAX_CYCLES do
      sleep 0.3
      puts @counter
    end

    puts "\nReceived #{@counter} of #{MAX_CYCLES}"
    @logger.info "Received #{@counter} of #{MAX_CYCLES}"

    EM.stop
  end


  def subscribe
    @p.subscribe(:channel => 'hello_world_for_test', :callback => @subscribe_cb)
  end

  def self.go
    pt = PubTest.new
    pt.subscribe
    #pt.publish_cycle
    pt
  end

end

pubtest = PubTest.go

binding.pry