[![Codacy Badge](https://api.codacy.com/project/badge/Grade/b744287bb0324e2883f95525b12cf19f)](https://www.codacy.com/app/blazeroot/ruby?utm_source=github.com&utm_medium=referral&utm_content=pubnub/ruby&utm_campaign=badger)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/b744287bb0324e2883f95525b12cf19f)](https://www.codacy.com/app/blazeroot/ruby?utm_source=github.com&utm_medium=referral&utm_content=pubnub/ruby&utm_campaign=Badge_Coverage)
[![Build Status](https://travis-ci.org/pubnub/ruby.svg?branch=master)](https://travis-ci.org/pubnub/ruby)

# Please direct all Support Questions and Concerns to Support@PubNub.com

# Complete Documentation
Available at https://www.pubnub.com/docs/ruby/pubnub-ruby-sdk-v4 **v4.x**

## PubNub Gem version 4.2.2

##### YOU MUST HAVE A PUBNUB ACCOUNT TO USE THE API.
##### http://www.pubnub.com/account

www.pubnub.com - PubNub Real-time Push Service in the Cloud.


The PubNub Network is a blazingly fast Global Messaging Service for building real-time web and mobile apps. Thousands of apps and developers rely on PubNub for delivering human-perceptive real-time experiences that scale to millions of users worldwide. PubNub delivers the infrastructure needed to build amazing Mobile, MMO games, social apps, business collaborative solutions, and more.

### Upgrading from PubNub 3.6.x / 3.7.x

Main change is that we're no longer using EventMachine. Right now Celluloid is used. Public API remain unchanged.
If you encounter any issues while upgrading from EventMachine version, please contact us at support@pubnub.com you can also find eventmachine version in "eventmachine" branch of this repo.

### Upgrading from PubNub 3.5.x

We've made the response format compatible across all operations. This may break existing parsing of where_now, leave, state, and PAM responses. So if you are monitoring these operation responses, please be sure to modify your code accordingly.

Examples of affected operations can be found [here](3.5_to_3.6_upgrade_notes.md).

### Upgrading from PubNub 3.3.x and Earlier
PubNub 3.7.3 is NOT compatible with earlier than 3.4 versions of Pubnub Ruby Client.

# Please direct all Support Questions and Concerns to Support@PubNub.com
