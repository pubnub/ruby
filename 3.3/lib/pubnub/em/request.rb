module EventMachine
  module Pubnub
    class Request

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def to_s
        content = query

        data = []
        data << "#{request_method} #{request_uri} HTTP/1.1"
        data << "Host: #{@options[:host]}"

        #if gzip?
        #  data << 'Connection: Keep-Alive'
        #  data << 'Accept-Encoding: deflate, gzip'
        #else
          data << 'Accept: */*'
        #end

        data << "User-Agent: #{@options[:user_agent]}" if @options[:user_agent]
        if put_or_post?
          data << "Content-Type: #{@options[:content_type]}"
          data << "Content-Length: #{content.bytesize}"
        end

        @options[:headers].each do |name, value|
          data << "#{name}: #{value}"
        end unless @options[:headers].nil?

        data << "\r\n"
        data = data.join("\r\n")
        data << content if post? || put?
        puts data
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

      def query
        ''
      end

      def path
        puts @options[:path]
        @options[:path]
      end

    end
  end

end
