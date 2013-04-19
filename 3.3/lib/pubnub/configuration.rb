module Pubnub
  module Configuration
    DEFAULT_SECRET_KEY    = 0
    DEFAULT_TIMETOKEN     = 0
    DEFAULT_SUBSCRIBE_KEY = 'demo'
    DEFAULT_CIPHER_KEY    = nil
    DEFAULT_CALLBACK      = lambda { |x| puts x }
    DEFAULT_PUBLISH_KEY   = 'demo'
    DEFAULT_CHANNEL       = 'hello_world'

    DEFAULT_CONNECTION_OPTIONS = {
      :host           => 'pubsub.pubnub.com',
      :port           => 80,
      :method         => 'GET',
      :content_type   => "application/json",
      :path           => '/',
      :params         => {},
      :headers        => {},
      :user_agent     => "Pubnub Ruby 3.4",
      :ssl            => false,
      :timeout        => 0,
      :encoding       => nil,
      :auto_reconnect => true
    }

  end
end

