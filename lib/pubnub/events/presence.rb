# Toplevel Pubnub module
module Pubnub
  # Holds presence functionality, beware, most of presence functionality is
  # held by SubscribeEvent
  class Presence
    include Celluloid
    include Pubnub::Event
    include Pubnub::SubscribeEvent

    def format_channels
      @channel = Formatter.format_channel(@channel || @channels)
      @channel = @channel.map { |c| c + '-pnpres' }
    end
  end
end
