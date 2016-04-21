require 'redis'
require 'pubnub'
require 'pry'

puts "\n\n#{Pubnub::VERSION}\n\n"

logger = Logger.new('publisher.log')

redis = Redis.new
pubnub = Pubnub.new(subscribe_key: 'sub-c-9a20ffa4-0243-11e6-861b-02ee2ddab7fe', publish_key: 'pub-c-c617141c-b93e-4492-8b21-d6be4a9b009c', uuid: :secondrubytester, logger: logger)

redis.subscribe(:publish, :subscribe) do |on|
  on.subscribe do |channel, _subscriptions|
    puts "Waiting for options on #{channel} channel."
  end

  on.message do |channel, channels|
    channels = JSON.parse(channels)
    case channel
      when 'publish'
        unless channels.empty?
          puts 'PUBLISH'
          puts channels
          channels.each do |chann|
            envelope = pubnub.publish(message: :test_message, channel: chann)
            puts envelope.value.first.response
          end
          puts '---'
        end
      when 'subscribe'
        unless channels.empty?
          puts 'SUBSCRIBE'
          puts channels
          pubnub.subscribe(channel: channels){ |e| }
          sleep 0.75
          channels.each do |chann|
            pubnub.leave(channel: chann, http_sync: true){ |e| puts e.response }
          end
        end
    end
  end
end