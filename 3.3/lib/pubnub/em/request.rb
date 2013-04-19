require 'uri'
require 'yajl'

module EventMachine
  module Pubnub
    class Request

      def initialize(options = {})
        @options = {
          :host => ORIGIN_HOST,
          :request_method => 'GET'
        }.merge(options)

      end

      def to_s
        content = query

        data = []
        data << "#{@options[:request_method]} #{request_uri} HTTP/1.1"
        data << "Host: #{@options[:host]}"
        #if gzip?
        #  data << 'Connection: Keep-Alive'
        #  data << 'Accept-Encoding: deflate, gzip'
        #else
          data << 'Accept: */*'
        #end

        data << "User-Agent: Ruby"
        if put_or_post?
          data << "Content-Type: #{@options[:content_type]}; charset=US-ASCII"
          data << "Content-Length: #{content.bytesize}"
        end

        @options[:headers].each do |name, value|
          data << "#{name}: #{value}"
        end unless @options[:headers].nil?

        data << "\r\n"
        data = data.join("\r\n")
        data << content if post? || put?

        puts "\n\n #{data} \n\n"

        data
      end

      private

      def get?
        request_method == 'GET'
      end

      def post?
        request_method == 'POST'
      end

      def put?
        request_method == 'PUT'
      end

      def put_or_post?
        put? || post?
      end


      def request_method
        @options[:method].to_s.upcase
      end

      def request_uri
        path
      end

      def params
        flat = {}
        @options[:params].each do |param,val|
          next if val.to_s.empty?
          flat[param.to_s] = val.to_s
        end
        flat
      end

      def query
        params.map do |param, value|
          [param, value].join('=')
        end.sort.join('&')
      end

      def path
        #@options[:ssl] ? origin = "https://" : origin = "http://"
        #if @options[:origin]
        #  origin << @options[:origin]
        #else
        #  origin << ORIGIN_HOST
        #end

        url = encode_url(case @options[:operation]
                    when 'publish'
                      [
                        @options[:operation],
                        @options[:publish_key],
                        @options[:subscribe_key],
                        @options[:secret_key],
                        @options[:channel],
                        '0',
                        @options[:message].to_json
                      ]
                    when 'subscribe'
                      [
                        @options[:operation],
                        @options[:subscribe_key],
                        @options[:channel],
                        '0',
                        @options[:timetoken]
                      ]
                    when 'presence'
                      [
                        'subscribe',
                        @options[:subscribe_key],
                        @options[:channel].to_s + '-pnpres',
                        '0',
                        @options[:timetoken]
                      ]
                    when 'time'
                      [
                        @options[:operation],
                        '0'
                      ]
                    when 'history'
                      [
                        @options[:operation],
                        @options[:subscribe_key],
                        @options[:channel],
                        '0',
                        @options[:history_limit]
                      ]
                    when 'detailed_history'
                      [
                        'v2',
                        'history',
                        'sub-key',
                        @options[:subscribe_key],
                        'channel',
                        @options[:channel]
                      ]
                    when 'here_now'
                      [
                        'v2',
                        'presence',
                        'sub-key',
                        @options[:subscribe_key],
                        'channel',
                        @options[:channel]
                      ]
                    else
                      raise("I can't create that URL for you due to unknown operation type.")
                    end
        )

        url = url + "?#{query}" unless query.empty?

        url

      end

      def encode_url(request)
        '/' + request.map { |bit| bit.to_s.split('').map { |ch|
            ' ~`!@#$%^&*()+=[]\\{}|;\':",./<>?'.index(ch) ?
            '%' + ch.unpack('H2')[0].to_s.upcase : URI.encode(ch)
          }.join('')
        }.reject(&:empty?).join('/')
      end
    end
  end
end

