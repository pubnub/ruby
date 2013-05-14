class Pubnub::Response
  attr_reader :message, :channel, :timetoken
  alias :msg :message

  def initialize(response, index = nil)
    puts "response = #{response}"
  end
end