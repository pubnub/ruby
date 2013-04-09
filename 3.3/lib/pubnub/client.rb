module Pubnub
  class Client
    def initialize(options = {})
      options.each do |k,v|
        instance_variable_set(:"@#{k}", v)
      end
      @ssl = @ssl ? true : false
      @session_uuid = uuid

      verify_init
    end

    def publish(options = {})
      options.merge!(
        {
          :publish_key => @publish_key,
          :subscribe_key => @subscribe_key
        }
      )
      request = Pubnub::Request.new(options)
      request.ssl = @ssl
    end

    private

    def verify_init
      raise(InitError, 'subscribe_key is a mandatory parameter.') if @subscribe_key.to_s.size == 0
    end

    def uuid
      UUID.new.generate
    end
  end
end
