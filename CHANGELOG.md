##### 4.0.7
* Added message decrypting in history

##### 4.0.6
* channel and channels are the same argument
* channel_group and channel_groups are the same argument
* added `with_presence` flag for subscibe, default false.

##### 4.0.5
* Required CGI

##### 4.0.2
* Added #subscribe_filter for client

##### 4.0.1
* Updated dry-validation and EnvelopeSchema

##### 4.0.0
* Removed auth_key and uuid setters (#set_auth_key, #auth_key=, #set_uuid, #uuid=)
* Added #subscribed_to, #current_region, #region=, #current_heartbeat

##### 3.8.3
* Restored auth_key and uuid setters. Important notice: they will be removed in v4 of this library.

##### 3.8.2
* Added :include_token parameter to history call.

##### 3.8.1
* Updated celluloid dependency.

##### 3.8.0
* Release of celluloid version of pubnub gem. It's complete rewrite but public API doesn't change.