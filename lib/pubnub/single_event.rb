# Toplevel Pubnub module.
module Pubnub
  # SingleEvent module holds infrastructure for non-subscribe events
  class SingleEvent < Event
    private

    def request_dispatcher
      Pubnub.logger.debug('Pubnub::SingleEvent') { '#request_dispatcher called' }
      @app.request_dispatcher(@origin, :single_event, @http_sync)
    end

    # Just stubs
    def finalize_event(_envelopes); end

    def path; end

    def timetoken(_parsed_response); end

    def response_message(_parsed_response); end

    def valid_envelope(_parsed_response); end
  end
end
