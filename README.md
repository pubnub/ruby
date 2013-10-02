PubNub - http://github/pubnub/ruby
@pubnub on Twitter, @stephenlb on Github

##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

## PubNub 3.4beta Real-time Cloud Push API - RUBY (gem version 3.4beta)

www.pubnub.com - PubNub Real-time Push Service in the Cloud. 

PubNub is a Real-time Network for Mobile App, Web Apps for pushing updates
and enabling real-time notifications and even games!
This is a cloud-based service for broadcasting Real-time messages
to thousands of web and mobile clients simultaneously.

# PubNub 3.4 for Ruby is a complete rewrite
and is NOT compatible with earlier versions of Pubnub Ruby Client.

### Usage Examples

Examine the tests in `spec/lib/*` for many different examples!
Specifically, `*_integration`. But here is a small sample:

### Require PubNub GEM

```ruby
require 'pubnub'
```

### Instantiate a new PubNub Object

```ruby
pubnub = Pubnub.new(
    :publish_key   => 'demo', # publish_key only required if publishing.
    :subscribe_key => 'demo', # required
    :secret_key    => nil,    # optional, if used, message signing is enabled
    :cipher_key    => nil,    # optional, if used, encryption is enabled
    :ssl           => nil     # true or default is false
)
```

### Setting callback

You can set callback by passing :callback option, or giving a block:

```ruby
cb = lambda { |envelope| puts envelope.message }
pubnub.publish(:message => msg, :channel => channel, :callback => cb)
pubnub.publish(:message => msg, :channel => channel, &cb)
pubnub.publish(:message => msg, :channel => channel){ |envelope| puts envelope.message }
```

### Sync or Async?

You can make sync and async reqest just by controlling :http_sync option (default every operation is async)

```ruby
pubnub.publish(:message => msg, :channel => channel, :callback => cb, :http_sync => true)
pubnub.publish(:message => msg, :channel => channel, :callback => cb, :http_sync => false)
```

### Response

You callback will be called each time for one envelope with that envelope passed to it. Envelope is Pubnub::Response object and contains:

 - message (aliased as 'msg') -> Holds message
 - channel -> Holds channel for current message
 - timetoken -> Timetoken of server response
 - status_code -> Server response status code
 - response -> Whole and unmodified server response

### Publish

For message, you can just pass: 

 - a "String"
 - a Number 123
 - an array [ 1, 2, 3 ]
 - an object { :a => "apple" }

> it will be serialized as a JSON for the transport to your mobile and web apps.

```ruby
@my_callback = lambda { |envelop| puts(envelope.msg) }

pubnub.publish(
    :channel  => :hello_world,
    :message  => "hi",
    :callback => @my_callback
)
```

### Subscribe

```ruby
pubnub.subscribe(
    :channel  => :hello_world,
    :callback => @my_callback
)
```

### History

Archive messages of on a given channel. Optional start, end, and reverse option examples can be found in the tests.

```ruby
pubnub.history(
    :channel  => channel,
    :count    => 10, 
    :callback => @my_callback
)
```

### Presence

Realtime see who channel events, such as joins, leaves, and occupancy.
```ruby
pubnub.presence(
    :channel  => :hello_world,
    :callback => @my_callback
)
```

### Here_now 

See who is online in a channel at this very moment.
```ruby
pubnub.here_now(
    :channel  => channel,
    :callback => @my_callback
)
```

### UUID

Session-UUID is automatic, so you will probably not end up ever using this. But if you need a UUID...
```ruby
pubnub.uuid
```

### Time 

Get the current timetoken.
```ruby
pubnub.time("callback" => @my_callback)
```

### Sync

If you want to make sync request, just set `:http_sync` to `true`.
```ruby
pubnub.publish(
    :channel   => :hello_world,
    :message   => "hi",
    :callback  => @my_callback,
    :http_sync => true
)
```

```ruby
pubnub.history(
    :cipher_key => "enigma", ## OPTIONAL
    :channel    => @no_history_channel,
    :limit      => 10,
    :callback   => @my_callback,
    :http_sync  => true
)
```
