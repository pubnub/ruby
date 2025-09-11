# frozen_string_literal: true

module Pubnub
  # Holds functionality to fetch:
  # - batch messages (for multiple channels)
  # - messages with message actions.
  class FetchMessages < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::FetchMessages

    def initialize(options, app)
      @telemetry_name = :l_hist
      @include_custom_message_type = options.fetch(:include_custom_message_type, false)
      @include_message_actions = options.fetch(:include_message_actions, false)
      @include_message_type = options.fetch(:include_message_type, true)
      @encode_channels = options.fetch(:encode_channels, true)
      @include_uuid = options.fetch(:include_uuid, true)
      @include_meta = options.fetch(:include_meta, false)
      @start = options[:start] if options.key?(:start)
      @end = options[:end] if options.key?(:end)

      channel = options[:channel] if options.key?(:channel) && !options[:channel].empty?
      @channels = options[:channels] if options.key?(:channels) && !options[:channels].empty?
      if @include_message_actions
        @channel = channel
      elsif @channels.nil? && !channel.nil?
        @channels = [channel]
        @channel = nil
        options.delete :channel
      end

      maximum = @include_message_actions || @channels&.size == 1 ? 100 : 25
      @max = [options[:max], maximum].min unless options[:max].nil?

      @event = current_operation

      # Override crypto module if custom cipher key has been used.
      random_iv = options.key?(:random_iv) ? options[:random_iv] : true
      options[:crypto_module] = Crypto::CryptoModule.new_legacy(options[:cipher_key], random_iv) if options[:cipher_key]

      super
    end

    private

    def current_operation
      @include_message_actions ? Pubnub::Constants::OPERATION_FETCH_MESSAGES_WITH_ACTIONS : Pubnub::Constants::OPERATION_FETCH_MESSAGES
    end

    def parameters(signature = false)
      parameters = super(signature)
      parameters[:include_meta] = 'true' if @include_meta
      parameters[:include_uuid] = 'true' if @include_uuid
      parameters[:include_custom_message_type] = 'true' if @include_custom_message_type
      parameters[:include_message_type] = 'true' if @include_message_type
      parameters[:encode_channels] = 'false' if !@encode_channels && !@include_message_actions
      parameters[:start] = @start unless @start.nil?
      parameters[:end] = @end unless @end.nil?
      parameters[:max] = @max unless @max.nil?

      parameters
    end

    def path
      storage_endpoint = @include_message_actions ? 'history-with-actions' : 'history'
      "/v3/#{storage_endpoint}/sub-key/#{@subscribe_key}/channel/#{Pubnub::Formatter.channels_for_url((
                                                                                                        unless @channel.nil?
                                                                                                          [@channel]
                                                                                                        end) || @channels)}"
    end

    def enable_format_channels?
      false
    end

    def decrypt_history(crypto, message)
      encrypted_message = Base64.strict_decode64(message['message'])
      message['message'] = JSON.parse(crypto.decrypt(encrypted_message), quirks_mode: true)
      message
    rescue StandardError => e
      puts "Pubnub :: DECRYPTION ERROR: #{e}"
      message['decrypt_error'] = true
      message
    end

    def valid_envelope(parsed_response, req_res_objects)
      channels = parsed_response['channels'] unless parsed_response['error']
      more = parsed_response['more'].transform_keys(&:to_sym) if parsed_response.key?('more')
      more&.delete :url

      if crypto_module && channels
        crypto = crypto_module
        channels.transform_values! do |channel_messages|
          channel_messages.map(&method(:decrypt_history).curry[crypto])
        end
      end

      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          data: nil,
          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config
        },
        result: {
          code: req_res_objects[:response].code,
          operation: @event,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: { channels: channels }.merge!(more.nil? ? {} : { more: more })
        }
      )
    end
  end
end
