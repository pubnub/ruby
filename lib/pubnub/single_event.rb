# Toplevel Pubnub module
module Pubnub
  # SingleEvent module holds infrastructure for non-subscribe events
  module SingleEvent
    private

    def requester
      @app.requester(@origin, :single_event, @http_sync)
    end

    # Just stubs
    def finalize_event(_envelopes); end

    def path; end

    def timetoken(_parsed_response); end

    def response_message(_parsed_response); end

    def format_envelopes(_response); end

    def valid_envelope(_parsed_response); end

    def error_envelope(_parsed_response, _error); end
  end
end
