# Toplevel Pubnub module
module Pubnub
  # Holds here_now functionality
  class Audit
    include Celluloid
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::PAM

    def initialize(options, app)
      super
      @timestamp = current_time
    end

    private

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
