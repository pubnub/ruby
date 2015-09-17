# Toplevel Pubnub module.
module Pubnub
  # Every error message from server is formatted into easy to use ErrorEnvelope
  # object, it behaves like normal Envelope, only difference is that it returns
  # true on error? method
  class ErrorEnvelope < Envelope
    def initialize(_env = {})
      super
      set_error_message
    end

    def error?
      true
    end

    private

    def set_error_message
      puts "\n\n#{@error.inspect}\n\n"
      @message = case @error.class.to_s
                   when 'JSON::ParserError'
                     '[0,"Invalid JSON in response."]'
                   when 'HTTP::Message'
                     if @error.status_code.to_i != 200
                       '[0,"Non 2xx server response."]'
                     else
                       '[0,"Unknown error"]'
                     end
                   else
                     '[0,"Unknown error"]'
                 end
    end
  end
end
