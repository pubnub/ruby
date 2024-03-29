require 'json'
require 'base64'
require 'zlib'
require 'open-uri'
require 'openssl'

require 'timers'
require 'httpclient'
require 'logger'
require 'dry-validation'
require 'cgi'

require 'concurrent'
require 'concurrent-edge'

require 'pubnub/version'
require 'pubnub/client'
require 'pubnub/uuid'

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

    def new(options = {})
      Pubnub::Client.new(options)
    end
  end
end
