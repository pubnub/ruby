module Pubnub
  class Telemetry
    include Celluloid

    def initialize
      @timers, @good_to_go, @recorded_history = {}, {}, {}
      Pubnub.logger.debug('Pubnub::Telementry') { 'Initialized Telemetry'}
    end

    def record_request(telemetry_type, time_start, time_end)
      begin
        @timers[telemetry_type] = every(1) { @good_to_go[telemetry_type] = true } unless @timers[telemetry_type]
        @recorded_history[telemetry_type] ||= []
        @recorded_history[telemetry_type] << time_end - time_start
      rescue => error
        Pubnub.logger.error('Pubnub::Telemetry'){ "Failed to record request #{error}\n#{error.backtrace.join("\n")}" }
      end
    end

    def fetch_average(telemetry_type)
      begin
        @recorded_history[telemetry_type] ||= []
        return false if !@good_to_go[telemetry_type] || @recorded_history[telemetry_type].size == 0
        average = @recorded_history[telemetry_type].reduce(0, :+) / @recorded_history[telemetry_type].size
        clear!(telemetry_type)
        average
      rescue => error
        Pubnub.logger.error('Pubnub::Telemetry'){ "Failed to fetch average #{error}\n#{error.backtrace.join("\n")}" }
      end
    end

    def clear!(telemetry_type)
      begin
        @recorded_history[telemetry_type] = []
        @good_to_go[telemetry_type] = false
      rescue => error
        Pubnub.logger.error('Pubnub::Telemetry'){ "Failed to clear telemetry #{error}\n#{error.backtrace.join("\n")}" }
      end
    end
  end
end