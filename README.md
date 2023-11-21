# PubNub Ruby SDK

![Tests Status](https://github.com/pubnub/ruby/actions/workflows/run-tests.yml/badge.svg)

This is the official PubNub Ruby SDK repository.

PubNub takes care of the infrastructure and APIs needed for the realtime communication layer of your application. Work on your app's logic and let PubNub handle sending and receiving data across the world in less than 100ms.

## Get keys

You will need the publish and subscribe keys to authenticate your app. Get your keys from the [Admin Portal](https://dashboard.pubnub.com/).

## Configure PubNub

1. Integrate PubNub into your project using RubyGems:

    ```bash
    gem install pubnub
    ```

1. Create a new `App.rb` file and add the following code.

    ```ruby
    require 'pubnub'

    pubnub = Pubnub.new(
        subscribe_key: :mySubscribeKey,
        publish_key: :myPublishKey,
        uuid: :myUniqueUUID
    )
    ```

    This is the minimum configuration you need to send and receive messages with PubNub.

## Add event listeners

```ruby
callback = Pubnub::SubscribeCallback.new(
    message: ->(envelope) {
        puts "MESSAGE: #{puts envelope.result[:data][:message]['msg']}"
    },
    presence: ->(envelope) {
        puts "PRESENCE: #{envelope.result[:data]}"
    }
)
pubnub.add_listener(callback: callback)
```

## Publish and subscribe

```ruby
pubnub.subscribe(
    channels: ['my_channel'],
    with_presence: true
)

pubnub.publish(
    channel: 'my_channel',
    message: { text: 'Hello world' }
) do |envelope|
    puts envelope.status
end
```

## Documentation

[API reference for Ruby](https://www.pubnub.com/docs/ruby/pubnub-ruby-sdk)

## Support

If you **need help** or have a **general question**, contact <support@pubnub.com>.
