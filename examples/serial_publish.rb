require 'pubnub'

TIMES = 10000

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
    }
)

p.subscribe(:channel => 'my_channel_123'){ |envelope|
  #p envelope.msg
  @last = envelope.msg.to_i
  @msgs << envelope.msg
  @timetokens << envelope.timetoken
  @envelopes << envelope
  @responses << envelope.response
}

sleep 3

TIMES.times do |i|
  sleep 0.05
  p.publish(:message => i+1, :channel => 'my_channel_123', :http_sync => false){|envelope|
    print '.'
    @publish_responses << envelope.response
  }
end
while @last < TIMES do end

puts "\nmsgs size: #{@msgs.size}"

#binding.pry