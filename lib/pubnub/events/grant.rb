# Toplevel Pubnub module.
module Pubnub
  # Holds grant functionality
  class Grant < PAM
    include Celluloid
    include Pubnub::Validator::Grant

    def initialize(options, app)
      @event = :grant
      super
      @ttl ||= Pubnub::Constants::DEFAULT_TTL
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GRANT
    end

    def parameters(signature = false)
      write  = [0, '0', false].include?(@write) ? 0 : 1
      read   = [0, '0', false].include?(@read) ? 0 : 1
      manage = [0, '0', false].include?(@manage) ? 0 : 1 # unless @group.blank?

      { timestamp: @timestamp,
        w: write,
        r: read,
        m: manage,
        ttl: @ttl }.delete_if { |_k, v| v.nil? }.merge(super(signature))
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
