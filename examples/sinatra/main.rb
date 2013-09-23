require 'sinatra'
require 'json'
require 'slim'
require 'coffee-script'
require 'sass'
require 'pubnub'

set :root, File.dirname(__FILE__)
set :public_folder, 'public'

pubnub = Pubnub.new(
    :publish_key   => 'demo',
    :subscribe_key => 'demo'
)

get '/' do
  slim :index
end

post '/get_messages' do
  content_type :json

  msgs = pubnub.subscribe(
             :channel => 'pubnub_chat',
             :http_sync => true
         )

  msgs.map { |envelope| {
          :message => envelope.msg['message'],
          :author => envelope.msg['author']
      }
  }.to_json
end

post '/publish' do
  content_type :json
  pubnub.publish(
      :http_sync => true,
      :channel => 'pubnub_chat',
      :message => {
          :message => params[:message],
          :author  => params[:author]
      }
  ).to_json
end

get '/application.css' do
  sass :application
end

get '/streamer.js' do
  content_type 'text/javascript'
  coffee :streamer
end
