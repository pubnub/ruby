require 'pubnub/configuration.rb'
require 'pubnub/error.rb'

module Pubnub
  class Request
    include Pubnub::Configuration
    include Pubnub::Error

    attr_accessor :ssl, :channel, :callback, :cipher_key, :subscribe_key, :secret_key, :operation, :message, :publish_key

    def initialize(options = {})
      options.each do |k,v|
         instance_variable_set(:"@#{k}", v)
      end

      puts options

      @options = options
      @secret_key = options[:secret_key] || Configuration::DEFAULT_SECRET_KEY
      @timetoken  = options[:timetoken] || Configuration::DEFAULT_TIMETOKEN
      set_cipher_key(options, self.cipher_key)
      set_message(options, self.cipher_key)
      set_publish_key(options, self.publish_key)
      set_subscribe_key(options, self.subscribe_key)
      set_secret_key(options, self.secret_key)
      validate_request

      puts "request done"

    end

    def path
      encode_path(case @options[:operation]
                   when 'publish'
                     [
                         @options[:operation],
                         @options[:publish_key],
                         @options[:subscribe_key],
                         @options[:secret_key],
                         @options[:channel],
                         '0',
                         @options[:message].to_json
                     ]
                   when 'subscribe'
                     [
                         @options[:operation],
                         @options[:subscribe_key],
                         @options[:channel],
                         '0',
                         @options[:timetoken]
                     ]
                   when 'presence'
                     [
                         'subscribe',
                         @options[:subscribe_key],
                         @options[:channel].to_s + '-pnpres',
                         '0',
                         @options[:timetoken]
                     ]
                   when 'time'
                     [
                         @options[:operation],
                         '0'
                     ]
                   when 'history'
                     [
                         @options[:operation],
                         @options[:subscribe_key],
                         @options[:channel],
                         '0',
                         @options[:history_limit]
                     ]
                   when 'detailed_history'
                     [
                         'v2',
                         'history',
                         'sub-key',
                         @options[:subscribe_key],
                         'channel',
                         @options[:channel]
                     ]
                   when 'here_now'
                     [
                         'v2',
                         'presence',
                         'sub-key',
                         @options[:subscribe_key],
                         'channel',
                         @options[:channel]
                     ]
                   else
                     raise("I can't create that URL for you due to unknown operation type.")
                 end
      )
    end

    def encode_path(request)
      '/' + request.map { |bit| bit.to_s.split('').map { |ch|
        ' ~`!@#$%^&*()+=[]\\{}|;\':",./<>?'.index(ch) ?
            '%' + ch.unpack('H2')[0].to_s.upcase : URI.encode(ch)
      }.join('')
      }.reject(&:empty?).join('/')
    end

    def origin
      "http://#{@options[:host]}"
    end

    def params
      flat = {}
      @options[:params].each do |param,val|
        next if val.to_s.empty?
        flat[param.to_s] = val.to_s
      end
      flat
    end

    def query
      params.map do |param, value|
        [param, value].join('=')
      end.sort.join('&')
    end


    private

    def validate_request
      raise(Pubnub::Error::OperationError, 'channel is required parameter.') if @channel.blank?
      raise(Pubnub::Error::OperationError, 'callback is a required parameter.') if @callback.blank?
      raise(Pubnub::Error::OperationError, 'callback is invalid.') if !@callback.respond_to? 'call'

    end

    def set_cipher_key(options, self_cipher_key)
      if self_cipher_key.present? && options['cipher_key'].present?
        raise(Pubnub::Error::OperationError, "existing cipher_key #{self_cipher_key} cannot be overridden at publish-time.")

      elsif (self_cipher_key.present? && options[:cipher_key].blank?) || (self_cipher_key.blank? && options[:cipher_key].present?)

        this_cipher_key = self_cipher_key || options[:cipher_key]
        raise(Pubnub::Error::OperationError, "secret key must be a string.") if this_cipher_key.class != String
        self.cipher_key = this_cipher_key
      end
    end

    def set_secret_key(options, self_secret_key)
      if self_secret_key.present? && options['secret_key'].present?
        raise(Pubnub::Error::OperationError, "existing secret_key #{self_secret_key} cannot be overridden at publish-time.")

      elsif (self_secret_key.present? && options[:secret_key].blank?) || (self_secret_key.blank? && options[:secret_key].present?)

        my_secret_key = self_secret_key || options[:secret_key]
        raise(Pubnub::Error::OperationError, "secret key must be a string.") if my_secret_key.class != String

        signature       = "{ @publish_key, @subscribe_key, @secret_key, channel, message}"
        digest          = OpenSSL::Digest.new("sha256")
        key             = [my_secret_key]
        hmac            = OpenSSL::HMAC.hexdigest(digest, key.pack("H*"), signature)
        self.secret_key = hmac
      else
        self.secret_key = "0"
      end
    end

    def set_message(options, self_cipher_key)
      if options[:message].blank? && options[:message] != ""
        raise(Pubnub::Error::OperationError, "message is a required parameter.")
      else
        my_cipher_key = options[:cipher_key] || self_cipher_key

        if my_cipher_key.present?
          self.message = Yajl.dump(aes_encrypt(my_cipher_key, options, self))
        else
          self.message = Yajl.dump(options[:message])
        end
      end
    end

    def set_publish_key(options, self_publish_key)
      if options[:publish_key].blank? && self_publish_key.blank?
        raise(Pubnub::Error::OperationError, "publish_key is a required parameter.")
      elsif self_publish_key.present? && options['publish_key'].present?
        raise(Pubnub::Error::OperationError, "existing publish_key #{self_publish_key} cannot be overridden at publish-time.")
      else
        self.publish_key = (self_publish_key || options[:publish_key]).to_s
      end
    end

    def set_subscribe_key(options, self_subscribe_key)
      if options[:subscribe_key].blank? && self_subscribe_key.blank?
        raise(Pubnub::Error::OperationError, "subscribe_key is a required parameter.")
      elsif self_subscribe_key.present? && options['subscribe_key'].present?
        raise(Pubnub::Error::OperationError, "existing subscribe_key #{self_subscribe_key} cannot be overridden at subscribe-time.")
      else
        self.subscribe_key = (self_subscribe_key || options[:subscribe_key]).to_s
      end
    end

  end
end