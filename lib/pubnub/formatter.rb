require 'cgi'
require "addressable/uri"

# Toplevel Pubnub module.
module Pubnub
  # Bunch of useful methods that are used in many parts of Pubnub and and can be
  # usable for any app that uses Pubnub library
  module Formatter
    class << self
      # Returns array of encoded channels if should_encode is true,
      # otherwise returns just array of channels
      def format_channel(channel, should_encode = false)
        make_channel_array(channel).map do |chan|
          if should_encode
            encode(chan)
          else
            chan.to_s
          end
        end
      end

      def format_group(group, should_encode = true)
        format_channel(group, should_encode).map do |g|
          g.gsub '%3A', ':'
        end
      end

      def format_presence_channel(presence)
        format_channel(
          make_channel_array(presence).map { |p| p + '-pnpres' }
        )
      end

      def format_uuid(uuids, should_encode = true)
        make_uuid_array(uuids).map do |uuid|
          if should_encode
            encode(uuid)
          else
            uuid.to_s
          end
        end
      end

      # Transforms message to json and encode it.
      #
      # @param message [Hash, String, Integer, Boolean] Message data which
      #   should be formatted.
      # @param crypto [Crypto::CryptoProvider, nil] Crypto which should be used to
      #   encrypt message data.
      # @param uri_escape [Boolean, nil] Whether formatted message should escape
      #   to be used as part of URI or not.
      # @return [String, nil] Formatted message data.
      def format_message(message, crypto = nil, uri_escape = true)
        json_message = message.to_json
        if crypto
          encrypted_data = crypto&.encrypt(json_message)
          json_message = Base64.strict_encode64(encrypted_data).to_json unless encrypted_data.nil?
        end

        if uri_escape
          json_message = Formatter.encode(json_message) if crypto.nil?
          json_message = Addressable::URI.escape(json_message).to_s unless crypto.nil?
        end
        json_message
      end

      # Quite lazy way, but good enough for current usage
      def classify_method(method)
        method.split('_').map(&:capitalize).join
      end

      def encode(string)
        URI.encode_www_form_component(string).gsub('+', '%20')
      end

      def make_channel_array(channel)
        case channel.class.to_s
        when 'String'
          channel.to_s.split(',')
        when 'Symbol'
          channel.to_s.split(',')
        when 'Array'
          channel.map(&:to_s)
        when 'NilClass'
          []
        else
          raise Pubnub::ArgumentError.new(
            message: 'Channel has to be String, Symbol or Array'
          ), 'Channel has to be String, Symbol or Array'
        end
      end

      def make_uuid_array(uuid)
        case uuid.class.to_s
        when 'String'
          uuid.to_s.split(',')
        when 'Symbol'
          uuid.to_s.split(',')
        when 'Array'
          uuid.map(&:to_s)
        when 'NilClass'
          []
        else
          raise Pubnub::ArgumentError.new(
            message: 'UUID has to be String, Symbol or Array'
          ), 'UUID has to be String, Symbol or Array'
        end
      end

      # Parses string to JSON
      def parse_json(string)
        [JSON.parse(string), nil]
      rescue JSON::ParserError => _e
        [nil, JSON::ParserError]
      end

      # Formats hash to params string
      def params_hash_to_url_params(hash)
        params = ''
        hash.sort_by { |k, _v| k.to_s }.to_h.each do |key, value|
          if %w[meta ortt].include?(key.to_s)
            encoded_value = URI.encode_www_form_component(value.to_json).gsub('+', '%20')
            params << "#{key}=#{encoded_value}&"
          elsif %w[t state filter filter-expr].include?(key.to_s)
            params << "#{key}=#{value}&"
          else
            params << "#{key}=#{URI.encode_www_form_component(value).gsub('+', '%20')}&"
          end
        end
        params.chop! if params[-1] == '&'
      end

      # Returns string with all channels separated by comma or single coma
      def channels_for_url(channels, should_encode = true)
        channel = channels.map { |c| should_encode ? encode(c) : c }.join(',')
        channel = ',' if channel.empty?
        channel
      end

      # Checks if json in string is valid
      # def valid_json?(string)
      #   JSON.parse(string) ? true : false
      # rescue JSON::ParserError
      #   false
      # end
    end
  end
end
