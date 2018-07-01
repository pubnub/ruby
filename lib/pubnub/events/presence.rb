# Toplevel Pubnub module.
module Pubnub
  # Holds presence functionality, beware, most of presence functionality is
  # held by SubscribeEvent
  class Presence < SubscribeEvent
    include Concurrent::Async
    include Pubnub::Validator::Presence

    def initialize(options, app)
      @event = :presence
      @telemetry_name = :l_pres
      super
    end

    def format_channels
      @channel = Formatter.format_channel(@channel || @channels, true)
      @channel = @channel.map { |c| c + '-pnpres' }
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_PRESENCE
    end
  end
end
