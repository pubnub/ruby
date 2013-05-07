PubNub - http://github/pubnub/ruby
@pubnub on Twitter, @stephenlb on Github

##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

## PubNub 3.3 Real-time Cloud Push API - RUBY (gem version 3.3.0.5)

www.pubnub.com - PubNub Real-time Push Service in the Cloud. 
http://www.pubnub.com/blog/ruby-push-api

PubNub is a Real-time Network for Mobile App, Web Apps for pushing updates
and enabling real-time notifications and even games!
This is a cloud-based service for broadcasting Real-time messages
to thousands of web and mobile clients simultaneously.

# PubNub 3.3 for Ruby is a complete rewrite, 
and is NOT compatible with earlierversions of Pubnub Ruby Client.

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

### Publish

For message, you can just pass: 

 - a "String"
 - a Number 123
 - an array [ 1, 2, 3 ]
 - an object { :a => "apple" }

> it will be serialized as a JSON for the transport to your mobile and web apps.

```ruby
@my_callback = lambda { |message| puts(message) }

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

### History (deprecated, use new detailed_history)

```ruby
pubnub.history(
    :cipher_key => "enigma", ## OPTIONAL
    :channel    => @no_history_channel,
    :limit      => 10,
    :callback   => @my_callback
)
```

### Detailed Message History

Archive messages of on a given channel. Optional start, end, and reverse option examples can be found in the tests.
```ruby
pubnub.detailed_history(
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

### Passing block

You can pass a block of instructions insted of `:callback` parameter

```ruby
#TODO example here after discuss inaccuracy
```
