require 'pubnub/configuration.rb'
require 'pubnub/subscription.rb'
require 'em-http-request'
require 'httparty'
require 'persistent_httparty'
require 'timeout'

module Pubnub
  class PubNubHTTParty
    include HTTParty
    default_timeout 310
    #persistent_connection_adapter

    def first_run?
      @first_run ? true : false
    end

    def send_request(path, options={}, &block)
      if @first_run.nil?
        @first_run = true
      else
        @first_run = false
      end
      self.class.get path, options

    end
  end

  class Client
    include Configuration

    attr_accessor :uuid, :cipher_key, :host, :query, :response, :timetoken, :url, :operation, :callback, :publish_key, :subscribe_key, :secret_key, :channel, :jsonp, :message, :ssl, :port
    attr_accessor :close_connection, :history_limit, :history_count, :history_start, :history_end, :history_reverse, :session_uuid, :last_timetoken, :origin, :error


    DEFAULT_CONNECT_CALLBACK = lambda { |msg| $log.info "CONNECTED: #{msg}" }
    DEFAULT_ERROR_CALLBACK = lambda { |msg| $log.error "AN ERROR OCCURRED: #{msg}" }

    def initialize(options = {})
      $log = options[:logger]
      $log = Logger.new('pubnub.log', 0, 100 * 1024 * 1024) unless $log

      @subscription_request = nil
      @retry            = true
      @retry_count      = 0
      @callback         = options[:callback]
      @error_callback   = options[:error_callback]
      @error_callback   = DEFAULT_ERROR_CALLBACK unless @error_callback
      @connect_callback = options[:connect_callback]
      @connect_callback = DEFAULT_CONNECT_CALLBACK unless @connect_callback
      @cipher_key       = options[:cipher_key]
      @publish_key      = options[:publish_key]# || DEFAULT_PUBLISH_KEY
      @subscribe_key    = options[:subscribe_key] || DEFAULT_SUBSCRIBE_KEY
      @channel          = options[:channel] || DEFAULT_CHANNEL
      @message          = options[:message]
      @ssl              = options[:ssl]
      @secret_key       = options[:secret_key]
      @timetoken        = options[:timetoken]
      @session_uuid     = UUID.new.generate

      @history_count    = options[:count]
      @history_start    = options[:start]
      @history_end      = options[:end]
      @history_reverse  = options[:reverse]

      @port             = options[:port]
      @url              = options[:url]
      @origin           = options[:origin]
      @origin           = DEFAULT_ORIGIN unless @origin
      @query            = options[:query]

      @http_sync        = options[:http_sync]

      @non_subscribe_timeout = options[:non_subscribe_timeout]
      @non_subscribe_timeout = 5 unless @non_subscribe_timeout

      @reconnect_max_attempts = options[:reconnect_max_attempts]
      @reconnect_max_attempts = 60 unless @reconnect_max_attempts

      @reconnect_retry_interval = options[:reconnect_retry_interval]
      @reconnect_retry_interval = 5 unless @reconnect_retry_interval

      @reconnect_response_timeout = options[:reconnect_response_timeout]
      @reconnect_response_timeout = 5 unless @reconnect_response_timeout

      @sync_connection_sub = Pubnub::PubNubHTTParty.new
      @sync_connection     = Pubnub::PubNubHTTParty.new
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

      return false unless Subscription.get_channels.include? options[:channel]
      if block_given?
        start_request { |envelope| block.call envelope }
      else
        start_request
      end
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

    def subscription_running?
      @subscription_running
    end

    def active_subscriptions
      @subscription_request
    end

    private

    def merge_options(options = {}, operation = '')
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
        :error_callback=> @error_callback,
        :channel       => compile_channel_parameter(options[:channel],options[:channels])
      }.merge(options)
    end

    def start_request(&block)
      request = Pubnub::Request.new(@options)
      unless @options[:http_sync]
        Thread.new {
          #puts EM.reactor_running?.to_s
          EM.run # do
          #EM.add_shutdown_hook { 'EXITING' }
        } unless EM.reactor_running?
        #EM.defer do
        while EM.reactor_running? == false do end
        if %w(subscribe presence).include? request.operation

          if block_given?
            Subscription.new(:channel  => @options[:channel]){ |envelope| block.call envelope }
          else
            Subscription.new(:channel  => @options[:channel], :callback => @options[:callback])
          end

          @subscription_request = request unless @subscription_request

          @subscription_request.channel = Subscription.channels_for_url

          #EM.add_periodic_timer(PERIODIC_TIMER) do
          EM.tick_loop do
            @subscription_running = true

            if @close_connection
              EM.stop
            else
              unless @wait_for_response
                @wait_for_response = true
                $log.debug 'SENDING SUBSCRIBE REQUEST'
                http = send_request(@subscription_request)

                http.callback do
                  $log.debug 'GOT SUBSCRIBE RESPONSE'
                  @wait_for_response = false
                  if http.response_header.status.to_i == 200
                    if is_valid_json?(http.response)
                      @subscription_request.handle_response(http)
                      @subscription_request.envelopes.each do |envelope|
                        Subscription.fire_callbacks_for envelope
                      end if is_update?(@subscription_request.timetoken)
                    end
                  end
                end
                http.errback do
                  $log.error 'GOT SUBSCRIBE ERROR'
                  @error_callback.call [0, http.error]
                end
              end
            end
          end unless @subscription_running
        else
          EM.next_tick do
            $log.debug 'SENDING OTHER REQUEST'

            if request.operation == 'leave'
              Subscription.remove_from_subscription request.channel
            end

            http = send_request(request)

            http.errback do
              @error_callback.call [0, http.error]
            end

            http.callback do
              $log.debug 'GOT OTHER RESPONSE'
              #byebug
              if http.response_header.status.to_i == 200
                if is_valid_json?(http.response)
                  request.handle_response(http)
                  if block_given?
                    request.envelopes.each do |envelope|
                      $log.debug 'CALLING BLOCK CALLBACK'
                      block.call envelope
                    end
                  else
                    request.envelopes.each do |envelope|
                      $log.debug 'CALLING PARAMETER CALLBACK'
                      request.callback.call envelope
                    end
                  end
                end
              else
                begin
                  request.handle_response(http)
                  request.envelopes.each do |envelope|
                    if request.error_callback
                      request.error_callback.call envelope
                    else
                      @error_callback.call envelope
                    end
                  end

                rescue
                  if request.error_callback
                    request.error_callback.call Pubnub::Response.new(
                      :error_init => true,
                      :message =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s,
                      :response =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s
                    )
                  else
                    @error_callback.call Pubnub::Response.new(
                      :error_init => true,
                      :message =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s,
                      :response =>  [0, "Bad server response: #{http.response_header.status.to_i}"].to_s
                    )
                  end
                end
              end
            end
          end
        end
        #end
        #end
      else
        begin
          if @timetoken.to_i == 0 && request.operation == 'subscribe'
            time(:http_sync => true){|envelope| @timetoken = envelope.message.to_i }
          end
          begin
            if request.query.to_s.empty?
              if %w(subscribe presence).include? request.operation
                response = @sync_connection_sub.send_request(request.origin + request.path, :timeout => 370)
              else
                response = @sync_connection.send_request(request.origin + request.path, :timeout => @non_subscribe_timeout)
              end
            else
              if %w(subscribe presence).include? request.operation
                response = @sync_connection_sub.send_request(request.origin + request.path, :query => request.query, :timeout => 370)
              else
                response = @sync_connection.send_request(request.origin + request.path, :query => request.query, :timeout => @non_subscribe_timeout)
              end
            end
          rescue
            @error_callback.call 'ERROR SENDING REQUEST'
            @retries = 0 unless @retries
            @retries += 1
            if @retries <= MAX_RETRIES
              return start_request(&block)
            else
              msg = "ERROR SENDING REQUEST AFTER #{@retries} RETRIES"
              @retries = 0
              return Pubnub::Response.new(
                          :error_init => true,
                          :message =>  [0, msg].to_s,
                          :response =>  [0, msg].to_s
                      )
            end
          end

          if @sync_connection_sub.first_run?
            @connect_callback.call 'SYNC CONNECTION ESTABLISHED'
          end

          if response.response.code.to_i == 200
            if is_valid_json?(response.body)
              request.handle_response(response)
              @timetoken = request.timetoken

              if request.operation == 'leave'
                Subscription.remove_from_subscription request.channel
              end

              if block_given?
                request.envelopes.each do |envelope|
                  block.call envelope
                end
              elsif !request.callback.nil?
                request.envelopes.each do |envelope|
                  request.callback.call envelope
                end
              else
                if %w(publish leave here_now time).include? request.operation
                  return request.envelopes[0]
                else
                  return request.envelopes
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
              elsif !request.callback.nil?
                request.envelopes.each do |envelope|
                  request.callback.call envelope
                end
              else
                if %w(publish leave here_now time).include? request.operation
                  return request.envelopes[0]
                else
                  return request.envelopes
                end
              end
            rescue
              if request.error_callback
                request.error_callback.call Pubnub::Response.new(
                                                :error_init => true,
                                                :message =>  [0, "Bad server response: #{response.response.code.to_i}"].to_s,
                                                :response =>  [0, "Bad server response: #{response.response.code.to_i}"].to_s
                                            )
              else
                @error_callback.call Pubnub::Response.new(
                                         :error_init => true,
                                         :message =>  [0, "Bad server response: #{response.response.code.to_i}"].to_s,
                                         :response =>  [0, "Bad server response: #{response.response.code.to_i}"].to_s
                                     )
              end
            end
          end
        rescue Timeout::Error
          if request.error_callback
            request.error_callback.call [0, 'TIMEOUT']
          else
            @error_callback.call [0, 'TIMEOUT']
          end
        end
      end
    end

    def send_request(request)
      if %w(subscribe presence).include? request.operation
        unless @subscribe_connection
          @subscribe_connection = EM::HttpRequest.new(request.origin, :connect_timeout => 370, :inactivity_timeout => 370)
          connection = @subscribe_connection.get :path => '/time/0', :keepalive => true, :query => request.query
          #EM.next_tick do
            connection.callback do
              EM.defer do @connect_callback.call 'ASYNC SUBSCRIBE CONNECTION' end
            end
          #end
        end

        @subscribe_connection.get :path => request.path, :query => request.query, :keepalive => true
      else
        unless @connection
          @connection = EM::HttpRequest.new request.origin
        end
        @connection.get :path => request.path, :query => request.query, :keepalive => true
      end
    end

    def is_update?(timetoken)
      if @timetoken.to_i < timetoken.to_i
        @timetoken = timetoken
      else
        false
      end

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
          raise(ArgumentError, 'publish() requires :channel, :message parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync]) && options[:message]
        when 'subscribe'
          raise(ArgumentError, 'subscribe() requires :channel parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync])
        when 'presence'
          raise(ArgumentError, 'presence() requires :channel parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync])
        when 'time'
          raise(ArgumentError, 'time() require, if async, callback parameter or block given.') unless (options[:callback] || options[:block_given] || options[:http_sync])
        when 'history'
          raise(ArgumentError, 'history() requires :channel, :count parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync]) && options[:count]
        when 'here_now'
          raise(ArgumentError, 'here_now() requires :channel parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync])
        when 'leave'
          raise(ArgumentError, 'leave() requires :channel parameters and, if async, callback parameter or block given.') unless (options[:channel] || options[:channels]) && (options[:callback] || options[:block_given] || options[:http_sync])
      end

      unless options[:callback].nil?
        raise('callback is invalid.') unless options[:callback].respond_to? 'call'
      end

      unless options[:error_callback].nil?
        raise('error_callback is invalid.') unless options[:error_callback].respond_to? 'call'
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

