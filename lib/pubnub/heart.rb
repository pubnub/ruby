# Toplevel Pubnub module.
module Pubnub
  # Heart takes responsibility of heartbeat event
  class Heart
    include Concurrent::Async

    def initialize(options)
      @heartbeat = options[:heartbeat]
      @channel = options[:channel]
      @app = options[:app]
    end

    def start_beating
      beating = Timers::Group.new

      beat

      beating.every(@heartbeat) do
        Pubnub.logger.debug('Pubnub') { 'Heartbeat!' }
        beat
      end

      loop { beating.wait }
    end

    def beat
      @app.heartbeat(
        channel: @channel,
        heartbeat: @heartbeat,
        http_sync: true
      )
    end
  end
end
