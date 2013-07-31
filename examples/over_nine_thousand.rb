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
  @last = msg
  @msgs << envelope.msg
  @timetokens << envelope.timetoken
  @envelopes << envelope
  @responses << envelope.response
  @paths << envelope.path
}

10.times do |i|
  sleep(0.2)
  p.publish(:message => i+1, :channel => 'my_channel_123', :http_sync => false){|envelope|
    @publish_responses << envelope.response
  }
end
while @last < 9001 do end

puts "msgs size: #{msgs.size}"
