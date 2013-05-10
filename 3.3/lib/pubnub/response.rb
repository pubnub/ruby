class Pubnub::Response
  attr_reader :message, :channel, :timetoken
  alias :msg :message

  def initialize(options = {})
    @message = options[:message]
    @channel = options[:channel]
    @timetoken = options[:timetoken]
  end
end