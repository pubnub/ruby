# Pubnub Ruby SDK upgrade guide
This guide covers upgrading pubnub SDK from 3.8 to 4.x version.

## Subscribe changes
Here are big changes. Subscribe doesn't accept callback parameter anymore, right now you need to create Listener instance and attach it to pubnub client object.

Listener has to contain three callbacks, for status messages (like connect, disconnect), for messages on channel (messages published on subscribed channels) and for presence events (like join, leave).

Example of listener:
```ruby=
listener = Pubnub::SubscribeCallback.new(
    # Callback for messages published on subscribed channels
    message:  lambda do |envelope| 
        puts "MESSAGE: #{envelope.result[:data]}"
    end,
    # Callback for presence events from subscribed channels
    presence: lambda do |envelope|
        puts "PRESENCE: #{envelope.result[:data]}"
    end,
    # Status callbacks
    status:   lambda do |envelope|
        puts "\n\n\n#{envelope.status}\n\n\n"
 
        if envelope.error?
            # Something bad happend
            puts "ERROR! #{envelope.status[:category]}"
        else
            # Connected!
            puts 'Connected!' if envelope.status[:last_timetoken] == 0
        end
    end
)
```

And attaching it to client:
```ruby
pubnub.add_listener(callback: listener)
```

Simple example of upgraded code:
```ruby=
# Old one
pubnub.subscribe(channel: :demo){ |envelope| puts envelope.message }

# New one
listener = Pubnub::SubscribeCallback.new(
    message:  ->(envelope){ puts envelope.result[:data] },
    status:   ->(_e){},
    presence: ->(_e){}
)

pubnub.add_listener(callback: listener)

pubnub.subscribe(channel: :demo)
```

## Presence changes
Take a look at subscribe changes, presence works exactly te same way, presence messages are passed to `:presence` callback from listeners.

## Method changes
### Removed methods
Following client methods was removed:
* `#set_auth_key`
* `#auth_key=`
* `#set_uuid`
* `#uuid=`

Both `auth_key` and `uuid` can't be changed after client is initlialized.

### Added methods
Following client methods was added:
* `#subscribed_to` - returns subscribed channels list
* `#current_region` - returns current region code
* `#region=` - allows to set region
* `#current_heartbeat` - returns current heartbeat interval value
* `#subscribe_filter=` - allows to specify [subscribe filter expression](https://www.pubnub.com/docs/ruby/stream-filtering-tutorial-sdk-v4#subscribing-with-filtering)

### Removed parametes
#### Client init
* `:connect_callback` - now it's handled by status envelope passed to listeners.

### Added parameters
#### Subscribe
* `:with_presence` - can be set as true or false, when sets to true client subscribes to presence channels of given channels as well.

#### Publish
* `:replicate` - if message should be replicated to other regions
* `:meta` - meta values used by message filtering
* `:ttl` - accepts integer value. Specifies how long published message should be stored in history

#### History
* `:include_token` - if set to true, messages will be returnet with their timetokens

## Changes worth mention
### REQUEST_MESSGE_COUNT_EXCEEDED
When there's **really** high traffic on channel there's chance that subscribe will hit retreival limit (100 messages at once). The REQUEST_MESSGE_COUNT_EXCEEDED status envelope will be passed to all listeners so your system will be informed that there is possiblity there are messages that wasn't retreived. You can then run `history` call to retreive that messages.

### Super Admin Mode
When secret_key is provided Pubnub Client is in super admin mode. PAM restrictions don't affect this client.

# Envelopes
Envelopes has changed a lot compared to 3.8 version. Below you can find all envelopes with examples

## Subscribe/Presence
Most important part: `result[:data]`

```ruby
#<Pubnub::Envelope:0x007fb4c8151998
 @event=:subscribe,
 @event_options={:ssl=>false},
 @id="01471808-d2f1-4c5e-85f9-56226969e6de",
 @result=
  {:code=>200,
   :operation=>:subscribe,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/subscribe/demo/whatever/0?pnsdk=PubNub-Ruby%2F4.0.13&t=%7B%22r%22%3A12%2C%22t%22%3A%2214793085739462384%22%7D&uuid=37c5370b-6fca-4fcc-a7d1-f82f18596e88>,
   :server_response=>
    #<HTTP::Message:0x0056126377b368
     @http_body=
      #<HTTP::Message::Body:0x0056126377b048
       @body=
        "{\"t\":{\"t\":\"14793085968022384\",\"r\":12},\"m\":[{\"a\":\"1\",\"f\":514,\"i\":\"2b3abf1f-a479-4f41-bb22-c5719f9ad6f9\",\"p\":{\"t\":\"14793085968029284\",\"r\":12},\"k\":\"demo\",\"c\":\"whatever\",\"d\":{\"text\":\"hey\"}}]}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x0056126377b2f0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:03:16 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "187"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2b0931bbdf54 URI:http://pubsub.pubnub.com/v2/subscribe/demo/whatever/0?pnsdk=PubNub-Ruby%2F4.0.13&t=%7B%22r%22%3A12%2C%22t%22%3A%2214793085739462384%22%7D&uuid=37c5370b-6fca-4fcc-a7d1-f82f18596e88>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>
    {:message=>{"text"=>"hey"},
     :subscribed_channel=>"whatever",
     :actual_channel=>"whatever",
     :publish_time_object=>{:timetoken=>"14793085968029284", :region_code=>12},
     :message_meta_data=>nil,
     :presence_event=>nil,
     :presence=>nil}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/subscribe/demo/whatever/0?pnsdk=PubNub-Ruby%2F4.0.13&t=%7B%22r%22%3A12%2C%22t%22%3A%2214793085739462384%22%7D&uuid=37c5370b-6fca-4fcc-a7d1-f82f18596e88>,
   :server_response=>
    #<HTTP::Message:0x0056126377b368
     @http_body=
      #<HTTP::Message::Body:0x0056126377b048
       @body=
        "{\"t\":{\"t\":\"14793085968022384\",\"r\":12},\"m\":[{\"a\":\"1\",\"f\":514,\"i\":\"2b3abf1f-a479-4f41-bb22-c5719f9ad6f9\",\"p\":{\"t\":\"14793085968029284\",\"r\":12},\"k\":\"demo\",\"c\":\"whatever\",\"d\":{\"text\":\"hey\"}}]}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x0056126377b2f0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:03:16 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "187"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2b0931bbdf54 URI:http://pubsub.pubnub.com/v2/subscribe/demo/whatever/0?pnsdk=PubNub-Ruby%2F4.0.13&t=%7B%22r%22%3A12%2C%22t%22%3A%2214793085739462384%22%7D&uuid=37c5370b-6fca-4fcc-a7d1-f82f18596e88>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>
    {:shard=>"1",
     :channel=>"whatever",
     :subscription_match=>nil,
     :payload=>{"text"=>"hey"},
     :flags=>514,
     :issuing_client_id=>"2b3abf1f-a479-4f41-bb22-c5719f9ad6f9",
     :subscribe_key=>"demo",
     :sequence_number=>nil,
     :user_meta_data=>nil,
     :replication_map=>nil,
     :eat_after_reading=>nil,
     :waypoint_list=>nil,
     :origination_time_token=>nil,
     :publish_timetoken=>{:timetoken=>"14793085968029284", :region_code=>12}},
   :category=>:ack,
   :error=>false,
   :auto_retried=>true,
   :current_timetoken=>14793085968022384,
   :last_timetoken=>14793085739462384,
   :subscribed_channels=>["whatever"],
   :subscribed_channel_groups=>[],
   :config=>
    {:tls=>false,
     :uuid=>"37c5370b-6fca-4fcc-a7d1-f82f18596e88",
     :auth_key=>nil,
     :origin=>"pubsub.pubnub.com"}},
 @timetoken={:timetoken=>"14793085968022384", :region_code=>12}>
```

## Audit
Most important part: `result[:data]`

```ruby
#<Pubnub::Envelope:0x007fc3240706b8
 @event=:audit,
 @event_options={:channel=>:whatever, :http_sync=>true, :callback=>nil},
 @id="e344be13-95b6-48bc-bf2e-47db0b19368c",
 @result=
  {:code=>200,
   :operation=>:audit,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/auth/audit/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&pnsdk=PubNub-Ruby%2F4.0.13&signature=724F4F024fhSolYgMc5dQrAGOY7tFZeo_2_XKxAvg0g%3D&timestamp=1479309113&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269>,
   :server_response=>
    #<HTTP::Message:0x007fc3240575f0
     @http_body=
      #<HTTP::Message::Body:0x007fc324057550
       @body="{\"message\":\"Success\",\"payload\":{\"level\":\"channel\",\"subscribe_key\":\"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f\",\"channels\":{}},\"service\":\"Access Manager\",\"status\":200}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x007fc3240575c8
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:11:54 GMT"],
         ["Content-Type", "text/javascript; charset=UTF-8"],
         ["Content-Length", "166"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"],
         ["Cache-Control", "no-cache, no-store, must-revalidate"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe19202be2c URI:http://pubsub.pubnub.com/v1/auth/audit/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&pnsdk=PubNub-Ruby%2F4.0.13&signature=724F4F024fhSolYgMc5dQrAGOY7tFZeo_2_XKxAvg0g%3D&timestamp=1479309113&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{"level"=>"channel", "subscribe_key"=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", "channels"=>{}}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/auth/audit/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&pnsdk=PubNub-Ruby%2F4.0.13&signature=724F4F024fhSolYgMc5dQrAGOY7tFZeo_2_XKxAvg0g%3D&timestamp=1479309113&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269>,
   :server_response=>
    #<HTTP::Message:0x007fc3240575f0
     @http_body=
      #<HTTP::Message::Body:0x007fc324057550
       @body="{\"message\":\"Success\",\"payload\":{\"level\":\"channel\",\"subscribe_key\":\"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f\",\"channels\":{}},\"service\":\"Access Manager\",\"status\":200}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x007fc3240575c8
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:11:54 GMT"],
         ["Content-Type", "text/javascript; charset=UTF-8"],
         ["Content-Length", "166"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"],
         ["Cache-Control", "no-cache, no-store, must-revalidate"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe19202be2c URI:http://pubsub.pubnub.com/v1/auth/audit/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&pnsdk=PubNub-Ruby%2F4.0.13&signature=724F4F024fhSolYgMc5dQrAGOY7tFZeo_2_XKxAvg0g%3D&timestamp=1479309113&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :data=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## Channel Registration
For `:add` or `:remove` action:
Most important part: `status[:error]`
```ruby
> #<Pubnub::Envelope:0x007fc3241472d0
 @event=:channel_registration,
 @event_options={:channel=>:whatever, :http_sync=>true, :group=>:whatever, :action=>:add, :callback=>nil},
 @id="c1e64bb2-1965-4e69-817d-e46ef51c84b9",
 @result=
  {:data=>nil,
   :code=>200,
   :operation=>:channel_group_add,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?add=whatever&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309313&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=%2F32U%2F9t4ZKOfO3MbrsGFnosO8zLbQrYcMN86VL4sPgw%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1f29948
     @http_body=#<HTTP::Message::Body:0x005571e1f29830 @body="{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1f298f8
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:15:13 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "79"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe192080008 URI:http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?add=whatever&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309313&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=%2F32U%2F9t4ZKOfO3MbrsGFnosO8zLbQrYcMN86VL4sPgw%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>},
 @status=
  {:code=>200,
   :operation=>:channel_group_add,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?add=whatever&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309313&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=%2F32U%2F9t4ZKOfO3MbrsGFnosO8zLbQrYcMN86VL4sPgw%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1f29948
     @http_body=#<HTTP::Message::Body:0x005571e1f29830 @body="{\"status\": 200, \"message\": \"OK\", \"service\": \"channel-registry\", \"error\": false}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1f298f8
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:15:13 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "79"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe192080008 URI:http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?add=whatever&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309313&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=%2F32U%2F9t4ZKOfO3MbrsGFnosO8zLbQrYcMN86VL4sPgw%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

For listings:
Most important part: `result[:data]`
```ruby
#<Pubnub::Envelope:0x007fc3241de7e8
 @event=:channel_registration,
 @event_options={:channel=>:whatever, :http_sync=>true, :group=>:whatever, :action=>:get, :callback=>nil},
 @id="c2c087df-5f92-4f63-98d7-98cffca6ee99",
 @result=
  {:data=>{"channels"=>["whatever"], "group"=>"whatever"},
   :code=>200,
   :operation=>:list_all_channels_in_channel_group,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309608&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9tmmAHHVCDeS8qOV3qdkPZr11cnYWhXUrV475xBslWY%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1811f70
     @http_body=
      #<HTTP::Message::Body:0x005571e1810d78 @body="{\"status\": 200, \"payload\": {\"channels\": [\"whatever\"], \"group\": \"whatever\"}, \"service\": \"channel-registry\", \"error\": false}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1811bb0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:20:08 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "122"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f0c09d64 URI:http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309608&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9tmmAHHVCDeS8qOV3qdkPZr11cnYWhXUrV475xBslWY%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>},
 @status=
  {:code=>200,
   :operation=>:list_all_channels_in_channel_group,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309608&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9tmmAHHVCDeS8qOV3qdkPZr11cnYWhXUrV475xBslWY%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1811f70
     @http_body=
      #<HTTP::Message::Body:0x005571e1810d78 @body="{\"status\": 200, \"payload\": {\"channels\": [\"whatever\"], \"group\": \"whatever\"}, \"service\": \"channel-registry\", \"error\": false}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1811bb0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:20:08 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "122"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f0c09d64 URI:http://pubsub.pubnub.com/v1/channel-registration/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel-group/whatever?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479309608&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9tmmAHHVCDeS8qOV3qdkPZr11cnYWhXUrV475xBslWY%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```
 
## Grant / Revoke
Most important part: `status[:error]`

```ruby
#<Pubnub::Envelope:0x007fc3242582c8
 @event=:grant,
 @event_options={:channel=>:whatever, :ttl=>3600, :http_sync=>true, :callback=>nil},
 @id="a631994f-5c37-4a49-ba82-52b7aa2db685",
 @result=
  {:code=>200,
   :operation=>:grant,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/auth/grant/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&m=1&pnsdk=PubNub-Ruby%2F4.0.13&r=1&signature=o-r78nncnqenn_LlJDoVzwP3jOhJKP2riKgcEZpbbCA%3D&timestamp=1479310015&ttl=3600&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&w=1>,
   :server_response=>
    #<HTTP::Message:0x007fc32423a6b0
     @http_body=
      #<HTTP::Message::Body:0x007fc32423a610
       @body=
        "{\"message\":\"Success\",\"payload\":{\"level\":\"channel\",\"subscribe_key\":\"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f\",\"ttl\":3600,\"channels\":{\"whatever\":{\"r\":1,\"w\":1,\"m\":1}}},\"service\":\"Access Manager\",\"status\":200}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x007fc32423a688
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:26:55 GMT"],
         ["Content-Type", "text/javascript; charset=UTF-8"],
         ["Content-Length", "207"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"],
         ["Cache-Control", "no-cache, no-store, must-revalidate"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe19211d678 URI:http://pubsub.pubnub.com/v1/auth/grant/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&m=1&pnsdk=PubNub-Ruby%2F4.0.13&r=1&signature=o-r78nncnqenn_LlJDoVzwP3jOhJKP2riKgcEZpbbCA%3D&timestamp=1479310015&ttl=3600&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&w=1>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{"level"=>"channel", "subscribe_key"=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", "ttl"=>3600, "channels"=>{"whatever"=>{"r"=>1, "w"=>1, "m"=>1}}}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v1/auth/grant/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&m=1&pnsdk=PubNub-Ruby%2F4.0.13&r=1&signature=o-r78nncnqenn_LlJDoVzwP3jOhJKP2riKgcEZpbbCA%3D&timestamp=1479310015&ttl=3600&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&w=1>,
   :server_response=>
    #<HTTP::Message:0x007fc32423a6b0
     @http_body=
      #<HTTP::Message::Body:0x007fc32423a610
       @body=
        "{\"message\":\"Success\",\"payload\":{\"level\":\"channel\",\"subscribe_key\":\"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f\",\"ttl\":3600,\"channels\":{\"whatever\":{\"r\":1,\"w\":1,\"m\":1}}},\"service\":\"Access Manager\",\"status\":200}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x007fc32423a688
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:26:55 GMT"],
         ["Content-Type", "text/javascript; charset=UTF-8"],
         ["Content-Length", "207"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"],
         ["Cache-Control", "no-cache, no-store, must-revalidate"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x3fe19211d678 URI:http://pubsub.pubnub.com/v1/auth/grant/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f?channel=whatever&m=1&pnsdk=PubNub-Ruby%2F4.0.13&r=1&signature=o-r78nncnqenn_LlJDoVzwP3jOhJKP2riKgcEZpbbCA%3D&timestamp=1479310015&ttl=3600&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&w=1>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :data=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```
## HereNow
Most important part: `result[:data]`

```ruby
#<Pubnub::Envelope:0x005571e3119f40
 @event=:here_now,
 @event_options={:channel=>:demo, :http_sync=>true, :callback=>nil},
 @id="de7e1ff6-216d-4d3e-9b42-f1c83bd2fb39",
 @result=
  {:code=>200,
   :operation=>:here_now,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310131&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9%2F2CaKUvCvq5jhEEzz9LScQO0O8vo7SgYBkYeQv1jMs%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e315cb38
     @http_body=
      #<HTTP::Message::Body:0x005571e315ca98 @body="{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [\"96ba2f54-955c-4fd3-acb7-a8407dae2269\"], \"occupancy\": 1}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e315cb10
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:28:52 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "122"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f18ae8bc URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310131&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9%2F2CaKUvCvq5jhEEzz9LScQO0O8vo7SgYBkYeQv1jMs%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{:uuids=>["96ba2f54-955c-4fd3-acb7-a8407dae2269"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310131&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9%2F2CaKUvCvq5jhEEzz9LScQO0O8vo7SgYBkYeQv1jMs%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e315cb38
     @http_body=
      #<HTTP::Message::Body:0x005571e315ca98 @body="{\"status\": 200, \"message\": \"OK\", \"service\": \"Presence\", \"uuids\": [\"96ba2f54-955c-4fd3-acb7-a8407dae2269\"], \"occupancy\": 1}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e315cb10
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:28:52 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "122"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f18ae8bc URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310131&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=9%2F2CaKUvCvq5jhEEzz9LScQO0O8vo7SgYBkYeQv1jMs%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## History
Most important part: `result[:data]`.

```ruby
#<Pubnub::Envelope:0x005571e381db98
 @event=:history,
 @event_options={:channel=>:demo, :http_sync=>true, :count=>10, :callback=>nil},
 @id="372317ac-ca93-46c1-913f-8e6fb020b73b",
 @result=
  {:code=>200,
   :operation=>:history,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310589&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=74Dczzz%2F8WxEVUP4shYHkXWsoUeBNzmDfOUcgI57BQ8%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3844bf8
     @http_body=#<HTTP::Message::Body:0x005571e3844b58 @body="[[90,91,92,93,94,95,96,97,98,99],14793103373028625,14793103423331645]", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3844bd0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:36:30 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "69"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1c2291c URI:http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310589&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=74Dczzz%2F8WxEVUP4shYHkXWsoUeBNzmDfOUcgI57BQ8%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{:messages=>[90, 91, 92, 93, 94, 95, 96, 97, 98, 99], :end=>14793103423331645, :start=>14793103373028625}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310589&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=74Dczzz%2F8WxEVUP4shYHkXWsoUeBNzmDfOUcgI57BQ8%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3844bf8
     @http_body=#<HTTP::Message::Body:0x005571e3844b58 @body="[[90,91,92,93,94,95,96,97,98,99],14793103373028625,14793103423331645]", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3844bd0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:36:30 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "69"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1c2291c URI:http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310589&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=74Dczzz%2F8WxEVUP4shYHkXWsoUeBNzmDfOUcgI57BQ8%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :category=>:ack,
   :error=>false,
[18] pry(main)> p.history(channel: :demo, http_sync: true, count: 10)
=> #<Pubnub::Envelope:0x005571e1c44070
 @event=:history,
 @event_options={:channel=>:demo, :http_sync=>true, :count=>10, :callback=>nil},
 @id="50608c36-cecc-4e34-8213-b8183bb96da8",
 @result=
  {:code=>200,
   :operation=>:history,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310594&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uPfZzcP%2F5OozLCtdFVXnzwhn84E1opPZNHhWtdDHoFg%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1c52760
     @http_body=#<HTTP::Message::Body:0x005571e1c52620 @body="[[90,91,92,93,94,95,96,97,98,99],14793103373028625,14793103423331645]", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1c52698
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:36:34 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "69"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f0e29824 URI:http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310594&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uPfZzcP%2F5OozLCtdFVXnzwhn84E1opPZNHhWtdDHoFg%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{:messages=>[90, 91, 92, 93, 94, 95, 96, 97, 98, 99], :end=>14793103423331645, :start=>14793103373028625}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310594&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uPfZzcP%2F5OozLCtdFVXnzwhn84E1opPZNHhWtdDHoFg%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e1c52760
     @http_body=#<HTTP::Message::Body:0x005571e1c52620 @body="[[90,91,92,93,94,95,96,97,98,99],14793103373028625,14793103423331645]", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e1c52698
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:36:34 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "69"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f0e29824 URI:http://pubsub.pubnub.com/v2/history/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo?count=10&pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310594&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uPfZzcP%2F5OozLCtdFVXnzwhn84E1opPZNHhWtdDHoFg%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :data=>nil,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## Leave
Most important part: `status[:error]`

```ruby
#<Pubnub::Envelope:0x005571e2d9b7b0
 @event=:leave,
 @event_options={:channel=>:demo, :http_sync=>true, :callback=>nil},
 @id="898e2c77-be07-4810-bd41-3ac3632331d8",
 @result=nil,
 @status=
  {:code=>200,
   :operation=>:leave,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/leave?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310804&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=MwJI5czAwWn4MZJdaj%2BAcJL61zX1j2l59OpT%2F4z02mI%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e36d66b8
     @http_body=#<HTTP::Message::Body:0x005571e36d6618 @body="{\"status\": 200, \"action\": \"leave\", \"message\": \"OK\", \"service\": \"Presence\"}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e36d6690
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:40:04 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "74"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1b6b6e0 URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/leave?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310804&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=MwJI5czAwWn4MZJdaj%2BAcJL61zX1j2l59OpT%2F4z02mI%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## Publish
Most important part: `status[:error]`

```ruby
#<Pubnub::Envelope:0x005571e33805b8
 @event=:publish,
 @event_options={:channel=>:demo, :message=>"hello!", :http_sync=>true, :callback=>nil},
 @id="c1443a70-5ee5-4e5d-9498-d3d1442c4c20",
 @result=nil,
 @status=
  {:code=>200,
   :operation=>:publish,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/publish/pub-c-b42cec2f-f468-4784-8833-dd2b074538c4/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/0/demo/0/%22hello%21%22?ortt=%7B%22t%22%3A14793109008755456%7D&pnsdk=PubNub-Ruby%2F4.0.13&seqn=101&timestamp=1479310900&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=Juqy8g4Bi%2FXgwhrUXN5NxqjMoROUyINRYPCzV%2B1s9o8%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e341b4c8
     @http_body=#<HTTP::Message::Body:0x005571e341b428 @body="[1,\"Sent\",\"14793109009827627\"]", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e341b4a0
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:41:40 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "30"],
         ["Connection", "keep-alive"],
         ["Cache-Control", "no-cache"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "GET"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1a0dd84 URI:http://pubsub.pubnub.com/publish/pub-c-b42cec2f-f468-4784-8833-dd2b074538c4/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/0/demo/0/%22hello%21%22?ortt=%7B%22t%22%3A14793109008755456%7D&pnsdk=PubNub-Ruby%2F4.0.13&seqn=101&timestamp=1479310900&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=Juqy8g4Bi%2FXgwhrUXN5NxqjMoROUyINRYPCzV%2B1s9o8%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## SetState
Most important part: `status[:error]`

```ruby
 #<Pubnub::Envelope:0x005571e215cc88
 @event=:set_state,
 @event_options={:channel=>:demo, :state=>{:one=>1}, :http_sync=>true, :callback=>nil},
 @id="600bd479-8749-4278-8276-43cc7deca12a",
 @result=nil,
 @status=
  {:code=>200,
   :operation=>:set_state,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269/data?pnsdk=PubNub-Ruby%2F4.0.13&state=%7B%22one%22%3A1%7D&timestamp=1479310989&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=6LSIKJMxhTrSFbPWPfVEbQHuv%2BlK1Dt4zQwXb%2B5Lav8%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e218a520
     @http_body=#<HTTP::Message::Body:0x005571e218a368 @body="{\"status\": 200, \"message\": \"OK\", \"payload\": {\"one\": 1}, \"service\": \"Presence\"}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e218a4f8
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:43:10 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "78"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f10c5a10 URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269/data?pnsdk=PubNub-Ruby%2F4.0.13&state=%7B%22one%22%3A1%7D&timestamp=1479310989&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=6LSIKJMxhTrSFbPWPfVEbQHuv%2BlK1Dt4zQwXb%2B5Lav8%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## State
Most important part: `result[:data]`
```ruby
#<Pubnub::Envelope:0x005571e36a9b40
 @event=:state,
 @event_options={:channel=>:demo, :http_sync=>true, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :callback=>nil},
 @id="156996a8-1a9c-40d2-a6e5-239ddc583bef",
 @result=
  {:code=>200,
   :operation=>:get_state,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub_key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479311064&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uC3RWRo4nbOB%2BOH32uiBh%2BYYVnkCu1KfHi9e1nuke5I%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3684480
     @http_body=
      #<HTTP::Message::Body:0x005571e36843e0
       @body="{\"status\": 200, \"uuid\": \"96ba2f54-955c-4fd3-acb7-a8407dae2269\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"one\": 1}, \"channel\": \"demo\"}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3684458
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:44:24 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "145"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1b42560 URI:http://pubsub.pubnub.com/v2/presence/sub_key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479311064&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uC3RWRo4nbOB%2BOH32uiBh%2BYYVnkCu1KfHi9e1nuke5I%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{:state=>{"one"=>1}, :channel=>"demo"}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub_key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479311064&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uC3RWRo4nbOB%2BOH32uiBh%2BYYVnkCu1KfHi9e1nuke5I%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3684480
     @http_body=
      #<HTTP::Message::Body:0x005571e36843e0
       @body="{\"status\": 200, \"uuid\": \"96ba2f54-955c-4fd3-acb7-a8407dae2269\", \"service\": \"Presence\", \"message\": \"OK\", \"payload\": {\"one\": 1}, \"channel\": \"demo\"}",
       @chunk_size=nil,
       @positions=nil,
       @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3684458
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:44:24 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "145"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1b42560 URI:http://pubsub.pubnub.com/v2/presence/sub_key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/channel/demo/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479311064&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=uC3RWRo4nbOB%2BOH32uiBh%2BYYVnkCu1KfHi9e1nuke5I%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```

## WhereNow
Most important part: `result[:data]`

```ruby
#<Pubnub::Envelope:0x005571e32daf28
 @event=:where_now,
 @event_options={:uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :http_sync=>true, :callback=>nil},
 @id="47066b73-40b2-4ed6-a314-8dd4e0ed9e80",
 @result=
  {:code=>200,
   :operation=>:where_now,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310689&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=oI5hm2fo8oc7dBKyUkKKdklrjy87JI8rioFFMI2KLkM%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3205940
     @http_body=#<HTTP::Message::Body:0x005571e32058a0 @body="{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": [\"demo\"]}, \"service\": \"Presence\"}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3205918
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:38:09 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "90"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1902fd4 URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310689&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=oI5hm2fo8oc7dBKyUkKKdklrjy87JI8rioFFMI2KLkM%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>{"channels"=>["demo"]}},
 @status=
  {:code=>200,
   :client_request=>
    #<URI::HTTP http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310689&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=oI5hm2fo8oc7dBKyUkKKdklrjy87JI8rioFFMI2KLkM%3D>,
   :server_response=>
    #<HTTP::Message:0x005571e3205940
     @http_body=#<HTTP::Message::Body:0x005571e32058a0 @body="{\"status\": 200, \"message\": \"OK\", \"payload\": {\"channels\": [\"demo\"]}, \"service\": \"Presence\"}", @chunk_size=nil, @positions=nil, @size=0>,
     @http_header=
      #<HTTP::Message::Headers:0x005571e3205918
       @body_charset=nil,
       @body_date=nil,
       @body_encoding=#<Encoding:UTF-8>,
       @body_size=0,
       @body_type=nil,
       @chunked=false,
       @dumped=false,
       @header_item=
        [["Date", "Wed, 16 Nov 2016 15:38:09 GMT"],
         ["Content-Type", "text/javascript; charset=\"UTF-8\""],
         ["Content-Length", "90"],
         ["Connection", "keep-alive"],
         ["Access-Control-Allow-Origin", "*"],
         ["Access-Control-Allow-Methods", "OPTIONS, GET, POST"],
         ["cache-control", "no-cache"],
         ["Accept-Ranges", "bytes"],
         ["Age", "0"],
         ["Server", "Pubnub Presence"]],
       @http_version="1.1",
       @is_request=false,
       @reason_phrase="OK",
       @request_absolute_uri=nil,
       @request_method="GET",
       @request_query=nil,
       @request_uri=
        #<Addressable::URI:0x2ab8f1902fd4 URI:http://pubsub.pubnub.com/v2/presence/sub-key/sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f/uuid/96ba2f54-955c-4fd3-acb7-a8407dae2269?pnsdk=PubNub-Ruby%2F4.0.13&timestamp=1479310689&uuid=96ba2f54-955c-4fd3-acb7-a8407dae2269&signature=oI5hm2fo8oc7dBKyUkKKdklrjy87JI8rioFFMI2KLkM%3D>,
       @status_code=200>,
     @peer_cert=nil,
     @previous=nil>,
   :data=>nil,
   :category=>:ack,
   :error=>false,
   :auto_retried=>false,
   :current_timetoken=>nil,
   :last_timetoken=>nil,
   :subscribed_channels=>nil,
   :subscribed_channel_groups=>nil,
   :config=>{:tls=>false, :uuid=>"96ba2f54-955c-4fd3-acb7-a8407dae2269", :auth_key=>nil, :origin=>"pubsub.pubnub.com"}},
 @timetoken=nil>
```
