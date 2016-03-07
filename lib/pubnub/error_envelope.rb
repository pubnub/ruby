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
      return if @parsed_response && @parsed_response.is_a?(Hash) && @parsed_response['message']
      @message = case @error.class.to_s
                 when 'JSON::ParserError'
                   'Invalid JSON in response.'
                 when 'HTTP::Message'
                   if @error.status_code.to_i != 200
                     'Non 2xx server response.'
                   else
                     'Unknown error'
                   end
                 else
                   'Unknown error'
                 end
    end
  end
end
