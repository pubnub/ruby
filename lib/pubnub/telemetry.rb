module Pubnub
  class Telemetry
    include Celluloid

    def initialize
      @timers, @good_to_go, @recorded_history = {}, {}, {}
      Pubnub.logger.debug('Pubnub::Telementry') { 'Initialized Telemetry'}
    end

    def record_request(telemetry_type, time_start, time_end)
      @timers[telemetry_type] = every(1) { @good_to_go[telemetry_type] = true } unless @timers[telemetry_type]
      @recorded_history[telemetry_type] ||= []
      @recorded_history[telemetry_type] << time_end.to_i - time_start.to_i
    end

    def fetch_average(telemetry_type)
      @recorded_history[telemetry_type] ||= []
      return false if !@good_to_go[telemetry_type] || @recorded_history[telemetry_type].size == 0
      puts @recorded_history
      average = @recorded_history[telemetry_type].reduce(0, :+) / @recorded_history[telemetry_type].size
      clear!(telemetry_type)
      average
    end

    def clear!(telemetry_type)
      @recorded_history[telemetry_type] = []
      @good_to_go[telemetry_type] = false
    end
  end
end