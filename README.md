##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

## PubNub Gem version 3.5.0

www.pubnub.com - PubNub Real-time Push Service in the Cloud.

The PubNub Network is a blazingly fast Global Messaging Service for building real-time web and mobile apps. Thousands of apps and developers rely on PubNub for delivering human-perceptive real-time experiences that scale to millions of users worldwide. PubNub delivers the infrastructure needed to build amazing Mobile, MMO games, social apps, business collaborative solutions, and more.

### Upgrading from PubNub 3.3.x and Earlier
PubNub 3.5.0 is NOT compatible with earlier than 3.4 versions of Pubnub Ruby Client.

### Upgrading from PubNub 3.4
PubNub 3.5.0 is compatible with 3.4 version.

#### Asynchronous vs Synchronous Responses
Feedback from prior versions of the gem demonstrated that some users would like to 'fire and forget' PubNub calls. Others wanted to block, and take specific action, based on server response.

In 3.4, you can now have both, even on a per-call basis!

#### Message Handling: callback, block, return
Feedback from users of prior versions demonstrated the need for flexibility in how received messages were handled. The general PubNub response pattern dictated that responses be sent to callbacks, however, there was also a non-addressed use case of simply assigning a variable on return.

In 3.4, you can now have both, even on a per-call basis!

### Code Examples

#### Require
```ruby
require 'pubnub'
```

#### Init and instantiate a new PubNub instance
```ruby
# If you wish to override the default logger, create one and pass it in.
# Default logger writes into pubnub.log file

my_logger = Logger.new(STDOUT)

pubnub = Pubnub.new(
    :subscribe_key    => 'demo',
    :publish_key      => 'demo',
    :origin           => origin,
    :error_callback   => lambda { |msg|
      puts "Error callback says: #{msg.inspect}"
    },
    :connect_callback => lambda { |msg|
      puts "CONNECTED: #{msg.inspect}"
    },
    :logger => my_logger
)
```

* subscribe_key is your subscribe key
* publish_key is your publish key
* origin is your custom, PubNub origin (Contact support before production to get your own!)
* error_callback is the callback for errors
* connect_callback is the callback that lets you know when you're connected to the origin

#### Making PubNub calls
There are a few different ways to make any given PubNub call. How to do it depends first on whether or not you want the call to be blocking (synchronous), or not blocking (asynchronous).

##### Asynchronous (non-blocking) calling

If you wish to make asyncronous calls (implemented via EM), you have a few different patterns you can follow:

```ruby
# Lets use a callback for the first example...
cb = lambda { |envelope| puts envelope.message }

# Asynchronous is implicitly enabled by default, if you do not provide an :http_sync option
pubnub.publish(:message => msg, :channel => channel, :callback => cb)

# You can also explicitly request async with :http_sync => false
pubnub.publish(:message => msg, :channel => channel, :callback => cb, :http_sync => true)

# Alternatively, you can pass in the callback as a block

pubnub.publish(:message => msg, :channel => channel, &cb)

pubnub.publish(:message => msg, :channel => channel) do |envelope|
    puts envelope.message
    puts envelope.channel
    puts envelope.status_code
    puts envelope.timetoken
end
```

##### Synchronous (blocking) calling
Synchronous calling is required when using PubNub with JRuby.

If you'd prefer to make your calls blocking (implemented via HTTParty), set :http_sync => true. Again, there is a bit of flexibility in how this can be done:

```ruby

# Lets use a callback for the first example...
cb = lambda { |envelope| puts envelope.message }

# Sync (blocking) with a callback (if you wanted to)
pubnub.publish(:http_sync => true, :message => msg, :channel => channel, &cb)

# Sync (blocking), with assignment via return
myResponse = pubnub.publish(:http_sync => true, :message => msg, :channel => channel)
puts "myR: #{myResponse.inspect}"

# Sync (blocking), with a block
pubnub.publish(:http_sync => true, :message => msg, :channel => channel) do |envelope|
    puts envelope.message
    puts envelope.channel
    puts envelope.status_code
    puts envelope.timetoken
end
```

#### Callback / Block calling sequence

When you receive messages asynchronously from PubNub, your block or callback will be called once for each message received.  For example, if you are subscribed to a channel using the callback pattern, and you receive 3 messages from your call, the callback will be called 3 times, 1 time for each unique received message.

Conceptually, the callback or block is fired once for each message in the raw server response:

```ruby
envelopes.each do |envelope|
    callback.call envelope
end
```


#### The Envelope Object
The callback (or block) will receive the message(s) in the form of an envelope hash. An envelope will contain the following keys:

* message (aliased as 'msg') -> Holds message, if publish, holds published message
* response_message -> as above, except that if publish holds server response (String "Send")
* channel -> Holds channel for current message
* timetoken -> Timetoken of server response
* status (aliased as 'status_code') -> Server response status code
* response -> Whole and unmodified server response
* first -> true if it's first envelope in single response messages array
* last -> true if it's last envelope in single response messages array
* And a bit more, specific to some events, you will find it in description of certain events

Don't confuse the **message** with the **response**. In a given callback cycle, the **response** will always be the same, as its the raw server response. It may consist of one or more messages.

Internally, the block or callback is iterates over the response array, similar to:

```ruby
envelopes.each do |envelope|
    callback.call envelope
end
```

In a given callback cycle, the **envelope** will be the currently iterated envelopes item of the response.

### Simple Usage Examples

#### Init and instantiate a new PubNub instance

```ruby
pubnub = Pubnub.new(
    :subscribe_key    => 'demo',
    :publish_key      => 'demo',
    :origin           => origin,
    :uuid			   => "myUserID",
    :error_callback   => lambda { |msg|
      puts "SOMETHING TERRIBLE HAPPENED HERE: #{msg.inspect}"
    },
    :connect_callback => lambda { |msg|
      puts "CONNECTED: #{msg.inspect}"
    }
)
```

#### Publish
When publishing, send a string, number, array, or hash. PubNub automatically serializes it to JSON for you, so you don't have to.


```ruby
@my_callback = lambda { |envelope| puts(envelope.msg) }

pubnub.publish(
    :channel  => "hello_world",
    :message  => "hi",
    :callback => @my_callback
)
```

#### Subscribe

```ruby
pubnub.subscribe(
    :channel  => :hello_world,
    :callback => @my_callback
)
```

#### History
Retrieve previously published messages (requires activation via admin.pubnub.com)
Optional start, end, and reverse option usage can be found in the tests.

```ruby
pubnub.history(
    :channel  => channel,
    :count    => 10,
    :callback => @my_callback
)
```

#### Presence
In real-time see people join and leave with occupancy summaries. (requires activation via admin.pubnub.com)

```ruby
pubnub.presence(
    :channel  => :hello_world,
    :callback => @my_callback
)
```

#### HereNow
See who is "here now" in a channel at this very moment.

```ruby
pubnub.here_now(
    :channel  => channel,
    :callback => @my_callback
)
```

#### UUID

Session-UUID is automatic, so you will probably not end up ever using this. But if you need a UUID...

```ruby
pubnub.uuid
```

If you wish to manually set a custom UUID, pass in a uuid key in the initializer. See "Init and instantiate a new PubNub instance" for an example.


#### Time
Get the current PubNub time. This is great to use as a "PubNub Ping"

```ruby
pubnub.time("callback" => @my_callback)
```

### PAM

Developers can grant fine-grained Publish/Subscribe permissions for their real-time apps and data, without hosting authentication services Access control can be granted at various levels.

Envelopes returned by PAM events have additional :service and :payload keys.

#### PAM Usage Examples

##### Audit
Audits auths for given parameters

```ruby
pubnub.audit(:channel => :forbidden_for_jim) do |envelope|
  puts envelope.payload
end

pubnub.audit(:channel => :forbidden_for_jim, :auth_key => :jim) do |envelope|
  puts envelope.payload
end
```

##### Grant
Grants auths for given parameters, you can pass :read and :write keys as parameters

```ruby
pubnub.grant(:channel => :forbidden_to_write, :read => true, :write => false) do |envelope|
  puts envelope.payload
end

pubnub.grant(:channel => :forbidden_to_write, :read => true, :write => true, :auth_key => :admin) do |envelope|
  puts envelope.payload
end
```

##### Revoke
Same as grant but reversed

```ruby
pubnub.revoke(:channel => :forbidden_to_write, :read => false, :write => true) do |envelope|
  puts envelope.payload
end

pubnub.grant(:channel => :forbidden_to_write, :read => false, :write => false, :auth_key => :admin) do |envelope|
  puts envelope.payload
end
```


### Advanced Usage Examples

Advanced usage examples can be found in the examples directory.

#### demo_console
A demo console app which shows how to use just about every PubNub Ruby call, just about every possible way!

#### translator
A chat room, with real-time translation! This is using PubNub for the real-time chat, and Bing translation services for babel.

#### pubnub_livestream
Demo rails chat app. It has also been tested with Heroku.

#### sinatra
Sinatra demo.

#### sub_and_unsub_1
Mixing up some async pubs and subs, using blocks and callbacks.

#### serial_publish
Publish 10000 times with an explicit 0.05s delay between publishes
