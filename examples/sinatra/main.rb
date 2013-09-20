require 'sinatra'
require 'slim'
require 'coffee-script'
require 'sass'
require 'pry'
require 'pubnub'

set :root, File.dirname(__FILE__)
set :public_folder, 'public'

pubnub = Pubnub.new(
    :publish_key   => 'demo',
    :subscribe_key => 'demo'
)

callback = lambda do |envelope|
  Message.create(
      :author => envelope.msg['author'],
      :message => envelope.msg['message'],
      :timetoken => envelope.timetoken
  ) if envelope.msg['author'] && envelope.msg['message']
end

get '/' do
  slim :index
end

get '/update_stream' do

end

get '/send_message' do

end

get '/application.css' do
  sass :application
end

get '/streamer.js' do
  content_type 'text/javascript'
  coffee :streamer
end
