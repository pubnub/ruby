require 'pubnub'

class PubTest

  @counter = 0;
  @send_array = Array.new
  @rec_array = Array.new

  @p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
  @cb = lambda { |x|
    puts "cb1 #{x.channel}: msg: #{x.message} response: #{x.response}"
    @counter+=1
    @rec_array << x
  }

  @p.subscribe(:channel => "whateverelse", :callback => @cb)
  sleep(3)
  def self.publish_test
    10.times do |x|
      msg = {"serial" => x}
      @p.publish(:message => msg, :channel => "whateverelse", :callback => lambda { |x| p x.message; @send_array << msg})
    end

    puts "Received #{@counter}"
    end


  publish_test

  sleep(5)

  puts @send_array.inspect
  puts @rec_array.inspect

  puts (@send_array == @rec_array).to_s


end




