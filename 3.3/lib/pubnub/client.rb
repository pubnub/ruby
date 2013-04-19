require 'pubnub/em/client.rb'
require 'pubnub/em/request.rb'
require 'pubnub/configuration.rb'
require 'em-http-request'

module Pubnub
  class Client
    include Configuration
    attr_accessor :cipher_key, :host, :query, :response, :timetoken, :url, :operation, :callback, :publish_key, :subscribe_key, :secret_key, :channel, :jsonp, :message, :ssl, :port

    attr_accessor :history_limit, :history_count, :history_start, :history_end, :history_reverse, :session_uuid, :last_timetoken, :origin, :error

    def initialize(options = {})
      @operation     = options[:operation].to_s
      @callback      = options[:callback]# || DEFAULT_CALLBACK
      @cipher_key    = options[:cipher_key]
      @publish_key   = options[:publish_key]# || DEFAULT_PUBLISH_KEY
      @subscribe_key = options[:subscribe_key]# || DEFAULT_SUBSCRIBE_KEY
      @channel       = options[:channel]# || DEFAULT_CHANNEL
      @message       = options[:message]
      @ssl           = options[:ssl]# || DEFAULT_SSL_SET
      @secret_key    = options[:secret_key] || '0'
      @timetoken     = options[:timetoken] || '0'
      @session_uuid  = options[:session_uuid]# || generate_new_uuid

      @port          = options[:port]# || DEFAULT_PORT
      @url           = options[:url]
      @host          = options[:host] || DEFAULT_HOST
      @query         = options[:query]

      validate_client
    end

    def publish(options = {})
      merge_options(options, 'publish')
      make_request
    end

    def subscribe(options = {})
      merge_options(options, 'subscribe')
      make_request
    end

    def presence(options = {})
      merge_options(options, 'presence')
      make_request
    end

    def history(options = {})
      merge_options(options, 'history')
      make_request
    end

    def detailed_history(options = {})
      merge_options(options, 'detailed_history')

      @options[:params].merge!({:count => @options[:history_count]})
      @options[:params].merge!({:start => @options[:history_start]}) unless @options[:history_start].nil?
      @options[:params].merge!({:end => @options[:history_end]}) unless @options[:history_end].nil?
      @options[:params].merge!({:reverse => 'true'}) if !@options[:history_reverse].nil? && @options[:history_reverse]

      make_request
    end

    def here_now(options = {})
      merge_options(options, 'here_now')
      make_request
    end

    def time(options = {})
      merge_options(options, 'time')
      make_request
    end

    private

    def merge_options(options = {}, operation)
      @options = {
        :ssl           => @ssl,
        :cipher_key    => @cipher_key,
        :publish_key   => @publish_key,
        :subscribe_key => @subscribe_key,
        :secret_key    => @secret_key,
        :host          => @host,
        :operation     => operation,
        :params        => { :uuid => @session_uuid },
        :timetoken     => @timetoken
      }.merge(options)
    end

    def make_request
      request = Pubnub::Request.new(@options)
      Thread.new {
        EM.run do
          puts "tutej #{request}"
          http = EM::HttpRequest.new(request.origin).get :path => request.path, :query => request.query
          http.callback {

            if http.response_header.status.to_i == 200
              puts "GOOD ]:->"
              request.callback.call(Yajl::Parser.parse(http.response))
            else
              begin
                puts "NOT GOOD"
                request.callback.call(Yajl::Parser.parse(http.response))
              rescue => e
                request.callback.call([0, "Bad server response: #{http.response_header.http_status.to_i}"])
              end
            end

            EM.stop
          }
        end
      }
    end

    def validate_client
      raise('subscribe_key is a mandatory parameter.') if @subscribe_key.to_s.size == 0
    end

    def generate_new_uuid
      UUID.new.generate
    end

  end
end

