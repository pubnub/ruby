module Pubnub
  # Holds revoke token functionality
  class RevokeToken < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::RevokeToken

    def initialize(options, app)
      @event = :revoke_token
      super
      @token = @token.split(' ')
            .map{ |part| CGI.escape(part) }
            .join("%20")
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GRANT_TOKEN
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          data: nil,

          config: get_config

        },
        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: parsed_response['data']
        }
      )
    end


    def path
      '/' + [
        'v3',
        'pam',
        @subscribe_key,
        'grant',
        @token
      ].join('/')
    end
  end
end
