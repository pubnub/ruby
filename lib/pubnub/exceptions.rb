module Pubnub
  class Error < StandardError
    attr_reader :operation, :request, :response, :env, :error, :message

    def initialize(options = {})
      if options.is_a? Hash
        @operation = options[:operation]
        @request   = options[:request]
        @env       = options[:env]
        @response  = options[:response]
        @error     = options[:error]
        @message   = options[:message]
      end

      @error = self unless @error

      log_error
    end

    def to_envelope
      Pubnub::Envelope.format_from_string_with_json(@response, :error, nil, @message, @error, @env)
    end

    private

    def log_error
      error_message = String.new
      error_message << "OPERATION: #{@operation}\n" if @operation
      error_message << "REQUEST: #{@request}\n"     if @request
      error_message << "ENV: #{env}\n"              if @env
      error_message << "RESPONSE: #{@response}\n"   if @response
      error_message << "ERROR TYPE: #{@error.class.to_s}\n"
      error_message << "ERROR MESSAGE: #{@message}\n"
      error_message << "ERROR BACKTRACE: #{@error.backtrace}"

      if $logger.blank?
        puts error_message
      else
        $logger.error(error_message)
      end
    end

  end

  class JSONParseError < Error; end
  class InitializationError < Error; end
  class ArgumentError < Error; end
  class RequestError < Error; end
  class ResponseError < Error; end

end