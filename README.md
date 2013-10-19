##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

## PubNub Gem version 3.4

www.pubnub.com - PubNub Real-time Push Service in the Cloud. 

PubNub is a Real-time Network for Mobile App, Web Apps for pushing updates and enabling real-time notifications and even games!

### Upgrading from PubNub 3.3.x and Earlier
PubNub 3.4 is NOT compatible with earlier versions of Pubnub Ruby Client.  If you are upgrading from 3.3.x, the changes you will need to make are minimal.

### New Features of 3.4
There are a lot of cool features introduced in the 3.4 version of the gem. Notably:

* Ability to carry out requests asynchronously or synchronously
* Message handling via callback, block, and return
* Heroku and JRuby Support (JRuby requires calls to be made synchronously)

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
pubnub = Pubnub.new(
    :subscribe_key    => 'demo',
    :publish_key      => 'demo',
    :origin           => origin,
    :error_callback   => lambda { |msg|
      puts "SOMETHING TERRIBLE HAPPENED HERE: #{msg.inspect}"
    },
    :connect_callback => lambda { |msg|
      puts "CONNECTED: #{msg.inspect}"
    }
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
puts "myR: #{myResponse}" 

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

```
foreach (message in response)
    callbackOrBlock(message)
```


#### The Envelope Object and Pubnub::Response
The callback (or block) will receive the message(s) in the form of an envelope hash. An envelope will contain the following keys:

* message (aliased as 'msg') -> Holds message
* channel -> Holds channel for current message
* timetoken -> Timetoken of server response
* status_code -> Server response status code
* response -> Whole and unmodified server response

Don't confuse the **message** with the **response**. In a given callback cycle, the **response** will always be the same, as its the raw server response. It may consist of one or more messages.

Internally, the block or callback is iterates over the response array, similar to:

```
foreach (message in response)
    callbackOrBlock(message)
```

In a given callback cycle, the **message** will be the currently iterated message item of the response.

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
    :channel  => "hello_world"",
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

#### Here_now 
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
Publish 1000 times with an explicit 0.25s delay between publishes

