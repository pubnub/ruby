class Pubnub::Response
  attr_reader :message, :channel, :timetoken, :status_code, :response
  alias :msg :message

  # Creates Pubnub::Response object based on options hash
  #
  # Sets @message, @channel, @timetoken, @status_code, :response attributes
  # @message contains usable single message for callback
  # @channel contains channel which was used in request
  # @timetoken contains server timetoken
  # @status_code contains status code of server response
  # @response contains whole server response body which was used to build that Pubnub::Response
  # @headers contains whole server response headers
  #
  # To properly init new response object it need :http, :response, :channel options
  # While you pass :index option it will treat :response as array which size is greater than one
  # In case you want create your custom error response, you have to pass :error_init option with true value and :message with your message
  def initialize(options = {})
    if options[:error_init]
      @message = options[:message]
      @response = options[:message]
      @timetoken = 0
    else
      if options[:http].respond_to?(:body) && options[:http].respond_to?(:code) && options[:http].respond_to?(:message) && options[:http].respond_to?(:headers) # httparty
        @message = options[:response]
        @timetoken = options[:response]
        @status_code = options[:http].response.code
        @headers = options[:http].headers.inspect
      else
        @message = options[:index] ? options[:response][0][options[:index]] : options[:response][0]
        if options[:response][2]
          @channel = options[:index] ? options[:response][2][options[:index]] : options[:channel]
        else
          @channel = options[:channel]
        end
        @timetoken = options[:response][1]
        @status_code = options[:http].response_header.status.to_i
        @headers = options[:http].response_header
      end

      if options[:http].respond_to?(:body) && options[:http].respond_to?(:code) && options[:http].respond_to?(:message) && options[:http].respond_to?(:headers) # httparty
        @response = options[:http].body
      else
        @response = options[:http].response
      end
    end
  end

  # Simple compare to other object basing on string representation of response
  # (see #to_s)
  def ==(other)
    @response == other.to_s
  end

  ## Returns @response.to_s
  #def to_s
  #  ap self
  #end
end