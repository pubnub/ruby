## www.pubnub.com - PubNub realtime push service in the cloud.
## http://www.pubnub.com/blog/ruby-push-api - Ruby Push API Blog

## PubNub Real Time Push APIs and Notifications Framework
## Copyright (c) 2014 PubNub
## http://www.pubnub.com/

## -----------------------------------
## PubNub 3.5.1 Real-time Push Cloud API
## -----------------------------------

require 'json'
require 'base64'
require 'open-uri'
require 'openssl'
require 'eventmachine'
require 'net/http/persistent'
require 'logger'

require 'version'

require 'pubnub/client'


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
  class << self
    def new(options = {})
      Pubnub::Client.new(options)
    end
  end
end

