require 'pubnub'
require 'pry'
require 'memory_profiler'

# Some simple client examples

report = MemoryProfiler.report do

  pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo)

  pubnub.subscribe(channel: [:bot, :demo], callback: lambda { |e|})

  start_memory = `ps -o rss -p #{$$}`.strip.split.last.to_i * 1024

  start_counts = 0

  ObjectSpace.each_object do |o|
    start_counts += 1
  end

  2000.times do |i|
    pubnub.publish(channel: :demo, message: i, http_sync: false) { |e|}
    sleep(0.3)
    # curr_memory = `ps -o rss -p #{$$}`.strip.split.last.to_i * 1024
    # puts "Current memory usage: #{curr_memory}"
  end

  pubnub.leave(channel: [:bot, :demo]) { |e| puts e.msg }

  end_counts = 0

  ObjectSpace.each_object do |o|
    end_counts += 1
  end

  puts "Objects: start: #{start_counts} | end: #{end_counts}"
  puts "Start memory usage:   #{start_memory}
        Current memory usage: #{`ps -o rss -p #{$$}`.strip.split.last.to_i * 1024}"

  pubnub = nil
  start_counts = nil
  start_memory = nil
  end_counts = nil

  puts "DONE! Now sleeping"

  sleep(600)

  puts "Sleeping done"

end

report.pretty_print