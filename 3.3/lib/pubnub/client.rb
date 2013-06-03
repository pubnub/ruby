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
      @subscriptions   = Hash.new
    end

    def publish(options = {}, &block)
      merge_options(options, 'publish')
      verify_operation('publish', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def subscribe(options = {}, &block)
      merge_options(options, 'subscribe')
      verify_operation('subscribe', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def presence(options = {}, &block)
      merge_options(options, 'presence')
      verify_operation('presence', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def history(options = {}, &block)
      merge_options(options, 'history')
      verify_operation('history', options.merge!(:block_given => block_given?))

      @options[:params].merge!({:count => options[:count]})
      @options[:params].merge!({:start => options[:start]}) unless options[:start].nil?
      @options[:params].merge!({:end => options[:end]}) unless options[:end].nil?
      @options[:params].merge!({:reverse => 'true'}) if options[:reverse]

      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def leave(options = {}, &block)
      merge_options(options, 'leave')
      verify_operation('leave', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
      @subscriptions[options[:channel]].cancel
    end
    alias_method :unsubscribe, :leave

    def here_now(options = {}, &block)
      merge_options(options, 'here_now')
      verify_operation('here_now', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def time(options = {}, &block)
      merge_options(options, 'time')
      verify_operation('time', options.merge!(:block_given => block_given?))
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
    end

    def show_subscriptions
      @subscriptions.each do |sub|
        puts sub
      end
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
        :timetoken     => @timetoken,
        :channel       => compile_channel_parameter(options[:channel],options[:channels])
      }.merge(options)
    end

    def start_request(&block)
      request = Pubnub::Request.new(@options)
      unless @options[:http_sync]

        Thread.new {
          EM.run
        }

        while EM.reactor_running? == false do end

        if %w(subscribe presence).include? request.operation
          @subscriptions[@options[:channel]] = EM.add_periodic_timer(PERIODIC_TIMER) do
            if @close_connection
              EM.stop
            else
              http = send_request(request)
              http.callback do
                if http.response_header.status.to_i == 200
                  if is_valid_json?(http.response)
                    make_callback = is_update?(request.timetoken)
                    request.handle_response(http)
                    if block_given?
                      request.envelopes.each do |envelope|
                        block.call envelope
                      end
                    else
                      request.envelopes.each do |envelope|
                        request.callback.call envelope
                      end
                    end if make_callback
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
                  request.handle_response(http)
                  if block_given?
                    request.envelopes.each do |envelope|
                      block.call envelope
                    end
                  else
                    request.envelopes.each do |envelope|
                      request.callback.call envelope
                    end
                  end
                end
              else
                begin
                  request.handle_response(http)
                  if block_given?
                    request.envelopes.each do |envelope|
                      block.call envelope
                    end
                  else
                    request.envelopes.each do |envelope|
                      request.callback.call envelope
                    end
                  end
                rescue
                  if block_given?
                      block.call Pubnub::Response.new(
                                     :error_init => true,
                                     :message =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s
                                 )
                  else
                      request.callback.call Pubnub::Response.new(
                                                :error_init => true,
                                                :message =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s
                                            )
                  end
                end
              end
            end
          end
        end
      else
        if request.query.to_s.empty?
          response = HTTParty.get(request.origin + request.path)
        else
          response = HTTParty.get(request.origin + request.path, :query => request.query)
        end
        if response.response.code.to_i == 200
          if is_valid_json?(response.body)
            request.handle_response(response)
            if block_given?
              request.envelopes.each do |envelope|
                block.call envelope
              end
            else
              request.envelopes.each do |envelope|
                request.callback.call envelope
              end
            end
          end
        else
          begin
            request.handle_response(response)
            if block_given?
              request.envelopes.each do |envelope|
                block.call envelope
              end
            else
              request.envelopes.each do |envelope|
                request.callback.call envelope
              end
            end
          rescue
            if block_given?
              block.call Pubnub::Response.new(
                             :error_init => true,
                             :message =>  [0, "Bad server response: #{response.response.code}"].to_s
                         )
            else
              request.callback.call Pubnub::Response.new(
                                        :error_init => true,
                                        :message =>  [0, "Bad server response: #{response.response.code}"].to_s
                                    )
            end
          end
        end
      end
    end

    def send_request(request)
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
          raise(ArgumentError, 'publish() requires :channel, :message parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given]) && options[:message]
        when 'subscribe'
          raise(ArgumentError, 'subscribe() requires :channel parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given])
        when 'presence'
          raise(ArgumentError, 'presence() requires :channel parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given])
        when 'time'
          raise(ArgumentError, 'time() require callback parameter or block given.') unless (options[:callback] || options[:block_given])
        when 'history'
          raise(ArgumentError, 'history() requires :channel, :count parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given]) && options[:count]
        when 'here_now'
          raise(ArgumentError, 'here_now() requires :channel parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given])
        when 'leave'
          raise(ArgumentError, 'leave() requires :channel parameters and callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given])
      end

      unless options[:callback].nil?
        raise('callback is invalid.') unless options[:callback].respond_to? 'call'
      end

    end

    def compile_channel_parameter(channel, channels)
      raise(ArgumentError, 'Can\'t handle both :channel and :channels parameters given.') if channel && channels
      channel = channels if channels
      channel = channel.join(',') if channel.class == Array
      channel
    end

  end
end

