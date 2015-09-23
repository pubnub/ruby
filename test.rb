require 'pubnub'

p = Pubnub.new(subscribe_key: :demo, publish_key: :demo)
p.subscribe(channel: :somechannel){|e|}

loop do
  p.publish(channel: :somechannel, message: 'dupa'){|e|}
  sleep(0.1)
end