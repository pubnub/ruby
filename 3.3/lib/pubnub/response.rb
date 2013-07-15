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
      if options[:http].respond_to?(:body) && options[:http].respond_to?(:code) && options[:http].respond_to?(:message) && options[:http].respond_to?(:headers)
        httparty = true
      else
        httparty = false
      end

      if httparty
        case options[:operation]
          when 'publish'
            set_for_httparty(options)
          when 'subscribe'
            set_for_httparty(options)
          when 'presence'
            set_for_httparty(options)
          when 'history'
            set_for_httparty(options)
          when 'leave'
            set_for_httparty(options)
          when 'here_now'
            set_for_httparty(options)
          when 'time'
            set_for_httparty(options)
        end
      else # EM.http_request
        case options[:operation]
          when 'publish'
            set_for_em_http_request(options)
          when 'subscribe'
            set_for_em_http_request(options)
          when 'presence'
            set_for_em_http_request(options)
          when 'history'
            set_for_em_http_request(options)
          when 'leave'
            set_for_em_http_request(options)
          when 'here_now'
            set_for_em_http_request(options)
          when 'time'
            set_for_em_http_request(options)
        end
      end
    end
  end

  # Simple compare to other object basing on string representation of response
  # (see #to_s)
  def ==(other)
    @response == other.to_s
  end

  private

  def set_for_httparty(options)
    if options[:response][2] && options[:operation] == 'subscribe'
      @channel = options[:index] ? options[:response][2].split(',')[options[:index]] : options[:channel]
    else
      @channel = options[:channel]
    end

    if options[:operation] == 'publish'
      set_for_publish(options[:response][1],options[:response][2])
    elsif %w(here_now leave).include? options[:operation]
      @message = options[:response]
    else
      @timetoken = options[:response][1]
      @message = options[:index] ? options[:response][0][options[:index]] : options[:response][0]
    end

    @status_code = options[:http].response.code
    @headers = options[:http].headers.inspect
    @response = options[:http].body
  end

  def set_for_em_http_request(options)
    if options[:response][2] && options[:operation] == 'subscribe'
      @channel = options[:index] ? options[:response][2].split(',')[options[:index]] : options[:channel]
    else
      @channel = options[:channel]
    end

    if options[:operation] == 'publish'
      set_for_publish(options[:response][1],options[:response][2])
    elsif %w(here_now leave).include? options[:operation]
      @message = options[:response]
    else
      @timetoken = options[:response][1]
      @message = options[:index] ? options[:response][0][options[:index]] : options[:response][0]
    end

    @status_code = options[:http].response_header.status.to_i
    @headers = options[:http].response_header
    @response = options[:http].response
  end

  def set_for_publish(msg, timetoken)
    @message = msg
    @timetoken = timetoken
  end
end