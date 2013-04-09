module Pubnub
  class Request
    attr_accessor :ssl, :channel, :callback, :cipher_key, :subscribe_key, :secret_key, :operation, :message, :publish_key

    def initialize(options = {})
      options.each do |k,v|
        instance_variable_set(:"@#{k}", v)
      end
      @secret_key = options[:secret_key] || '0'
      @timetoken = options[:timetoken] || '0'

      set_origin(options)
      set_channel(options)
      set_callback(options)
      set_cipher_key(options, self.cipher_key)
      set_message(options, self.cipher_key)
      set_publish_key(options, self.publish_key)
      set_subscribe_key(options, self.subscribe_key)
      set_secret_key(options, self.secret_key)

    end

    #private

    def set_origin(options)
      if options[:origin].present?
        self.origin = options[:origin].to_s
        self
      end
    end

    def set_channel(options)
      if options[:channel].blank?
        raise(Pubnub::Error::OperationError, "channel is a required parameter.")
      else
        self.channel = options[:channel].to_s
        self
      end
    end

    def set_callback(options)
      if options[:callback].blank?
        raise(Pubnub::Error::OperationError, "callback is a required parameter.")
      elsif !options[:callback].try(:respond_to?, "call")
        raise(Pubnub::Error::OperationError, "callback is invalid.")
      else
        self.callback = options[:callback]
        self
      end
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

        signature = "{ @publish_key, @subscribe_key, @secret_key, channel, message}"
        digest = OpenSSL::Digest.new("sha256")
        key = [my_secret_key]
        hmac = OpenSSL::HMAC.hexdigest(digest, key.pack("H*"), signature)
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