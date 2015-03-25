# Toplevel Pubnub module.
module Pubnub
  # OriginManager changes origin in client to online one
  # and keeps monitoring available origins
  class OriginManager
    attr_reader :last_ping, :failback

    def initialize(app)
      @app = app
    end

    def start
      origin_to_test = current_origin
      return false unless test_origin(origin_to_test)

      bring_down(origin_to_test)
      @app.reset_subscription
    end

    def current_origin
      @app.current_origin
    end

    def online_origins
      @app.online_origins
    end

    def offline_origins
      @app.offline_origins
    end

    private

    def test_origin(origin)
      if alive_and_valid?(URI.parse(@http + origin + '/time/0'))
        true
      else
        false
      end
    end

    def alive_and_valid?(uri)
      response_valid? get_ping_response(uri)
    rescue Errno::ECONNREFUSED
      false
    rescue => e
      Pubnub.logger.error('Pubnub::OriginManager') do
        "#{e.inspect} #{e.backtrace}"
      end
      false
    end

    def response_valid?(response)
      if response.is_a?(Net::HTTPSuccess) &&
          Formatter.valid_json?(response.body)
        true
      else
        false
      end
    end

    def get_ping_response(uri)
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        http.read_timeout = @timeout
        http.request request
      end
    end

    def ping(_origin)
      alive_and_valid?(@http)
    end

    def bring_down(_origin)
    end

    def bring_up(_origin)
    end
  end
end
