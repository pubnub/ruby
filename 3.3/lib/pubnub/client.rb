require 'pubnub/em/client.rb'
require 'pubnub/em/request.rb'
require 'pubnub/configuration.rb'
require 'em-http-request'
require 'httparty'

module Pubnub
  class Client
    include Configuration

    attr_accessor :uuid, :cipher_key, :host, :query, :response, :timetoken, :url, :operation, :callback, :publish_key, :subscribe_key, :secret_key, :channel, :jsonp, :message, :ssl, :port
    attr_accessor :close_connection, :history_limit, :history_count, :history_start, :history_end, :history_reverse, :session_uuid, :last_timetoken, :origin, :error

    def initialize(options = {})
      @retry           = true
      @retry_count     = 0
      @callback        = options[:callback]# || DEFAULT_CALLBACK
      @cipher_key      = options[:cipher_key]
      @publish_key     = options[:publish_key]# || DEFAULT_PUBLISH_KEY
      @subscribe_key   = options[:subscribe_key] || DEFAULT_SUBSCRIBE_KEY
      @channel         = options[:channel] || DEFAULT_CHANNEL
      @message         = options[:message]
      @ssl             = options[:ssl]# || DEFAULT_SSL_SET
      @secret_key      = options[:secret_key]# || '0'
      @timetoken       = options[:timetoken]# || '0'
      @session_uuid    = UUID.new.generate

      @history_count   = options[:count]
      @history_start   = options[:start]
      @history_end     = options[:end]
      @history_reverse = options[:reverse]

      @port            = options[:port]# || DEFAULT_PORT
      @url             = options[:url]
      @origin          = options[:origin]
      @origin          = DEFAULT_ORIGIN unless @origin
      @query           = options[:query]

      @http_sync       = options[:http_sync]

      @params          = Hash.new
    end

    def publish(options = {})
      merge_options(options, 'publish')
      verify_operation('publish', options)
      start_request
    end

    def subscribe(options = {})
      merge_options(options, 'subscribe')
      verify_operation('subscribe', options)
      start_request
    end

    def presence(options = {})
      merge_options(options, 'presence')
      verify_operation('presence', options)
      start_request
    end

    def history(options = {})
      merge_options(options, 'history')
      verify_operation('history', options)
      start_request
    end

    def detailed_history(options = {})
      merge_options(options, 'detailed_history')
      verify_operation('detailed_history', options)

      @options[:params].merge!({:count => options[:count]})
      @options[:params].merge!({:start => options[:start]}) unless options[:start].nil?
      @options[:params].merge!({:end => options[:end]}) unless options[:end].nil?
      @options[:params].merge!({:reverse => 'true'}) if options[:reverse]

      start_request
    end

    def leave(options = {})
      merge_options(options, 'leave')
      verify_operation('leave', options)
      start_request
    end

    def unsubscribe
      merge_options(options, 'unsubscribe')
      verify_operation('unsubscribe', options)
      start_request
    end

    def here_now(options = {})
      merge_options(options, 'here_now')
      verify_operation('here_now', options)
      start_request
    end

    def time(options = {})
      merge_options(options, 'time')
      verify_operation('time', options)
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
      request = Pubnub::Request.new(@options)

      unless @options[:http_sync]
        EM.run do
          if %w(subscribe presence).include? request.operation
            EM.add_periodic_timer(PERIODIC_TIMER) do
              if @close_connection
                EM.stop
              else
                http = send_request(request)
                http.callback do

                  if http.response_header.status.to_i == 200
                    if is_valid_json?(http.response)
                      make_callback = is_update?(request.timetoken)

                      request.handle_response(http.response)
                      request.callback.call(request.response) if make_callback
                    end
                  end
                end

                http.errback do

                end
              end
            end
          else
            EM.next_tick do
              http = send_request(request)

              http.callback do

                if http.response_header.status.to_i == 200
                  if is_valid_json?(http.response)
                    request.handle_response(http.response)
                    request.callback.call(request.response)
                  end
                else
                  begin
                    request.callback.call(Yajl::Parser.parse(http.response))
                  rescue
                    request.callback.call([0, "Bad server response: #{http.response_header.http_status.to_i}"])
                  end
                end

                EM.stop
              end
            end
          end
        end
      else
        response = HTTParty.get(request.origin + request.path, :query => request.query)
        if is_valid_json?(response.body)
          puts response.body
          request.handle_response(response.body)
          request.callback.call(request.response)
          #request.response.first.each do |res|
          #  request.callback.call(res)
          #end
        end
      end
    end

    def send_request(request)
      puts "#{request.origin}#{request.path}?#{request.query}"
      EM::HttpRequest.new(request.origin).get :path => request.path, :query => request.query
    end

    def is_update?(timetoken)
      @timetoken == timetoken ? false : @timetoken = timetoken
    end

    def is_valid_json?(response)
      begin
        JSON.parse(response)
        valid = true
      rescue
        increment_retries
        valid = false
      end
      valid
    end
    
    def increment_retries
      if @retry_count < MAX_RETRIES
        @retry = true
      else
        @retry = false
        @retry_count = 0
      end
      @retry_count = @retry_count + 1
    end

    def verify_operation(operation, options)
      case operation
        when 'publish'
          raise(ArgumentError, 'publish() requires :channel, :message and :callback parameters.') unless options[:channel] && options[:callback] && options[:message]
        when 'subscribe'
          raise(ArgumentError, 'subscribe() requires :channel and :callback parameters.') unless options[:channel] && options[:callback]
        when 'presence'
          raise(ArgumentError, 'presence() requires :channel and :callback parameters.') unless options[:channel] && options[:callback]
        when 'time'
          raise(ArgumentError, 'time() require :callback parameter.') unless options[:callback]
        when 'history'
          raise(ArgumentError, 'history() requires :channel, :callback and :limit parameters.') unless options[:channel] && options[:callback] && options[:limit]
        when 'detailed_history'
          raise(ArgumentError, 'detailed_history() requires :channel, :callback, and :count parameters.') unless options[:channel] && options[:callback] && options[:count]
        when 'here_now'
          raise(ArgumentError, 'here_now() requires :channel and :callback parameters.') unless options[:channel] && options[:callback]
      end
      raise('callback is invalid.') unless options[:callback].respond_to? 'call'

    end

  end
end

