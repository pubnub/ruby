module Pubnub
  class HttpResponse
    attr_reader :body, :code, :http_version
    alias status_code code

    def initialize(httpx_response)
      @code = httpx_response.status
      @body = httpx_response.body.to_s
      @http_version = httpx_response.version
    end
  end
end
