# Toplevel Pubnub module.
module Pubnub
  # Every message from server is formatted into easy to use Envelope object
  class Envelope
    # Ruby specific
    attr_accessor :id, :first, :last
    attr_accessor :history_start, :history_end

    # Pubnub Required
    attr_accessor :status, :result, :timetoken

    def initialize(options)
      @id            = UUID.generate # internal usage only

      @event         = options[:event]
      @event_options = options[:event_options]
      @status        = options[:status]
      @result        = options[:result]
      @timetoken     = options[:timetoken]
    end

    def repeat(client, changes = {})
      client.send @event, @event_options.merge(changes)
    end

    def error?
      @status[:error]
    end

    def last?
      last
    end

    def first?
      first
    end
  end
end
