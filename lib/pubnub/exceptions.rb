module Pubnub
  class Error < StandardError
    attr_reader :operation, :request, :object, :message

    def initialize(options = {})
      @message   = message
      @operation = options[:operation]
      @request   = options[:request]
      @object    = options[:object]
      @response  = options[:response]
      log_error
    end

    private

    def log_error
      $logger.error("#{self.class.to_s}") unless $logger.blank? # TODO create error nice error dump
    end

  end

  class InitializeError < Error; end
  class RequestError < Error; end

end