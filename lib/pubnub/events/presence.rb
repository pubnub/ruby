# Toplevel Pubnub module.
module Pubnub
  # Holds presence functionality, beware, most of presence functionality is
  # held by SubscribeEvent
  class Presence < SubscribeEvent
    include Celluloid

    def initialize(options, app)
      @event = :presence
      super
    end

    def format_channels
      @channel = Formatter.format_channel(@channel || @channels)
      @channel = @channel.map { |c| c + '-pnpres' }
    end
  end
end
