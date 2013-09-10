## www.pubnub.com - PubNub realtime push service in the cloud.
## http://www.pubnub.com/blog/ruby-push-api - Ruby Push API Blog

## PubNub Real Time Push APIs and Notifications Framework
## Copyright (c) 2013 PubNub
## http://www.pubnub.com/

## -----------------------------------
## PubNub 3.4 Real-time Push Cloud API
## -----------------------------------

require 'uuid'
require 'json'
require 'base64'
require 'open-uri'
require 'uri'
require 'openssl'
require 'eventmachine'
require 'em-http-request'

require 'version.rb'

require 'pubnub/client.rb'
require 'pubnub/request.rb'
require 'pubnub/configuration.rb'
require 'pubnub/daemon.rb'
require 'pubnub/error.rb'
require 'pubnub/crypto.rb'

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end

  def present?
    !blank?
  end
end

class Proc
  def try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      __send__(*a, &b)
    end
  end
end

module Pubnub
  extend Configuration
  include Error

  class << self
    def new(options = {})
      #raise(Pubnub::Error::InitError, 'Initialize with either a hash of options, or exactly 5 named parameters.') unless args.size == 5 or (args.size == 1 and args[0].class == Hash)

      Pubnub::Client.new(options)
    end
  end
end

