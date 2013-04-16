require 'pubnub/em/client.rb'
require 'pubnub/em/request.rb'

module Pubnub
  class Client

    attr_accessor :cipher_key, :host, :query, :response, :timetoken, :url, :operation, :callback, :publish_key, :subscribe_key, :secret_key, :channel, :jsonp, :message, :ssl, :port

    attr_accessor :history_limit, :history_count, :history_start, :history_end, :history_reverse, :session_uuid, :last_timetoken, :origin, :error

    def initialize(options = {})
      @operation     = options[:operation].to_s
      @callback      = options[:callback]
      @cipher_key    = options[:cipher_key]
      @publish_key   = options[:publish_key]
      @subscribe_key = options[:subscribe_key]
      @channel       = options[:channel]
      @message       = options[:message]
      @ssl           = options[:ssl] ? true : false
      @secret_key    = options[:secret_key] || '0'
      @timetoken     = options[:timetoken] || '0'
      @session_uuid  = options[:session_uuid]# || generate_new_uuid

      @port          = options[:port]
      @url           = options[:url]
      @host          = options[:host]
      @query         = options[:query]

      validate_client
    end

    def publish(options = {})
      merge_options(options, 'publish')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)
      end

    end

    def subscribe(options = {})
      merge_options(options, 'subscribe')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)
      end

    end

    def presence(options = {})
      merge_options(options, 'presence')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)

      end
    end

    def history(options = {})
      merge_options(options, 'history')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)
      end
    end

    def detailed_history(options = {})
      merge_options(options, 'detailed_history')

      @options[:params].merge!({:count => @options[:history_count]})
      @options[:params].merge!({:start => @options[:history_start]}) unless @options[:history_start].nil?
      @options[:params].merge!({:end => @options[:history_end]}) unless @options[:history_end].nil?
      @options[:params].merge!({:reverse => 'true'}) if !@options[:history_reverse].nil? && @options[:history_reverse]
      EM.run do
        client = EM::Pubnub::Client.connect(@options)
      end
    end

    def here_now(options = {})
      merge_options(options, 'here_now')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)
      end
    end

    def time(options = {})
      merge_options(options, 'time')

      EM.run do
        client = EM::Pubnub::Client.connect(@options)
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
        :host          => @host,
        :operation     => operation,
        :params        => { :uuid => @session_uuid },
        :timetoken     => @timetoken
      }.merge(options)
    end

    def validate_client
      raise('subscribe_key is a mandatory parameter.') if @subscribe_key.to_s.size == 0
    end

    def generate_new_uuid
      UUID.new.generate
    end

  end
end

