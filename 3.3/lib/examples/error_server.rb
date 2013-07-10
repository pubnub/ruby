require 'eventmachine'
require 'evma_httpserver'

class MyHttpServer < EM::Connection
  include EM::HttpServer

  def post_init
    super
    no_environment_strings
  end

  def process_http_request
    server_codes = [400,500,404]
    content_types = ['text/html', 'text/javascript']
    content_bodies = ['YG^SD@UIEKA', '']

    response = EM::DelegatedHttpResponse.new(self)
    response.status = server_codes.sample
    response.content_type content_types.sample
    response.content = content_bodies.sample
    response.send_response
    puts '>> response send'
  end
end

EM.run{
  EM.start_server '0.0.0.0', 80, MyHttpServer
}