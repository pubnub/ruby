require 'pubnub'

p = Pubnub.new(
    #:origin         => 'localhost',
    :subscribe_key  => 'demo',
    :publish_key    => 'demo',
    :error_callback => lambda{|e| puts "ERROR! #{e.inspect}"; puts "\n";}
)

9001.times do |i|
  p.publish(:message => i+1, :channel => 'my_channel', :http_sync => false){|envelope|
    p "#{i+1} #{envelope.message}";
    @last = i
  }
end
while @last < 9000 do
  puts Thread.list.size
end