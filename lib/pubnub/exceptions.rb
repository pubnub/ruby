module Pubnub
  class Error < StandardError
    attr_reader :operation, :request, :response, :env, :error, :message, :app, :event

    def initialize(options = {})
      if options.is_a? Hash
        @event     = options[:event]
        @operation = @event
        @request   = options[:request]
        @env       = options[:env]
        @response  = options[:response]
        @error     = options[:error]
        @message   = options[:message] unless options[:message].nil?
        @app       = options[:app]
      end

      @error = self unless @error

      log_error
    end

    private

    def log_error
      error_message = String.new
      error_message << "OPERATION: #{@operation}\n" if @operation
      error_message << "REQUEST: #{@request}\n"     if @request
      error_message << "ENV: #{@env}\n"             if @env
      error_message << "APP: #{@app}\n"             if @app
      error_message << "RESPONSE: #{@response}\n"   if @response
      error_message << "ERROR TYPE: #{@error.class.to_s}\n"
      error_message << "ERROR MESSAGE: #{@message}\n"
      error_message << "ERROR BACKTRACE: #{self.backtrace}"

      if Pubnub.logger.blank?
        puts error_message
      else
        Pubnub.logger.error(:pubnub){error_message}
      end
    end

  end

  class JSONParseError < Error; end
  class InitializationError < Error; end
  class ArgumentError < Error; end
  class RequestError < Error; end
  class ResponseError < Error; end

end