require 'pubnub'

p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")

cb1 = lambda { |x| puts("cb1 - sub callback channel: #{x.channel}: msg: #{x.message} response: #{x.response}") }
cb2 = lambda { |x| puts("cb2 - unsub callback channel: #{x.channel}: msg: #{x.message} response: #{x.response}") }

## We'll subscribe async -- so when we sleep on this thread, we'll still receive messages on EM via the background

puts("Subscribing on ch a!")
p.subscribe(:channel => "a", :callback => cb1, :http_sync => false)
puts("Sleeping...")
sleep(5)
puts("Awoke!")

# Unsubscribe from channel a
p.unsubscribe(:channel => "a", :callback => cb2, :http_sync => false)

puts("Unsub from channel 'a' complete. Waiting 5s to continue...")
sleep(5)

## Add another channel to the async subscribe process list.
puts("Subscribing on ch ping_3 via a CSV list of channels.")

## You can pass a string, or a CSV string of the new channel(s)
# p.subscribe(:channel => "ping_3,a", :http_sync => false){ |envelope| puts "block 1: channel: #{envelope.channel}: #{envelope.message}" }
p.subscribe(:channel => "ping_3", :http_sync => false){ |envelope| puts "block 1: channel: #{envelope.channel}: #{envelope.message}" }
sleep(3)

## You can also pass an array of channels to subscribe
puts("Subscribing on channels z and x via an array of channels.")
p.subscribe(:channel => ["z","x"], :http_sync => false, :callback => cb1)

## Run in the background while we do stuff in this loop
x = 10
while (x > 0) do

  puts("sleeping until ... #{x}")
  sleep 1
  x=x-1

end

puts("**** Unsubscribing from ping_3 Start")
p.unsubscribe(:channel => "ping_3", :callback => cb2)
puts("**** Unsubscribing from ping_3 Complete (no more block 1: channel: ping_3)")

x = 3
while (x > 0) do

  x=x-1
  puts("Publishing to channel ")
  sleep 3

  p.publish(:publish_key => 'demo', :channel => 'z', :message => 'whatever you want! its ruby!') {|r| puts "published at TT: #{r.timetoken}" }

end
