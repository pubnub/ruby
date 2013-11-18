module Pubnub
  class Error < StandardError
    attr_reader :operation, :request, :object, :response

    def initialize(options = {})
      unless options.is_a? Hash
        @operation = options[:operation]
        @request   = options[:request]
        @object    = options[:object]
        @response  = options[:response]
      end
      log_error
    end

    private

    def log_error
      $logger.error("#{self.class.to_s}") unless $logger.blank? # TODO create error nice error dump
    end

  end

  class InitializationError < Error; end
  class ArgumentError < Error; end
  class RequestError < Error; end

end