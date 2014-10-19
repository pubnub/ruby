module Pubnub
  class Revoke
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator
    include Pubnub::PAM

    def initialize(options, app)
      super
      @event = 'grant'
      @allow_multiple_channels = true

      @timestamp = current_time

      @write = options[:write]
      @read  = options[:read]
      @ttl   = options[:ttl]   || Pubnub::Configuration::DEFAULT_TTL
    end

    def validate!
      super

      raise ArgumentError.new(:object => self, :message => 'publish_key is required by Revoke') unless @publish_key
      raise ArgumentError.new(:object => self, :message => 'Parameter secret_key is required by Revoke') if !@secret_key || @secret_key == 0

      raise ArgumentError.new(:object => self, :message => 'ttl parameter is too big, max value is: 525600') unless @ttl.to_i <= 525600 || @ttl.nil?
      raise ArgumentError.new(:object => self, :message => 'ttl parameter is too small, min value is: 1')  unless @ttl.to_i >= 1 || @ttl.nil?
    end

    private

    def parameters(app, signature = false)
      write = 0
      read  = 0

      {
          :timestamp => @timestamp,
          :w         => write,
          :r         => read,
          :ttl       => @ttl
      }.merge(super(app, signature))
    end

    def path(app)
      '/' + [
          'v1',
          'auth',
          'grant',
          'sub-key',
          @subscribe_key
      ].join('/')
    end

  end
end
