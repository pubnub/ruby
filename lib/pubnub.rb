require 'json'
require 'base64'
require 'zlib'
require 'open-uri'
require 'openssl'
require 'celluloid/current'
require 'timers'
require 'httpclient'
require 'logger'

require 'pubnub/version'
require 'pubnub/client'

# Adding blank? and present? methods to Object.
class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end

  def present?
    !blank?
  end
end

# Toplevel Pubnub module.
module Pubnub
  class << self
    attr_accessor :logger, :client

    # TODO: docs
    def new(options = {})
      Pubnub::Client.new(options)
    end
  end
end
