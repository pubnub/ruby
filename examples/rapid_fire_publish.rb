require 'pubnub'

class PubTest

  @counter = 0;
  @p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
  @cb = lambda { |x| puts("cb1 #{x.channel}: msg: #{x.message} response: #{x.response}"); @counter+=1 }

  @p.subscribe(:channel => "hello_world", :callback => @cb)

  sleep(2)


  def self.publish_test
    100.times do |x|
      sleep(0.200)
      msg = {"serial" => x}
      @p.publish(:message => msg, :channel => "hello_world", :callback => @cb)
    end

    puts "Received #{@counter}"
  end


  publish_test

end




