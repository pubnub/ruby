require 'pubnub'

p = Pubnub.new(:subscribe_key => "demo", :publish_key => "demo")
default_cb = lambda { |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }

while(true)

  puts("\n\n")
  sync_or_async = false
  while !%w(S A).include? sync_or_async
    puts('Should next operation be [S]ync or [A]sync?')
    sync_or_async = gets.chomp!
  end

  block_or_parameter = false
  while !%w(B P).include? block_or_parameter
    puts('Do you want pass callback as [B]lock or [P]arameter?')
    block_or_parameter = gets.chomp!
  end

  puts('1. subscribe')
  puts('2. unsubscribe (leave)')
  puts('3. publish')
  puts('4. history')
  puts('5. presence')
  puts('6. here_now')
  puts('7. time')
  puts("\n\n")
  puts('Enter a selection')
  choice = gets.chomp!

  case choice
    when '1' #SUBSCRIBE

      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.subscribe(:channel => channel, :callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.subscribe(:channel => channel, :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.subscribe(:channel => channel, :callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.subscribe(:channel => channel, :http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end


    when '2' #UNSUBSCRIBE

      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.unsubscribe(:channel => channel, :callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.unsubscribe(:channel => channel, :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.unsubscribe(:channel => channel, :callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.unsubscribe(:channel => channel, :http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '3' #PUBLISH

      puts('Enter channel')
      channel = gets.chomp!

      puts('Enter message')
      message = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.publish(:message => message, :channel => channel, :callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.publish(:message => message, :channel => channel, :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.publish(:message => message, :channel => channel, :callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.publish(:message => message, :channel => channel, :http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '4' #HISTORY
      puts('Enter channel')
      channel = gets.chomp!

      puts('Enter count')
      count = gets.chomp!
      if (count == '') then count = nil end

      puts('Enter start')
      history_start = gets.chomp!
      if (history_start == '') then history_start = nil end

      puts('Enter end')
      history_end = gets.chomp!
      if (history_end == '') then history_end = nil end

      puts('Enter reverse (y/n)')
      reverse = gets.chomp!
      if (reverse == "" || reverse == "n") then reverse = false else reverse = true end

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => reverse,
                  :callback => default_cb,
                  :http_sync => false) do |envelope| puts(envelope.inspect) end
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => reverse,
                  :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.history(:channel => channel,
                  :count => count,

                  :start => history_start,
                  :end => history_end,
                  :reverse => reverse,
                  :callback => default_cb,
                  :http_sync => true) do |envelope| puts(envelope.inspect) end
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => true,
                  :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '5' #PRESENCE
      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.presence(:channel => channel, :callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.presence(:channel => channel, :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.presence(:channel => channel, :callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.presence(:channel => channel, :http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '6' #HERE_NOW
      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.here_now(:channel => channel, :callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.here_now(:channel => channel, :http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.here_now(:channel => channel, :callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.here_now(:channel => channel, :http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end


    when '7' #TIME
      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.time(:callback => default_cb, :http_sync => false)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.time(:http_sync => false){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.time(:callback => default_cb, :http_sync => true)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.time(:http_sync => true){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    end
end