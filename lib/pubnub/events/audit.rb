module Pubnub
  class Audit
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator
    include Pubnub::PAM

    def initialize(options, app)
      super
      @event = 'audit'
      @allow_multiple_channels = false
      @timestamp = current_time
    end

    def validate!
      raise ArgumentError.new(:object => self), 'publish_key is required by Audit' unless @publish_key
      raise ArgumentError.new(:object => self), 'Parameter secret_key is required by Audit' unless @secret_key

    end

    private

    def parameters(app, signature = false)
      { :timestamp => @timestamp }.merge(super(app, signature))
    end

    def path(app)
      '/' + [
          'v1',
          'auth',
          'audit',
          'sub-key',
          @subscribe_key
      ].join('/')
    end
  end
end