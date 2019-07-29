##### 4.1.5
* Update dependency dry-validation
* Includes minimum Ruby version requirement of 2.4+

##### 4.0.28
* Added Concurrent-ruby Gem
* Removed Celluloid

##### 4.0.25
* Added Telemetry

##### 4.0.24
* Added #delete_messages method
* Improved timeout error handling (thanks @f1sherman)

##### 4.0.23
* Fixed HereNow envelope generation

##### 4.0.22
* Fixed signature generation and channel name escaping

##### 4.0.21
* Fixed signature generation

##### 4.0.20
* Allowing using multiple cipher keys

##### 4.0.19
* Fixed sync subscribe.

##### 4.0.16
* Fixed missing channel group parameter in Leave event

##### 4.0.15
* Fixed PAM signature when some special characters are present

##### 4.0.13
* Changed init message log level to debug
* Added ttl parameter for publish

##### 4.0.12
* Added alert on catchup failure (REQUEST_MESSAGE_COUNT_EXCEEDED)

##### 4.0.11
* Added super admin mode (Enabled when secret key is set on Pubnub::Client init)

##### 4.0.10
* Better single events timeout handling
* DRYed envelope formatting a bit

##### 4.0.9
* Removed json dependency
* Updated dependecies

##### 4.0.8
* Updated dry-validation
* Dropped support for ruby 2.0

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
