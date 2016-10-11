# Toplevel Pubnub module.
module Pubnub
  # Holds here_now functionality
  class Audit < PAM
    include Celluloid
    include Pubnub::Validator::Audit

    def initialize(options, app)
      @event = :audit
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_AUDIT
    end

    def parameters(signature = false)
      { timestamp: @timestamp }.merge(super(signature))
    end

    def path
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
