### Upgrade Guide 3.8.x to 4.0.x

##### Envelope result

Pubnub Ruby SDK `4.x` version uses new `Envelope` object for response. You can find here how it is structured:

```ruby
envelope.id            # unique envelope ID for internal usage
envelope.event         # event key (:publish, :time, :grant etc.)
envelope.event_options # options given to the event when it was fired
envelope.status        # status response Hash
envelope.result        # result response Hash
envelope.timetoken     # timetoken
```

Status and result structures for specific events can be found in our [docs](https://www.pubnub.com/docs/ruby/api-reference-sdk-v4).

##### Subscribe changes

Subscribe callbacks has been completly reworked and now uses listeners (`SubscribeCalback`).

For example, let's upgrade old code:
```
# Old code
pubnub.subscribe(channel: :demo){ |envelope| puts "MSG: #{envelope}" }
pubnub.presence(channel: :demo){ |envelope| puts "PRESENCE #{envelope}" }

# New code

# We're creating listener here
callbacks = Pubnub::SubscribeCallback.new(
    # Fired for messages
    message: ->(envelope) { 
        puts "MSG: #{envelope.result}" if envelope.result[:data][:message_meta_data]['uuid'] != pubnub.uuid
    },
    # Fired for presence events
    presence: ->(envelope) { 
        puts "PRESENCE #{envelope.result}"
    },
    # Fired for status events (like `connected`)
    status: ->(envelope) { 
        puts "STATUS #{envelope.status}"
    }
)

# Here it's added to listeners
pubnub.add_listener(callback: callbacks)

# Finally we're firing subscribe
pubnub.subscribe(channel: :demo, presence: :demo)
```