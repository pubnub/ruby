# Toplevel Pubnub module.
module Pubnub
  # Holds here_now functionality
  class Audit < PAM
    include Celluloid

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
