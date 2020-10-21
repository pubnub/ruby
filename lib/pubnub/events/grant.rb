# Toplevel Pubnub module.
module Pubnub
  # Holds grant functionality
  class Grant < PAM
    include Concurrent::Async
    include Pubnub::Validator::Grant

    def initialize(options, app)
      @event = current_operation
      super
      @uuids = options[:uuids] unless options[:uuids].nil?
      @ttl ||= Pubnub::Constants::DEFAULT_TTL
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GRANT
    end

    def parameters(signature = false)
      write = [0, '0', false].include?(@write) ? 0 : 1
      read = [0, '0', false].include?(@read) ? 0 : 1
      manage = [0, '0', false].include?(@manage) ? 0 : 1 # unless @group.blank?
      delete = [0, '0', false].include?(@delete) ? 0 : 1 unless @delete.nil?
      get = [0, '0', false].include?(@get) ? 0 : 1 unless @get.nil?
      update = [0, '0', false].include?(@update) ? 0 : 1 unless @update.nil?
      join = [0, '0', false].include?(@join) ? 0 : 1 unless @join.nil?

      { timestamp: @timestamp,
        w: write,
        r: read,
        m: manage,
        d: delete,
        g: get,
        u: update,
        j: join,
        ttl: @ttl }.delete_if { |_k, v| v.nil? }.merge(super(signature))
    end

    def path
      '/' + [
        'v2',
        'auth',
        'grant',
        'sub-key',
        @subscribe_key
      ].join('/')
    end
  end
end
