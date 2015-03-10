# Toplevel Pubnub module
module Pubnub
  # Bunch of useful methods that are used in many parts of Pubnub and and can be
  # usable for any app that uses Pubnub library
  module Formatter
    class << self
      # Returns array of encoded channels if should_encode is true,
      # otherwise returns just array of channels
      def format_channel(channel, should_encode = true)
        make_channel_array(channel).map do |chan|
          if should_encode
            encode(chan)
          else
            chan
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

      # Transforms message to json and encode it
      def format_message(message, cipher_key)
        if cipher_key
          pc = Pubnub::Crypto.new(cipher_key)
          message = pc.encrypt(message)
          URI.escape(message.to_json)
        else
          Formatter.encode(message.to_json)
        end
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
        when 'String' then channel.to_s.split(',')
        when 'Symbol' then channel.to_s.split(',')
        when 'Array' then channel.map(&:to_s)
        when 'NilClass' then []
        else fail Pubnub::ArgumentError.new(
                      message: 'Channel has to be String, Symbol or Array'
                  ), 'Channel has to be String, Symbol or Array'
        end
      end

      # Parses string to JSON
      def parse_json(string)
        [JSON.parse(string), nil]
      rescue JSON::ParserError => error
        [nil, error]
      end

      # Formats hash to params string
      def params_hash_to_url_params(hash)
        params = ''
        hash.each do |key, value|
          params << "#{key}=#{value}&"
        end
        params.chop! if params[-1] == '&'
      end

      # Returns string with all channels separated by comma or single coma
      def channels_for_url(channels)
        channel = channels.join(',')
        channel = ',' if channel.empty?
        channel
      end
    end
  end
end
