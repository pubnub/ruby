require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

__END__

@@layout
doctype html
html
  head
    meta charset="utf-8"
    title Pubnub Chatty Sinatra Test App
    link rel="stylesheet" media="screen" href="/style.css"
  body
    == yield

@@index
dupa dupa