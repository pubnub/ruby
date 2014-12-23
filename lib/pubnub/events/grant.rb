# Toplevel Pubnub module
module Pubnub
  # Holds grant functionality
  class Grant
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::PAM

    def initialize(options, app)
      super
      @timestamp = current_time

      @ttl = options[:ttl] || Pubnub::Configuration::DEFAULT_TTL
    end

    private

    def parameters(signature = false)
      write  = [0, '0', false].include?(@write)  ? 0 : 1
      read   = [0, '0', false].include?(@read)   ? 0 : 1
      unless @channel_group.blank?
        manage = [0, '0', false].include?(@manage) ? 0 : 1
      end

      {
        timestamp: @timestamp,
        w: write,
        r: read,
        m: manage,
        ttl: @ttl
      }.delete_if { |_k, v| v.nil? }.merge(super(signature))
    end

    def path
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
