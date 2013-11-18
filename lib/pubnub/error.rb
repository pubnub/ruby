class Pubnub::Error < StandardError
  attr_reader :operation

  def initialize(options = {})
    @operation = options[:operation]
    @request   = options[:request]
  end

end