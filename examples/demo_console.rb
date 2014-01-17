require 'pubnub'

puts 'Provide origin [demo.pubnub.com]:'
origin = gets.chomp!
origin = 'demo.pubnub.com' if origin.blank?
puts 'Provide subscribe key [demo]:'
sub_key = gets.chomp!
sub_key = 'demo' if sub_key.blank?

puts 'Provide publish key [demo]:'
pub_key = gets.chomp!
pub_key = 'demo' if pub_key.blank?

puts 'Provide secret key (optional):'
sec_key = gets.chomp!
sec_key = nil if sec_key.blank?

p = Pubnub.new(
    :subscribe_key    => sub_key,
    :secret_key       => sec_key,
    :publish_key      => pub_key,
    :origin           => origin,
    :error_callback   => lambda { |msg|
      puts "SOMETHING TERRIBLE HAPPENED HERE: #{msg.inspect}"
    },
    :connect_callback => lambda { |msg|
      puts "CONNECTED: #{msg.inspect}"
    }
)

default_cb = lambda { |envelope|
  puts "\nchannel: #{envelope.channel}"
  puts "msg: #{envelope.message}"
  puts "payload: #{envelope.payload}" if envelope.payload
}

while(true)

  ssl = false
  while !%w(Y N).include? ssl
    puts('Should next operation be ssl [y/N]?')
    ssl = gets.chomp!
    ssl = 'N' if ssl.blank?
  end

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
  puts('8. audit')
  puts('9. grant')
  puts('10. revoke')
  puts("\n\n")
  puts('Enter a selection')
  choice = gets.chomp!

  case choice
    when '1' #SUBSCRIBE

      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.subscribe(:channel => channel, :callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.subscribe(:channel => channel, :http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.subscribe(:channel => channel, :callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.subscribe(:channel => channel, :http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end


    when '2' #UNSUBSCRIBE

      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.unsubscribe(:channel => channel, :callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.unsubscribe(:channel => channel, :http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.unsubscribe(:channel => channel, :callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.unsubscribe(:channel => channel, :http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '3' #PUBLISH

      puts('Enter channel')
      channel = gets.chomp!

      puts('Enter message')
      message = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.publish(:message => message, :channel => channel, :callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.publish(:message => message, :channel => channel, :http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.publish(:message => message, :channel => channel, :callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.publish(:message => message, :channel => channel, :http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
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
                  :http_sync => false,
                  :ssl => ssl) do |envelope| puts(envelope.inspect) end
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => reverse,
                  :http_sync => false,
                  :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => reverse,
                  :callback => default_cb,
                  :http_sync => true,
                  :ssl => ssl) do |envelope| puts(envelope.inspect) end
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.history(:channel => channel,
                  :count => count,
                  :start => history_start,
                  :end => history_end,
                  :reverse => true,
                  :http_sync => false,
                  :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '5' #PRESENCE
      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.presence(:channel => channel, :callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.presence(:channel => channel, :http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.presence(:channel => channel, :callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.presence(:channel => channel, :http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '6' #HERE_NOW
      puts('Enter channel')
      channel = gets.chomp!

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.here_now(:channel => channel, :callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.here_now(:channel => channel, :http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.here_now(:channel => channel, :callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.here_now(:channel => channel, :http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end


    when '7' #TIME
      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.time(:callback => default_cb, :http_sync => false, :ssl => ssl)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.time(:http_sync => false, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.time(:callback => default_cb, :http_sync => true, :ssl => ssl)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.time(:http_sync => true, :ssl => ssl){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '8' # AUDIT
      puts 'Enter channel for channel level'
      channel = gets.chomp!
      channel = nil if channel.blank?

      puts 'Enter auth key'
      auth_key = gets.chomp!
      auth_key = nil if auth_key.blank?

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.audit(:callback => default_cb, :http_sync => false, :ssl => ssl, :channel => channel, :auth_key => auth_key, :subscribe_key => subscribe_key)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.audit(:http_sync => false, :ssl => ssl, :channel => channel, :auth_key => auth_key, :subscribe_key => subscribe_key){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.audit(:callback => default_cb, :http_sync => true, :ssl => ssl, :channel => channel, :auth_key => auth_key, :subscribe_key => subscribe_key)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.audit(:http_sync => true, :ssl => ssl, :channel => channel, :auth_key => auth_key, :subscribe_key => subscribe_key){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '9' # GRANT
      puts 'Enter channel for channel level'
      channel = gets.chomp!
      channel = nil if channel.blank?

      puts 'Enter auth key'
      auth_key = gets.chomp!
      auth_key = nil if auth_key.blank?

      puts 'Enter subscribe key'
      subscribe_key = gets.chomp!
      subscribe_key = nil if auth_key.blank?

      read = nil
      while !%w(1 0).include? read
        puts 'Read? [0/1]'
        read = gets.chomp!
      end

      write = nil
      while !%w(1 0).include? write
        puts 'Write? [0/1]'
        write = gets.chomp!
      end

      puts 'TTL [3600]:'
      ttl = gets.chomp!
      ttl = 3600 if ttl.blank?

      if sync_or_async == 'A' && block_or_parameter == 'P' #ASYNC AND CALLBACK AS PASSED AS PARAMETER
        p.grant(:callback => default_cb, :http_sync => false, :ssl => ssl, :channel => channel, :read => read, :write => write, :ttl => ttl, :auth_key => auth_key, :subscribe_key => subscribe_key)
      elsif sync_or_async == 'A' && block_or_parameter == 'B' #ASYNC AND CALLBACK AS PASSED AS BLOCK
        p.grant(:http_sync => false, :ssl => ssl, :channel => channel, :read => read, :write => write, :ttl => ttl, :auth_key => auth_key, :subscribe_key => subscribe_key){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      elsif sync_or_async == 'S' && block_or_parameter == 'P' #SYNC AND CALLBACK AS PASSED AS PARAMETER
        p.grant(:callback => default_cb, :http_sync => true, :ssl => ssl, :channel => channel, :read => read, :write => write, :ttl => ttl, :auth_key => auth_key, :subscribe_key => subscribe_key)
      elsif sync_or_async == 'S' && block_or_parameter == 'B' #SYNC AND CALLBACK AS PASSED AS BLOCK
        p.grant(:http_sync => true, :ssl => ssl, :channel => channel, :read => read, :write => write, :ttl => ttl, :auth_key => auth_key, :subscribe_key => subscribe_key){ |envelope| puts("\nchannel: #{envelope.channel}: \nmsg: #{envelope.message}") }
      end

    when '10' # REVOKE
      # TODO ADD FIXED GRANT
    end
end