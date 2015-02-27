require 'pubnub'
require 'pry'
require 'memory_profiler'

p = Pubnub.new(
    publish_key: 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d',
    subscribe_key: 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe',
    secret_key: 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh',
    error_callback: lambda {|_e|}
)

p.grant(channel: :sometest){|e| puts e.msg}

# p.publish(channel: 'sometest', message: 'somemessage', http_sync: true){ |e| puts(e.msg) }

# report = MemoryProfiler.report do
  10_000.times do |i|
    p.publish(channel: 'sometest'.freeze, message: 'somemessage'.freeze){ |e| puts(i.to_s + e.msg) }
    puts "ASYNC EVENTS: #{p.async_events.size}"
  end
# end

# report.pretty_print

binding.pry

a = 2 + 2