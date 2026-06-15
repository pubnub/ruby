module Pubnub
  class HttpDispatcher
    attr_reader :tcp_keepalive

    def initialize(httpx_session, keepalive_enabled: true)
      @session = httpx_session
      @tcp_keepalive = keepalive_enabled
    end

    def get(url, header: {})
      execute { @session.get(url, headers: header) }
    end

    def post(url, body: '', header: {})
      execute { @session.post(url, headers: header, body: body) }
    end

    def patch(url, body: '', header: {})
      execute { @session.patch(url, headers: header, body: body) }
    end

    def delete(url, header: {})
      execute { @session.delete(url, headers: header) }
    end

    def reset_all
      @session.close
    end

    private

    def execute
      response = yield
      if response.is_a?(HTTPX::ErrorResponse)
        raise response.error
      end
      Pubnub::HttpResponse.new(response)
    end
  end
end
