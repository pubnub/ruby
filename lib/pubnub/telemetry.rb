module Pubnub
  class Telemetry
    include Concurrent::Async

    def initialize
      @recorded_history = Concurrent::Map.new { default_telemetry }
      Pubnub.logger.debug('Pubnub::Telementry') { 'Initialized Telemetry' }
    end

    def record_request(telemetry_type, time_start, time_end)
      @recorded_history.compute(telemetry_type) do |telemetry|
        telemetry = default_telemetry unless telemetry
        telemetry[:sum] += (time_end - time_start)
        telemetry[:counter] += 1
        telemetry
      end
    rescue StandardError => error
      Pubnub.logger.error('Pubnub::Telemetry') { "Failed to record request #{error}\n#{error.backtrace.join("\n")}" }
    end

    def fetch_average(telemetry_type)
      Pubnub.logger.debug('Pubnub::Telemetry') { "Fetching telemetry for #{telemetry_type}" }
      return false if @recorded_history[telemetry_type][:counter] == 0
      average = 0
      @recorded_history.compute(telemetry_type) do |telemetry|
        average = telemetry[:sum].to_f / telemetry[:counter].to_f
        default_telemetry
      end
      Pubnub.logger.debug('Pubnub::Telemetry') { "Current average: #{average}" }
      average
    rescue StandardError => error
      Pubnub.logger.error('Pubnub::Telemetry') { "Failed to fetch average #{error}\n#{error.backtrace.join("\n")}" }
    end

    private

    def default_telemetry
      {
          sum: 0,
          counter: 0
      }
    end

  end
end
