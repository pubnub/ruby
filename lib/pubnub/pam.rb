# Toplevel Pubnub module.
module Pubnub
  # PAM module holds shared functionality for all PAM requests
  class PAM < SingleEvent
    def initialize(options, app)
      super

      @auth_key = options[:auth_key]

      @channel += format_channels(options[:presence]).map do |c|
        c + '-pnpres'
      end if options[:presence].present?
    end

    def signature
      message = [
        @subscribe_key,
        @publish_key,
        @event,
        variables_for_signature
      ].join("\n")

      # Replace ! ~ * ' ( )
      message = message.gsub(/[!~*'()]/) { |char| '%' + char.ord.to_s(16).upcase }

      Base64.urlsafe_encode64(
        OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'),
                             @secret_key.to_s, message)
      ).strip
    end

    def parameters(set_signature = false)
      params = super()
      params.merge!('channel-group' => @group.join(',')) unless @group.blank?
      params.merge!(timestamp: @timestamp)
      params.merge!(channel: @channel.join(',')) unless @channel.first.blank?
      params.merge!(signature: signature) unless set_signature
      params
    end

    def current_operation
      case @event
      when :audit
        Pubnub::Constants::OPERATION_AUDIT
      when :grant
        Pubnub::Constants::OPERATION_GRANT
      when :revoke
        Pubnub::Constants::OPERATION_REVOKE
      end
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

          data: parsed_response['payload']
        }
      )
    end

    def error_envelope(parsed_response, error, req_res_objects)
      ErrorEnvelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          category: (error ? Pubnub::Constants::STATUS_NON_JSON_RESPONSE : Pubnub::Constants::ERROR),
          error: true,
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

          data: {
            message: error_message(parsed_response)
          }
        }
      )
    end
  end
end
