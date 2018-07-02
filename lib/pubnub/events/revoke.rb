# Toplevel Pubnub module.
module Pubnub
  # Holds revoke functionality
  class Revoke < PAM
    include Concurrent::Async
    include Pubnub::Validator::Revoke

    def initialize(options, app)
      @event = :grant
      super
      @ttl ||= Pubnub::Constants::DEFAULT_TTL
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_REVOKE
    end

    def parameters(signature = false)
      write = [0, '0', false].include?(@write) ? 1 : 0
      read = [0, '0', false].include?(@read) ? 1 : 0
      manage = [0, '0', false].include?(@manage) ? 1 : 0 unless @group.blank?

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
