#require 'pubnub'

# I should get a message on channel a once a second, but it doesnt appear so... why not?
# x.channel is always nil - please fix

p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
default_cb = lambda { |x| puts("\nchannel: #{x.channel}: \nmsg: #{x.message} \nresponse: #{x.response}") }

while (true)

  # TODO: Give option for async/sync calls

  puts("\n\n")

  puts("1. subscribe")
  puts("2. subscribe with block")
  puts("3. unsubscribe")
  puts("4. publish")
  puts("5. publish with block")
  puts("6. subscribe with http_sync => true and block")
  puts("\n\n")
  puts("Enter a selection")
  choice = gets().chomp!

  case choice
    when "1"
      puts("Enter channel")
      channel = gets().chomp!
      p.subscribe(:channel => channel, :callback => default_cb, :http_sync => false)

    when "2"
      puts("Enter channel")
      channel = gets().chomp!
      p.subscribe(:channel => channel, :http_sync => false) do |envelope|
        puts "My block got the message of: #{envelope.message} on channel #{envelope.channel}"
        puts "status: #{envelope.status_code} and timetoken #{envelope.timetoken}"
      end

    when "3"
      puts("Enter channel")
      channel = gets().chomp!
      p.unsubscribe(:channel => channel, :callback => default_cb, :http_sync => false)

    when "4"
      puts("Enter channel")
      channel = gets().chomp!
      puts("Enter message")
      message = gets().chomp!
      p.publish(:channel => channel, :callback => default_cb, :message => message, :http_sync => false)

    when "5"
      puts("Enter channel")
      channel = gets().chomp!
      puts("Enter message")
      message = gets().chomp!

      p.publish(:channel => channel, :message => message, :http_sync => false) do |envelope|
        puts(envelope.inspect)
      end

    when "6"
      puts("Enter channel")
      channel = gets().chomp!

      choices = Array.new
      fetch = true
      while fetch do
        p.subscribe(:channel => channel, :http_sync => true) do |envelope|
          puts "Do you want to accept: '#{envelope.message}' message? [y/N]"
          if gets().chomp!.downcase == 'y'
            choices << envelope.message
            puts 'Accepted!'
          else
            puts 'Rejected!'
          end
        end
        puts 'Do you want to fetch next part of messages? [Y/n]'
        fetch = false if gets().chomp!.downcase == 'n'
      end
      puts 'You accepted:'
      puts choices.inspect

    when "7"
      puts("Enter channel")
      channel = gets().chomp!

      puts("Enter count")
      count = gets().chomp!
      if (count == "") then count = nil end

      puts("Enter start")
      start = gets().chomp!
      if (start == "") then start = nil end

      puts("Enter end")
      endd = gets().chomp!
      if (endd == "") then endd = nil end

      puts("Enter reverse (y/n)")
      reverse = gets().chomp!
      if (reverse == "" || reverse == "n") then reverse = false else reverse = true end

      p.history(:channel => channel,
                         :count => count,
                         :start => start,
                         :end => endd,
                         :reverse => reverse,
                         :http_sync => false) do |envelope| puts(envelope.inspect) end

  end


end
p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")

cb1 = lambda { |x| puts("cb1 #{x.channel}: msg: #{x.message} response: #{x.response}") }
cb2 = lambda { |x| puts("cb2 #{x.channel}: msg: #{x.message} response: #{x.response}") }
cb3 = lambda { |x| puts("cb3 #{x.channel}: msg: #{x.message} response: #{x.response}") }

puts("Subscribing on ch a!")
p.subscribe(:channel => "a", :callback => cb1, :http_sync => false)

puts("Sleeping...")
sleep(3)
puts("Awoke!")

puts("Subscribing on ch ping_3!")

p.subscribe(:channel => "ping_3,a", :callback => cb2, :http_sync => false)

# Provide example of pubnub subcribe with block here
p.subscribe(:channel => "ping_3", :http_sync => false) do |envelope|
  puts envelope.message
end

p.subscribe(:channel => "a", :http_sync => false) do |envelope|
  puts envelope.message
end

x = 1000000

while (x > 0) do

  puts("sleeping...")
  sleep 1
  x=x-1

end

puts("**** Unsubscribing from A Start")
p.unsubscribe(:channel => "a", :callback => cb3)
puts("**** Unsubscribing from A Complete (no more CB3)")

# even after i unsub, im still getting messages (via cb1), why?

x = 3

while (x > 0) do

  puts("sleeping...")
  sleep 1
  x=x-1

end


x = 3
while (x > 0) do

  x=x-1
  puts("Looping quietly while the world goes on...")
  sleep 3

  p.publish(:publish_key => 'demo', :channel => 'hello_world', :message => 'whatever') { |e| puts e.inspect }

end
