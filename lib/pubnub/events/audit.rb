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
      raise ArgumentError.new(:object => self, :message => 'publish_key is required by Audit') unless @publish_key
      raise ArgumentError.new(:object => self, :message => 'Parameter secret_key is required by Audit') if !@secret_key || @secret_key == 0

      # check channel/channels
      raise ArgumentError.new(:object => self, :message => 'SetState requires :channel, :channels or :group argument') if @channel.blank? && @channel_group.blank?
      unless @channel.blank?
        raise ArgumentError.new(:object => self, :message => 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both') unless valid_channel?
      end

      unless @channel_group.blank?
        # check channel_group
        raise ArgumentError.new(:object => self, :message => 'Invalid channel group format! Should be type of: String, Symbol') unless [String, Symbol, NilClass].include?(@channel_group.class)

        # check channel_group
        raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.count(':') != 1
      end
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
