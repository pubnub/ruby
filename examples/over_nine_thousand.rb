require 'pubnub'

@msgs = Array.new
@timetokens = Array.new
@envelopes = Array.new
@responses = Array.new
@paths = Array.new
@publish_responses = Array.new

p = Pubnub.new(
    #:origin         => 'localhost',
    :subscribe_key  => 'demo',
    :publish_key    => 'demo',
    :error_callback => lambda{ |e|
      puts "ERROR! #{e.inspect}"
      puts this.inspect
    }
)

p.subscribe(:channel => 'my_channel_123'){ |envelope|
  p envelope.msg
  @msgs << envelope.msg
  @timetokens << envelope.timetoken
  @envelopes << envelope
  @responses << envelope.response
  @paths << envelope.path
}

9001.times do |i|
  sleep(0.01)
  p.publish(:message => i+1, :channel => 'my_channel_123', :http_sync => false){|envelope|
    @publish_responses << envelope.response
    @last = i
  }
end
while @last < 100 do end
sleep(10)

puts "msgs size: #{msgs.size}"
