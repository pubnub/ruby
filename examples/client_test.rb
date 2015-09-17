require 'lib/pubnub'

# Some simple client examples

pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo)

pubnub.subscribe(channel: [:bot, :demo], callback: lambda { |e| puts 'e'} )

2000.times do |i|
  pubnub.publish(channel: :demo, message: i, http_sync: false){|e| puts "OK"}
  sleep(rand(3))
  puts "Current memory usage: #{`ps -o rss -p #{$$}`.strip.split.last.to_i * 1024}"
end

sleep(10)

puts "Current memory usage: #{`ps -o rss -p #{$$}`.strip.split.last.to_i * 1024}"

puts "DONE"