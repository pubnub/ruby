## v4.7.0
November 09 2021

#### Added
- Grant_token allows generation of signed token with permissions for channels, channel groups and uuids.

##### v4.6.2

- Add new `sdks` section to `.pubnub.yml` with information about available artifacts and distribution variants. 

##### v4.6.1

- Exclude `spec` and `fixtures` from built gem file. 
- Fix Ruby SDK repository location under `sdks` section in `.pubnub.yml`. 
- Add new section to `.pubnub.yml` file with information about SDK and destribution types. 

##### v4.6.0

- BREAKING CHANGE: Add randomized initialization vector usage by default for data encryption / decryption in publish / subscribe / history API calls. 
- Fix issue which caused Object request body encryption when `cipher_key` is set. 

##### v4.5.0

- Add support for APNS2 device/channel management. 

##### v4.4.0

- Add simplified Objects API support with UUID and Channel metadata / membership management. 
- Add uuid and parameter to Grant API along with new Objects permissions: `get`, `update` and `join`. 

##### v4.3.0

- Add `delete` permission for `channel` to Grant. 

##### v4.2.7

- Don't suppress runtime errors. 

##### v4.2.6

- History can now respond with message meta information. 
- Added official support for Ruby 2.7.X
- History properly decrypts messages when using the "include_token" parameter. 

##### v4.2.5

- Updated Subscribe endpoint tests to use an unsorted channels list.
- Fixed Message Counts channel timetokens by disabling alphabetic sorting of the channels list.

##### v4.2.4

- Update Grant, Revoke and Audit PAM tests to use v2 paths instead of v1.
- Replace event name with full endpoint path in PAM signatures, for compatibility with PAM v2 signatures. Addresses the following PRs from [@stefan-qsd](https://github.com/stefan-qsd): [#112](https://github.com/pubnub/ruby/pull/112).
- Change paths for PAM endpoints from v1 to v2.
- Update PAM signature generator to correctly sort the query string parameters based on key instead of combined key and value.

##### 4.2.3
* Resolved issue with subscribe loop where the connection was reinitiated after receiving a 4xx error code from the server

##### 4.2.2
* Resolved issue with multiple timetokens in message counts endpoint

##### 4.2.1
* Updated listener methods

##### 4.2.0
* Added objects feature

##### 4.1.6
* Added signal feature

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
