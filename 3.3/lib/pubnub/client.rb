require 'pubnub/em/client.rb'
require 'pubnub/em/request.rb'
require 'pubnub/configuration.rb'
require 'em-http-request'

module Pubnub
  class Client
    include Configuration
    attr_accessor :cipher_key, :host, :query, :response, :timetoken, :url, :operation, :callback, :publish_key, :subscribe_key, :secret_key, :channel, :jsonp, :message, :ssl, :port

    attr_accessor :close_connection, :history_limit, :history_count, :history_start, :history_end, :history_reverse, :session_uuid, :last_timetoken, :origin, :error

    def initialize(options = {})
      puts options

      @retry_count       = 0
      @operation       = options[:operation].to_s
      @operation       = options[:operation].to_s
      @callback        = options[:callback]# || DEFAULT_CALLBACK
      @cipher_key      = options[:cipher_key]
      @publish_key     = options[:publish_key] || DEFAULT_PUBLISH_KEY
      @subscribe_key   = options[:subscribe_key] || DEFAULT_SUBSCRIBE_KEY
      @channel         = options[:channel] || DEFAULT_CHANNEL
      @message         = options[:message]
      @ssl             = options[:ssl]# || DEFAULT_SSL_SET
      @secret_key      = options[:secret_key]# || '0'
      @timetoken       = options[:timetoken]# || '0'
      @session_uuid    = options[:session_uuid]

      @history_count   = options[:count]
      @history_start   = options[:start]
      @history_end     = options[:end]
      @history_reverse = options[:reverse]

      @port            = options[:port]# || DEFAULT_PORT
      @url             = options[:url]
      @origin          = options[:origin]
      @origin          = DEFAULT_ORIGIN unless @origin
      @query           = options[:query]

      @params          = Hash.new

      puts "TO JEST HOST #{@origin}"

      validate_client
    end

    def publish(options = {})
      merge_options(options, 'publish')
      start_request
    end

    def subscribe(options = {})
      merge_options(options, 'subscribe')

      @options[:channel] = options[:channel] if options[:channel]

      start_request
    end

    def presence(options = {})
      merge_options(options, 'presence')
      start_request
    end

    def history(options = {})
      merge_options(options, 'history')
      start_request
    end

    def detailed_history(options = {})
      merge_options(options, 'detailed_history')

      @options[:params].merge!({:count => options[:count]})
      @options[:params].merge!({:start => options[:start]}) unless options[:start].nil?
      @options[:params].merge!({:end => options[:end]}) unless options[:end].nil?
      @options[:params].merge!({:reverse => 'true'}) if options[:reverse]

      start_request
    end

    def here_now(options = {})
      merge_options(options, 'here_now')
      start_request
    end

    def time(options = {})
      merge_options(options, 'time')
      start_request
    end

    private

    def merge_options(options = {}, operation)
      @options = {
        :ssl           => @ssl,
        :cipher_key    => @cipher_key,
        :publish_key   => @publish_key,
        :subscribe_key => @subscribe_key,
        :secret_key    => @secret_key,
        :origin        => @origin,
        :operation     => operation,
        :params        => { :uuid => @session_uuid },
        :timetoken     => @timetoken
      }.merge(options)
    end

    def start_request
      puts @options
      request = Pubnub::Request.new(@options)

      puts request.origin + request.path + '?' + request.query

      #Thread.new {
        EM.run do
          EM.add_periodic_timer(PERIODIC_TIMER) do
            if @close_connection
              EM.stop
            else
              http = EM::HttpRequest.new(request.origin).get :path => request.path, :query => request.query

              http.callback {

                if http.response_header.status.to_i == 200
                  puts "GOOD ]:->"

                  request.handle_response(http.response)

                  request.callback.call(request.response)
                else
                  begin
                    puts "NOT GOOD"
                    request.callback.call(Yajl::Parser.parse(http.response))
                    increment_retries
                  rescue => e
                    request.callback.call([0, "Bad server response: #{http.response_header.http_status.to_i}"])
                    increment_retries
                  end
                end

                EM.stop unless %w(subscribe presence).include? request.operation || @retry
              }

              http.errback {

              }
            end
          end
        end
      #}
    end
    
    def increment_retries
      if @retry_count < MAX_RETRIES
        @retry = true
      else
        @retry = false
      end
      @retry_count = @retry_count + 1
    end

    def validate_client
      raise('subscribe_key is a mandatory parameter.') if @subscribe_key.to_s.size == 0
    end

    def generate_new_uuid
      UUID.new.generate
    end

  end
end

