require 'pubnub'
require 'pry'
require 'logger'

TIMES = 40000

@msgs = Array.new
@timetokens = Array.new
@envelopes = Array.new
@responses = Array.new
@paths = Array.new
@publish_responses = Array.new
@last = 0

p = Pubnub.new(
    #:origin         => 'localhost',
    :subscribe_key  => 'demo',
    :publish_key    => 'demo',
    :error_callback => lambda{ |e|
      puts "ERROR! #{e.inspect}"
      puts this.inspect
    }
)

ch = 'my_channel_123'
ch_pres = ch + "-pnpres"

def doSub(ch, p)
  p.subscribe(:channel => ch) { |envelope|
    p envelope.msg
    @last = envelope.msg.to_i
    @msgs << envelope.msg
    @timetokens << envelope.timetoken
    @envelopes << envelope
    @responses << envelope.response
    @paths << envelope.path
  }
end

doSub(ch, p)
sleep(3)
#doSub("a", p)

sleep 3

TIMES.times do |i|
  puts(" #{TIMES - i} iterations left.")
  sleep 0.25

  z = p.publish(:message => i+1, :channel => ch, :http_sync => true)
  print '.'
  if Pubnub::Subscription.get_channels.include? ch
    u = p.unsubscribe(:channel => ch, :http_sync => true)
    puts "#{u.msg}: Unsubscribed."
    #binding.pry
  end

end


while @last < TIMES do
puts("BLOCKING: #{TIMES} left!")
end

puts "\nmsgs size: #{@msgs.size}"

#binding.pry