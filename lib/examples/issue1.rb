require 'pubnub'

PUBNUB = Pubnub.new(
    :publish_key => 'demo',
    :subscribe_key => 'demo',
    :secret_key => 'sec',
    :cipher => nil,
    :ssl => false
)

def callback(message)
  if message.message['occupancy'] <= 0
    return # no clients
  end
  publish_all()
end

def publish_all()
  PUBNUB.publish(
      :channel => 'stacks',
      :message => 'hi',
      :callback => lambda { |message|
        puts message
      }
  )
end

loop do

  # this works...
  #publish_all()
  #sleep 3

  # this doesnt work...
  PUBNUB.here_now(
      :channel => 'stacks',
      :callback => method(:callback)
  )
  sleep 3
end