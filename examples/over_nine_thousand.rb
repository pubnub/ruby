require 'pubnub'

@msgs = Array.new
@timetokens = Array.new
@envelopes = Array.new
@responses = Array.new
@pubnub_timetokens = Array.new

p = Pubnub.new(
    #:origin         => 'localhost',
    :subscribe_key  => 'demo',
    :publish_key    => 'demo',
    :error_callback => lambda{ |e|
      #puts "ERROR! #{e.inspect}"
      #puts "\n"
    }
)

p.subscribe(:channel => 'my_channel_123'){ |envelope|
  p envelope.msg
  @msgs << envelope.msg
  @timetokens << envelope.timetoken
  @pubnub_timetokens << p.timetoken
  @envelopes << envelope
  @responses << envelope.response
}

101.times do |i|
  p.publish(:message => i+1, :channel => 'my_channel_123', :http_sync => false){|envelope|
    @last = i
  }
end
while @last < 100 do end
sleep(10)

puts "msgs size: #{msgs.size}"
