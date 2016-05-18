# Important Information
### Events
All events accept basic parameters:
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| http_sync      | optional | boolean                         | Default false. Method will be executed asynchronously and will return future, to get it's value you can use `#value` method. If set to true, method will return array of envelopes (even if there's only one envelope).|
| callback       | optional | lambda accepting one parameter  | Callback that will be called for each envelope. |

##### Returned values
For sync methods Envelope object will be returned (`#subscribe` and `#presence` are exceptions - they will return array of envelopes - envelope for each message). For async methods future will be returned, to retrieve value Envelope object you have to call `#value` method (thread will be locked until the value is returned).

# Add Channels To Channel Group
### DESCRIPTION
This method adds a channel to a channel group.

### METHOD
To Add Channels to Channel Group you can use the following method in the Ruby SDK

`#channel_registration(action: :add, channel: channel, channel_group: channel_group)`
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| action        | required | symbol         | Action that you want to preform, to add, it's `:add`. |
| channel       | required | string/symbol  | The `channel` to add to channel group. |
| channel_group | required | string/symbol  | The `channel_group` to add channel to.

### BASIC USAGE
```ruby
# Async without callback
future = pubnub.channel_registration(action: :add, channel: :my_channel, channel_group: :somegroup)

# Sync without callback
envelopes = pubnub.channel_registration(action: :add, channel: :my_channel, channel_group: :somegroup, http_sync: true)

# Async with callback (callback can be specified also as :callback key)
future = pubnub.channel_registration(action: :add, channel: :my_channel, channel_group: :somegroup){ |envelope| puts envelope.status }
```

# Audit
### DESCRIPTION
This function provides a mechanism to reveal existing PubNub Access Manager attributes for any combination of `subscribe_key`, `channel`, `auth_key`.
### METHOD
To run `Audit` you can use the following method in the Ruby SDK
`#audit(channel: channel, auth_key: auth_key)`
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| auth_key      | Optional | string/symbol  | Specifies the `auth_key` to return PAM attributes for. If only a single `channel` is specified, it is possible to return results for a comma separated list of `auth_keys`. |
| channel       | Optional | string/symbol  | Specifies `channel` name to return PAM attributes optionally in combination with `auth_key`. If `channel` or `channel_group` is not specified, results for all channels associated with `subscribe_key` are returned. If `auth_key` is not specified, it is possible to return results for a comma separated list of channels. |
| channel_group | Optional | string/symbol  | Specifies `channel_group` name to return PAM attributes optionally in combination with `auth_key`. |

### EXAMPLE USAGE
```ruby
# Reveal PAM permissions for `channel` and all associated `auth_key` entries:
pubnub.audit(channel: :my_channel, auth_key: :my_authkey) do |envelope|
  puts envelope.result[:data]
end
```

# Get Authentication Key
### DESCRIPTION
This method provides the capability to get a user's `auth_key`.
### METHODS
#auth_key()

### BASIC USAGE
```ruby
pubnub.auth_key
```

### RETURNS
Te current authentication key.

# Get State

### DESCRIPTION
The state API is used to get key/value pairs specific to a subscriber `uuid`.
State information is supplied as a JSON object of key/value pairs.

### METHOD
To `get_state` you can use the following method in Ruby SDK
`#get_state(channel: channel, uuid: uuid)`
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | Required | string/symbol  | Specifies `channel` name to get state from. |
| uuid       | Optional | string         | Specifies `uuid`.|

### BASIC USAGE
Returning state information.
```ruby
pubnbu.state(channel: :my_channel, uuid: 'some-uuid') do |envelope|
  puts envelope.result[:data][:state]
end
```

# Global Here Now
### DESCRIPTION
Return `occupancy` for add channels.

### METHOD
To do global `here_now` you can use the following method in the Ruby SDK.

`#here_now`

This method doesn't take any other options than basic (like `http_sync`, `callback`).

# Grant

### DESCRIPTION
CURRENT DESCRIPTION IS OK

### METHOD
To `grant` permission on a channel or group you can use following method in Ruby SDK.

```#grant(channel: channel, channel_group: :group, auth_key: auth_key, read: read, write: write, manage: manage, ttl: ttl)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | optional | string / symbol  | Specifies `channel` name to grant permissions to. If `channel` is not specified, the grant applies to all channels associated with the `subscribe_key`. If `auth_key` is not specified, it is possible to grant permissions to multiple channels simultaneously by specifying the channels as a comma separated list. |
| channel_group | optional | string / symbol  | Specifies `channel_group` name to grant permissions to. |
| auth_key   | optional | string / symbol  | Specifies `auth_key` to grant permissions to. |
| read       | optional | boolean          | Read permissions. (default: true) |
| write      | optional | boolean          | Write permissions. (default: true) |
| manage     | optional | boolean          | Manage permissions. (default: true) |
| ttl        | optional | integer          | Time in minutes for which granted permissions are valid. Default is `1440` (24hrs), Max is `525600` , Min is `1`. Setting `ttl` to `0` will apply the grant indefinitely. |

# Here Now

### DESCRIPTION
You can obtain information about the current state of a channel including a list of unique user-ids currently subscribed to the channel and the total occupancy count of the channel by calling the `#here_now` method in your application.

### METHOD
```#here_now(channel: channel)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | optional | string / symbol  | Specifies the `channel` name to return occupancy results. If channel is not provided, `here_now` will return data for all channels (global `here_now`). |
| channel_group      | optional | string / symbol  | Specifies the `channel_group` name to return occupancy results. |

# History
### DESCRIPTION
CURRENT DESCRIPTION IS OK

### METHOD
To run `history` you can use the following method in Ruby SDK.

```#history(channel: channel, count: count, start: start, end: end, reverse: reverse)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | required | string / symbol  | Specifies channel to return history messages from. |
| count      | optional | integer          | Specifies the number of historical messages to return. Default/maximum is 100. |
| start      | optional | integer          | Time token delimiting the start of time slice (exclusive) to pull messages from. |
| end        | optional | integer          | Time token delimiting the end of time slice (inclusive) to pull messages from. |
| reverse    | optional | boolean          | Setting to true will traverse the time line in reverse starting with the oldest message first. Default is false. If both start and end arguments are provided, reverse is ignored and messages are returned starting with the newest message. |

# Initialize
### DESCRIPTION
##### Installing
In order to use pubnub ruby gem you need to install it. You can do it via rubygems command:
```
gem install pubnub
```
Or add it to your Gemfile.
```
gem 'pubnub', '~> 4.0'
```

##### Usage
To use pubnub you need to require it in your files.
```
require 'pubnub'
```
That's it, you can use pubnub ruby client right away.

### METHODS

To initialize pubnub client you need to use #new method and specify at least required parameters in hash of parameters.

```ruby
pubnub = Pubnub.new(
  subscribe_key: :demo,
  publish_key:   :demo
)
```
There are more parameters that could be passed while initializing client:
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| subscribe_key    | required | string / symbol  | Your subscribe key |
| publish_key      | optional |  string / symbol | Your publish key. Required to publish messages.
| secret_key       | optional | string / symbol | Your secret key. Required for PAM.  |
| auth_key         | optional | string / symbol | Your auth key. |
| cipher_key       | optional | string          | Your cipher key, it's used to encrypt and decrypt messagages if set.  |
| ssl              | optional | boolean         | If set to `true` ssl connection will be used.  |
| uuid             | optional | string          | If not set, it will be generated by pubnub client. Has to be unique. |
| connect_callback | optional | lambda          | `connect_callback` will be called on successful connection to pubnub cloud.  |
| heartbeat        | optional | integer         | Setting value of heartbeat enables heartbeat with given value. Heartbeat starts with first async subscribe. Disabled by default. |
| callback         | optional | lambda          | That callback will be automatically passed to all method calls fired from this client (like publish, history, subscribe). Will be overwrote by callback passed to called event. |
| ttl               | optional | integer          | Default ttl for grant and revoke. |
| open_timeout     | optional  | integer          | Timeout for opening connection for non-subscribe events. |
| read_timeout     | optional | integer          |  Timeout for reading for non-subscribe events. |
| idle_timeout      | optional | integer          | Timeout for idle for non-subscribe events. |
| s_open_timeout    | optional | integer          | Timeout for opening connection for subscribe. |
| s_read_timeout    | optional | integer          | Timeout for read for subscribe. |
| s_idle_timeout    | optional | integer          | Timeout for idle for subscribe. |
| origins_pool      |optional | array of strings | Custom origins pool. |


# List all Channels from a Channel Group

### DESCRIPTION
This function lists all the channels of the channel group.

### METHOD
To `list all channels in a channel group` you can use the following method in the Ruby SDK.

```#channel_registration(action: :get, channel_group: group)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| action    | required | symbol           | To get all channels from a channel group you need to specify action as :get. |
| channel_group     | required | symbol / string  | Channel group to fetch the channels of. |

# Presence to a Channel Group

### DESCRIPTION
This functions subscribes to the presence channel of a channel group.

### METHOD
To do `Presence to a Channel Group` you can use the following method(s) in Ruby SDK:
***Go to subscribe***

### BASIC USAGE
Subscribe to presence channel of a channel group
```ruby
pubnub.presence(channel_group: 'my_group') do |envelope|
  puts envelope.parsed_response
end
```

# Listener
Listeners are used to handle messages from subscriptions.

### Adding listener
```ruby
callbacks = Pubnub::SubscribeCallback.new(
  message:  ->(envelope) { puts #{envelope.result[:data][:message]}" },
  presence: ->(envelope) { puts #{envelope.result[:data][:message]}" },
  status:   ->(envelope) { puts #{envelope.status}" }
)

pubnub.add_listener(name: 'my_listener', callback: callbacks)

```

### Removing listener
```ruby


pubnub.remove_listener(name: 'my_listener')
# or
pubnub.remove_listener(callbacks)


```

### Example
```ruby
# Init pubnub client
pubnub_client = Pubnub.new(subscribe_key: 'demo', publish_key: 'demo')

# First callbacks object
callbacks0 = Pubnub::SubscribeCallback.new(
  message:  ->(envelope) { puts "C0 MESSAGE: #{envelope.result[:data][:message]}" },
  presence: ->(envelope) { puts "C0 PRESENCE: #{envelope.result[:data][:message]}" },
  status:   ->(envelope) { puts "C0 STATUS: #{envelope.result[:data][:message]}" }
)

# Second callbacks object
callbacks1 = Pubnub::SubscribeCallback.new(
  message:  ->(envelope) { puts "C1 MESSAGE: #{envelope.result[:data][:message]}" },
  presence: ->(envelope) { puts "C1 PRESENCE: #{envelope.result[:data][:message]}" },
  status:   ->(envelope) { puts "C1 STATUS: #{envelope.result[:data][:message]}" }
)

# Adding listener allows you to specify name, it's not required to specify a name
pubnub_client.add_listener(name: 'c0', callback: callbacks0)

# Let's subscribe somewhere
pubnub_client.subscribe(channel: :demo, presence: :demo)

# SOME OUTPUT:
# C0 PRESENCE: {"action"=>"join", "timestamp"=>1461683357, "uuid"=>"fc0c0460-44b4-4338-b7e9-1b534b85072e", "occupancy"=>2}
# C0 MESSAGE: {"text"=>"hey"}
# C0 PRESENCE: {"action"=>"join", "timestamp"=>1461683374, "uuid"=>"3efb92f6-bf02-4373-aafa-996527718ecc", "occupancy"=>3}
# C0 MESSAGE: {"text"=>"hey"}

# Adding another subscriber
pubnub_client.add_listener(name: 'c1', callback: callbacks1)

# SOME OUTPUT WITH TWO LISTENERS ACTIVE:
# C0 MESSAGE: {"text"=>"hey"}
# C1 MESSAGE: {"text"=>"hey"}
# C0 PRESENCE: {"action"=>"leave", "timestamp"=>1461683435, "uuid"=>"3efb92f6-bf02-4373-aafa-996527718ecc", "occupancy"=>2}
# C1 PRESENCE: {"action"=>"leave", "timestamp"=>1461683435, "uuid"=>"3efb92f6-bf02-4373-aafa-996527718ecc", "occupancy"=>2}

# We're removing subscriber by giving it's name
pubnub_client.remove_listener(name: 'c1')

# SOME OUTPUT AFTER REMOVING C1 LISTENER
# C0 MESSAGE: {"text"=>"hey"}
# C0 MESSAGE: {"text"=>"hey"}
# C0 PRESENCE: {"action"=>"join", "timestamp"=>1461683698, "uuid"=>"3efb92f6-bf02-4373-aafa-996527718ecc", "occupancy"=>2}

# We're removing subsciber by giving it's object, now we don't have any listeners active
pubnub_client.remove_listener(callback: callbacks0)
```


# Publish
CURRENT DESCRIPTION IS OK

### METHOD
To `publish` a message you can use the following method in the Ruby SDK.

```#publish(channel: channel, message: message, store: store, compressed: compressed, publish_key: publish_key)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | required | symbol / string    | Specifies `channel` name to `publish` messages to. |
| message    | required | Object (see notes) | Serializable object that has definied `#to_json` method. |
| store      | optional | boolean            | Specifies if message should be stored for `history`. Default true. |
| compressed | optional | boolean            | Specifies if message should be compressed. Default false. |

### BASIC USAGE
Publish a message to a channel:
```ruby
pubnub.publish(
  channel: 'my_channel',
  message: { text: 'Hi!' }
) do |envelope|
  puts envelope.status
end
```

# Remove Channels from a Channel Group

### DESCRIPTION

This method removes the channels from the channel group.

### METHOD
To `remove channels from a channel group` you can use the following method in the Ruby SDK.

```#channel_registration(action: :remove, channel: channel, channel_group: group)```.
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| action     | required | symbol             | Use `:remove` to remove channel. |
| channel    | required | symbol / string    | Specifies `channel` name to remove from channel group. |
| channel_group      | required | symbol / string    | Specifies `channel_group` name to remove channel from. |

# Set Authentication Key !!! REMOVE

# Set State
### DESCRIPTION
The state API is used to set key/value pairs specific to a subscriber `uuid`.
State information is supplied as a JSON object of key/value pairs.

### METHOD
To `set_state` you can use following method in the Ruby SDK
```#set_state(channel: channel, state:  state)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel    | required | symbol / string    | Specifies `channel` name to set state for. |
| state      | required | Hash               | The state to set. |

### BASIC USAGE
```ruby
pubnub.set_state(channel: 'my_channel', state: { key: 'value' }) do |envelope|
  puts envelope.state
end
```

# Subscribe
### DESCRIPTION
...
### METHOD
To `subscribe` to a channel you can use the following method in the Ruby SDK

```#subscribe(channel: channel, channel_group: group, presence: presence, callback: callback, presence_callback: presence_callback)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel           | optional | symbol / string / array | Specifies the channel to subscribe to. It is possible to specify multiple channels as an array. It is possible to subscribe to wildcard channels. See Examples for more info. |
| channel_group  | optional | symbol / string / array | Specifies the group to subscribe to. It is possible to specify multiple groups as an array. See Examples for more info. |
| presence          | optional | symbol / string / array | Specifies the channel to presence subscribe to. It is possible to specify multiple channels as an array. See Examples for more info. |
| callback          | optional | lambda accepting one argument | Callback that is called for each retreived message. *Works only with http_sync set to true.*|
| presence_callback | optional | lambda accepting one argument | Callback that is called for each presence event **from wildcard subscribe**. *Works only with http_sync set to true.

### LISTENERS
The response of the subscription is handled by Listener. Please see the Listener section for more details.

### USAGE
```ruby
# Subscribe to channel 'my_channel'.
pubnub.subscribe(
  channel: :my_channel
)
```

```ruby
# Subscribe to wildcard channel 'ruby.*' (make sure you have wildcard subscribe enabled in your pubnub admin console!)
# specify two different callbacks for messages from channels and presence events in channels.
pubnub.subscribe(
  channel: 'ruby.*'
)
```

```ruby
# Subscribe to channel ruby and ruby-pnpres (presence).
pubnub.subscribe(
  channel: 'ruby',
  presence: 'ruby'
)
```

```ruby
# And channel 'ruby' presence (ruby-pnpres).
pubnub.subscribe(
  presence: 'ruby'
)
```

```ruby
# Subscribe to group
pubnub.subscribe(
  channel_group: 'ruby_group'
```

```ruby
# Subscribe to channels (with presence) and groups
pubnub.subscribe(
  channel: ['debug', 'info', 'warn'],
  channel_group: ['ruby_group', 'jruby_group', 'rbx_group'],
  presence: ['debug', 'info', 'warn']
)
# You will be subscribed to channels: debug, info, warn, debug-pnpres, info-pnpres and warn-pnpres
# and to groups: ruby_group, jruby_group, rbx_group.
```

# Subscribe to a Channel Group
See `#subscribe`

# Time
### DESCRIPTION
...
### METHOD
To fetch `time` form server you can use the following method in the Ruby SDK.

```#time```

Time doesn't accept any other keys than basic ones. 

# Unset Authentication Key !!! REMOVE !!!

# Unsubscribe

### DESCRIPTION
When subscribed to a single channel or group, this function causes the client to issue a `leave` from the `channel` or group and close any open socket to the PubNub Network. For multiplexed channels, the specified channel(s) or group(s) will be removed and the socket remains open until there are no more channels remaining in the list.

### METHOD
```#unsubscribe(channel: channel, channel_group: group)``` aliased to ```leave```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| channel | optional | symbol / string | Specifies the `channel` to unsubscribe from. (Required if `channel_group` is not specified) |
| channel_group   | optional | symbol / string | Specifies the `channel_group` to unsubscribe from. (Required if `channel` is not specified) |

### BASIC USAGE
```ruby
pubnub.unsubscribe(
  channel: 'my_channel'
) do |envelope|
  puts envelope.status
end
```

```ruby
pubnub.unsubscribe(
  channel: ['chan1','chan2','chan3']
) do |envelope|
  puts envelope.status
end
```

```ruby
pubnub.leave(channel_group: :cg1) do |envelope| 
  puts envelope.status
end
```

# UUID !!! REMOVE !!!!

# Where Now

### DESCRIPTION
You can obtain information about the current list of a `channels` to which a `uuid` is subscribed to by calling the `#where_now` method in your application.

### METHOD
To do `where_now` you can use the following method in the Ruby SDK.
```#where_now(uuid: uuid)```
| parameter | required?  |  type |  notes |
|---------------|---|---|---|
| uuid | required | string | `UUID` we are looking for.

### BASIC USAGE
```ruby
pubnub.where_now(
  uuid: "my_uuid"
) do |envelope|
  puts envelope.result[:data]
end
```
