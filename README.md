# Please direct all Support Questions and Concerns to Support@PubNub.com

##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

## PubNub Gem version 3.6.7

www.pubnub.com - PubNub Real-time Push Service in the Cloud.

The PubNub Network is a blazingly fast Global Messaging Service for building real-time web and mobile apps. Thousands of apps and developers rely on PubNub for delivering human-perceptive real-time experiences that scale to millions of users worldwide. PubNub delivers the infrastructure needed to build amazing Mobile, MMO games, social apps, business collaborative solutions, and more.

# New in 3.6

Made response format compatible across all operations. This may break existing parsing, please be sure to modify your code accordingly.

### Examples of affected operations
#### WhereNow
```ruby
envelope = pubnub.where_now(uuid: :some_uuid, http_sync: true)

# Returns array with single envelope with:
# @message that holds message from server
# @parsed_response that holds parsed response form server
# @payload extracted payload from server response
# @response that holds unparsed response from server (String)
# @service that holds service name

# So getting back to example, we will get:
#[#<Pubnub::Envelope:0x007f9141c24e88
#  .../cut/...
#  @message="OK",
#  @parsed_response={"status"=>200, "message"=>"OK", "payload"=>{"channels"=>[]}, "service"=>"Presence"},
#  @payload={"channels"=>[]},
#  @response="{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": []}, \"service\": \"Presence\"}",
#  @service="Presence",
#  .../cut/...
#]
#
# Old one envelope held just parsed_response as @message and @response_message
#

```

#### Leave
```ruby
envelope = pubnub.leave(channel: :some_channel, http_sync: true)

# Returns array with single envelope with:
# @message that holds message from server
# @parsed_response that holds parsed response form server
# @response that holds unparsed response from server (String)
# @service that holds service name

# So getting back to example, we will get:
#[#<Pubnub::Envelope:0x007fa3850184e0
#  .../cut/...
#  @message="OK",
#  @parsed_response={"status"=>200, "action"=>"leave", "message"=>"OK", "service"=>"Presence"},
#  @response="{\"status\": 200, \"action\": \"leave\", \"message\": \"OK\", \"service\": \"Presence\"}",
#  @service="Presence",
#  .../cut/...
#]
#
# Old one envelope held just parsed_response as @message and @response_message
#

```

#### State
```ruby
envelope = pubnub.state(channel: :some_channel, uuid: :some_uuid, http_sync: true)

# Returns array with single envelope with:
# @channel that holds channel name
# @message that holds message from server
# @parsed_response that holds parsed response form server
# @payload extracted payload from server response
# @response that holds unparsed response from server (String)
# @service that holds service name
#
# So getting back to example, we will get:
#[#<Pubnub::Envelope:0x007fa38542e098
#  .../cut/...
#  @channel="some_channel",
#  @message="OK",
#  @parsed_response={"status"=>200, "uuid"=>"some_uuid", "service"=>"Presence", "message"=>"OK", "payload"=>{"one"=>1}, "channel"=>"some_channel"},
#  @payload={"one"=>1},
#  @response="{\"status\": 200, \"uuid\": \"some_uuid\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"one\": 1}, \"channel\": \"some_channel\"}",
#  @service="Presence",
#  @channel="some_channel",
#  .../cut/...
#]
#
# Old one envelope held just @payload and @channel
#
```
#### PAM operations

##### Grant
```ruby
envelope = pubnub.grant(channel: :some_channel, read: 1, write: 1, http_sync: true)

# Returns array with single envelope with:
# @message that holds message from server
# @parsed_response that holds parsed response form server
# @payload extracted payload from server response
# @response that holds unparsed response from server (String)
# @service that holds service name
#
# So getting back to example, we will get:
#[#<Pubnub::Envelope:0x007fa381a4f9f8
#  .../cut/...
#  @message="Success",
#  @parsed_response=
#   {"status"=>200,
#    "service"=>"Access Manager",
#    "message"=>"Success",
#    "payload"=>{"channels"=>{"some_channel"=>{"r"=>1, "w"=>1}}, "subscribe_key"=>"sub-c", "ttl"=>1440, "level"=>"channel"}},
#  @payload={"channels"=>{"some_channel"=>{"r"=>1, "w"=>1}}, "subscribe_key"=>"sub-c", "ttl"=>1440, "level"=>"channel"},
#  @response=
#   "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"some_channel\":{\"r\":1,\"w\":1}},\"subscribe_key\":\"sub-c\",\"ttl\":1440,\"level\":\"channel\"}}",
#  @service="Access Manager",
#  .../cut/...
#]
#
# Old one envelope held just @payload, @channel and parsed_response as @message
#
```

##### Audit
```ruby
envelope = pubnub.grant(channel: :some_channel, http_sync: true)

# Returns array with single envelope with:
# @message that holds message from server
# @parsed_response that holds parsed response form server
# @payload extracted payload from server response
# @response that holds unparsed response from server (String)
# @service that holds service name
#
# So getting back to example, we will get:
#[#<Pubnub::Envelope:0x007fa38517d740
#  .../cut/...
#  @message="Success",
#  @parsed_response=
#   {"status"=>200,
#    "service"=>"Access Manager",
#    "message"=>"Success",
#    "payload"=>{"channels"=>{"some_channel"=>{"r"=>1, "w"=>1, "ttl"=>1435}}, "subscribe_key"=>"sub-c", "level"=>"channel"}},
#  @payload={"channels"=>{"some_channel"=>{"r"=>1, "w"=>1, "ttl"=>1435}}, "subscribe_key"=>"sub-c", "level"=>"channel"},
#  @response=
#   "{\"status\":200,\"service\":\"Access Manager\",\"message\":\"Success\",\"payload\":{\"channels\":{\"some_channel\":{\"r\":1,\"w\":1,\"ttl\":1435}},\"subscribe_key\":\"sub-c\",\"level\":\"channel\"}}",
#  @response_message=nil,
#  @service="Access Manager",
#  .../cut/...
#]
#
# Old one envelope held just @payload as parsed_response as @message and @channel
#
```
##### Revoke

Same as Grant.

### Upgrading from PubNub 3.3.x and Earlier
PubNub 3.6.7 is NOT compatible with earlier than 3.4 versions of Pubnub Ruby Client.

### Upgrading from PubNub 3.4 and higher versions
PubNub 3.6.7 is compatible with 3.4 version.

#### Asynchronous vs Synchronous Responses
Every event you will fire could be fired asynchronous or synchonous just by passing 
```ruby
:http_sync
```
set to true to that event. Asynchronous events will not block your main thread and will be fired withing new thread.

#### Message Handling: callback, block, return
Results are provided via block, callback, and return, depending on how you structure the call. Callback will be fired for every message that will event get in response. Synchornous events will return array of envelopes (if you passed callback to sychronous event it will be called too!).

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

If you wish to make asyncronous calls (implemented via EventMachine), you have a few different patterns you can follow:

```ruby
# Lets use a callback for the first example...
cb = lambda { |envelope| puts envelope.message }

# Asynchronous is implicitly enabled by default, if you do not provide an :http_sync option
pubnub.publish(:message => msg, :channel => channel, :callback => cb)

# You can also explicitly request async with :http_sync => false
pubnub.publish(:message => msg, :channel => channel, :callback => cb, :http_sync => false)

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

#### Leave
Unsubscribes from given channel and fires leave event. You need to be subscribed (only async counts) to channel that you want to leave

```ruby
pubnub.subscribe(
    :channel  => :hello_world,
    :callback => @my_callback
)

pubnub.leave(
    :channel => :hello_world,
    :callback => @my_callback
)
```

If you want to force leave channel that you're not subscribed to, you can pass :force option to event

```ruby
# Wrong
pubnub.leave(
    :channel => :not_subbed_channel,
    :callback => @my_callback
)
# We'll get error:
Pubnub::ArgumentError: You cannot leave channel that is not subscribed

# Good
p.leave(
    :channel => :force_leave,
    :force => true,
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

#### WhereNow
See where is client with specific uuid

```ruby
p.where_now(
    :uuid => :my_friend,
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

######Notice!

Whenever you're using PAM event you can pass `presence` key instead of channel.

```ruby
pubnub.grant(:presence => :demo) do |envelope|
  puts envelope.message
end
```

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
Revokes right to read and write

```ruby
pubnub.revoke(:channel => :forbidden) do |envelope|
  puts envelope.payload
end

pubnub.grant(:channel => :forbidden, :auth_key => :godzilla) do |envelope|
  puts envelope.payload
end
```


### Advanced Usage Examples

##### Init
```ruby
# Example below shows passing more options for client
# Pubnub.new returns Pubnub::Client instance
pubnub = Pubnub.new(
  :error_callback             => custom_error_callback,
  :connect_callback           => custom_connect_callback,
  :ssl                        => true,
  :uuid                       => 'newton',
  :port                       => 80,
  :origin                     => custom_origin,
  :subscribe_timeout          => 310,
  :non_subscribe_timeout      => 5,
  :max_retries                => 10, # max retries if response got invalid json
  :ttl                        => custom_default_ttl_for_pam,
  :secret_key                 => 0
)
```

###### Custom logger
You can pass your custom logger as :logger key while creating new Pubnub instance. Logger invocations has set progname 'Pubnub'.

##### Publish
```ruby
# Message could be any object that have .to_json method
# You do not need to jsonify message before sending
# This time publish event will block main thread until callback will finish as we set :http_sync to true
pubnub.publish(
  :messsage => message,
  :channel  => :whatever,
  :http_sync => true )
```

##### Subscribe
```ruby
# You can pass in :channel or :channels String, Symbol, Array of both, or csv separated with commas, remember, as space is valid channel part, there should not be any spaces between commas (unless you want them)
# Some example of valid channels:
# :example_symbol
# 'example_string'
# [:one, :two, 'three']
# [:anything]
# 'one,two,three'

# Firing sync subscribe could lock your thread even for 5 minutes
# When there's no traffic on channel server will send timetoken without
# any messages every ~300s.
# First sync subscribe will just update your timetoken, you will not get any messages
# example:
pubnub.subscribe(:channel => 'alerts', :http_sync => true) # just update timetoken
pubnub.subscribe(:channel => 'alerts', :http_sync => true) # Will fire request with current timetoken and can possibly get messages

# Async subscribe starts infinity loop in seperate thread (EM.periodic_timer precisely)
# It will update your timetoken and will fire given callback for every message that it gets
# example:
pubnub.subscribe(
  :channel => 'fight_log'
) do |envelope|
  puts envelope.message['attacker']
  puts envelope.message['defender']
  puts envelope.message['demage']
end
```

##### History
History returns :count messages from given channel.
```ruby
pubnub.history(
  :channel  => :actions,
  :count    => 10,
  :start    => 13942156708212448,
  :end      => 13942156908212448,
  :callback => replay
)
```

:reverse set to true will traverse the time line in reverse starting with the newest message first. Default is false.
If both start and end arguments are provided, reverse is ignored and messages are returned starting with the newest message.

```ruby
pubnub.history(
  :channel  => :actions,
  :count    => 10,
  :reverse  => true,
  :callback => replay
)
```
History envelope also contains .history_start and .history_end values

##### Paged History

Paginate through your history. You can pass `:channel`, `:page`, `:limit`, `:callback`, `:http_sync`, `:start` and `:end` options, all of them works like in history event.

```ruby
pubnub.paged_history(
  :channel   => :actions,
  :limit     => 10,
  :page      => 3,
  :http_sync => true
)
```

##### Presence
Presence works exactly the same way as subscribe, it just adds '-pnpres' to channel name.
```ruby
pubnub.subscribe(
  :channel => :mars
) do |envelope|
  show_in_roster(envelope.uuid)
end
```

##### HereNow
HereNow shows us who is currently subscribing channel and how much clients are online on given channel.
```ruby
pubnub.here_now(
  :channel => :pamam_moon_iv
) do |envelope|
  puts envelope.msg['uuids']
  puts envelope.msg['occupancy']
end
```

You can also give no specific channel. Then you'll get global HereNow event response which holds all channels.

```ruby
pubnub.here_now { |envelope| puts envelope.msg['channels'] }
```


##### Heartbeat

You can set/update heartbeat rate in seconds while creating Pubnub object
```ruby
pubnub = Pubnub.new(:subscribe_key => 'demo', :heartbeat => 60)
```

Update it via heartbeat= and set_heartbeat()
```ruby
pubnub.heartbeat = 120
pubnub.set_heartbeat 240
```

Read it via heartbeat and get_heartbeat()
```ruby
pubnub.heartbeat
pubnub.get_heartbeat
```

Heartbeat is used to check if client is still online,
if client would disconnect without leave event, and there will be lack of heartbeat in given interval
server will fire leave event for disconnected client uuid.


#### Pam
PAM allows you to grant read and write access basing on channels and auth_keys.
Every pam event requires :secret_key (Remember! You should set it while initializing pubnub)

PAM actions could take :presence option, that will grant/revoke/audit permissions on given presence channel.
:presence option can be used along with :channel.

##### Audit
```ruby
pubnub.audit(:channel => 'hidden_system'){ |envelope| puts envelope.msg }

```

##### Grant
```ruby
# Channel level
pubnub.grant(:channel => 'hidden_system', :read => true, :write => false){ |envelope| puts envelope.msg }

# Auth key level
pubnub.grant(:channel => 'hidden_system', :read => true, :write => false, :auth_key => :lemon){ |envelope| puts envelope.msg }
```

##### Revoke
Works like grant but revokes all previously given privilages
```ruby
# Channel level
pubnub.revoke(:channel => 'hidden_system'){ |envelope| puts envelope.msg }

# Auth key level
pubnub.revoke(:channel => 'hidden_system', :auth_key => :lemon){ |envelope| puts envelope.msg }
```

### State
State is stored on the server for subscribed uuid, you can pass state in few ways and you can get it from server.

#### Setting state
```ruby
# You can set state in a few ways
# Using subscribe
pubnub.subscribe(:channel => 'my_channel', :state => {:my_channel => {:key => :value}}){ |e| puts e.msg }
# Be aware that state have to be hash of hashes where keys are subscribed channel names

# Using event #set_state
pubnub.set_state(:state => {:key => :value}, :channel => :my_channel, :http_sync => true)

```

#### Getting state
```ruby
# All you need to know is just uuid and channel
pubnub.state(:uuid => 'uuid_client_that_i_am_searching_for', :http_sync => true)
```

### Other

Advanced usage examples can be found also in the examples directory.

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

## Proxy support
Basic proxy is supported using ENV global, before initializing pubnub just set:

```ruby
ENV['HTTP_PROXY']      = 'http://my.poxy/'
ENV['HTTP_PROXY_USER'] = 'user'
ENV['HTTP_PROXY_PASS'] = 'secret'
```

after that you can initialize pubnub object as always.

## Comment on Passenger users
Passenger is orphaning threads and it causes issues with EM which is need to run async pubnub events.
Below is fix that worked with our tests. You should fire that code from your initializers.

Some other environments could cause similar problems with EM, if you think you're affected, feel free to open issue and we will do our best to help.

```ruby
module Pubnub
  # Taken from http://www.hiringthing.com/2011/11/04/eventmachine-with-rails.html
  # Thanks Joshua!
  def self.start
    if defined?(PhusionPassenger)
      PhusionPassenger.on_event(:starting_worker_process) do |forked|
        # for passenger, we need to avoid orphaned threads

        $my_logger.debug "=> Starting worker process"

        if forked && EM.reactor_running?
          $my_logger.debug "=> EventMachine stopped fork"
          EM.stop
        end
        Thread.new {
          EM.run do
            $my_logger.debug "=> EventMachine started"
          end
        }
        die_gracefully_on_signal
      end
    end
  end

  def self.die_gracefully_on_signal
    $my_logger.debug "=> EventMachine stopped die"
    Signal.trap("INT")  { EM.stop }
    Signal.trap("TERM") { EM.stop }
  end
end

Pubnub.start
```

# Please direct all Support Questions and Concerns to Support@PubNub.com
