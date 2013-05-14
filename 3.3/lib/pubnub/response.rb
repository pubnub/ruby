class Pubnub::Response
  attr_reader :message, :channel, :timetoken, :status_code
  alias :msg :message

  def initialize(options = {})
    @message = options[:index] ? options[:response][0][options[:index]] : options[:response][0]
    @channel = options[:index] ? options[:response][2][options[:index]] : options[:channel]
    @timetoken = options[:response][1]
    @status_code = options[:http].response_header.status.to_i
    @headers = options[:http].response_header
    @response = options[:response]
  end
end