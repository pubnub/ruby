require 'pubnub'

class PubTest

  MAX_CYCLES = 10
  FREQUENCY = 0.250

  def error_callback(error)
    puts "Error: #{error.inspect}"
  end

  def connect_callback(x)
    puts "Subscribe connected: #{x.inspect}"
    puts "Commencing publishes..."
    publish_cycle
  end

  def initialize

    @counter = 0;
    @p = Pubnub.new(:subscribe_key => "demo",
                    :publish_key => "demo",
                    :error_callback => method(:error_callback),
                    :connect_callback => method(:connect_callback))

    @publish_cb = lambda { |x| puts("Publish #{x.channel}: msg: #{x.message} response: #{x.response}")}
    @subscribe_cb = lambda { |x| puts("Subscribe #{x.channel}: msg: #{x.message} response: #{x.response}"); @counter+=1 }

  end

  def publish_cycle
    MAX_CYCLES.times do |x|
      sleep(FREQUENCY)
      msg = {"serial" => x}
      @p.publish(:message => msg, :channel => "hello_world", :callback => @publish_cb)
    end

    puts "Received #{@counter} of #{MAX_CYCLES}"
  end


  def subscribe
    @p.subscribe(:channel => "hello_world", :callback => @subscribe_cb)
  end

  def self.go
    pt = PubTest.new
    pt.subscribe
  end

end

pt = PubTest.new
pt.subscribe