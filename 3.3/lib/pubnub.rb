## www.pubnub.com - PubNub realtime push service in the cloud.
## http://www.pubnub.com/blog/ruby-push-api - Ruby Push API Blog

## PubNub Real Time Push APIs and Notifications Framework
## Copyright (c) 2013 PubNub
## http://www.pubnub.com/

## -----------------------------------
## PubNub 3.3 Real-time Push Cloud API
## -----------------------------------

require 'uuid'
require 'yajl'
require 'json'
require 'base64'
require 'open-uri'
require 'uri'
require 'openssl'
require 'eventmachine'

require 'pubnub/client.rb'
require 'pubnub/request.rb'
require 'pubnub/configuration.rb'
require 'pubnub/daemon.rb'
require 'pubnub/error.rb'
require 'pubnub/crypto.rb'

DEFAULT_CONNECTION_OPTIONS = {
  :host           => 'demo.pubnub.com',
  :port           => 80,
  :method         => 'GET',
  :content_type   => "application/json",
  :path           => '/',
  :params         => {},
  :headers        => {},
  :user_agent     => "Pubnub",
  :ssl            => false,
  :timeout        => 0,
  :encoding       => nil,
  :auto_reconnect => true
}

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
  extend Error

  class << self
    def new(*args)
      raise(InitError, 'Initialize with either a hash of options, or exactly 5 named parameters.') unless args.size == 5 or (args.size == 1 and args[0].class == Hash)

      if args[0].class == Hash
        options = args[0]
      else
        options                 = Hash.new
        options[:publish_key]   = args[0].to_s
        options[:subscribe_key] = args[1].to_s
        options[:secret_key]    = args[2].to_s
        options[:cipher_key]    = args[3].to_s
        options[:ssl]           = args[4]
      end

      Pubnub::Client.new(options)
    end
  end
end

# Aliases
PubnubRequest = Pubnub::Request
PubnubCrypto  = Pubnub::Crypto

