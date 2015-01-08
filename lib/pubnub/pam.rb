# Toplevel Pubnub module
module Pubnub
  # PAM module holds shared functionality for all PAM requests
  module PAM
    def initialize(options, app)
      super
      if options[:presence].present?
        @channel += format_channels(options[:presence]).map do |c|
          c + '-pnpres'
        end
      end
    end

    def signature
      message = [
        @subscribe_key,
        @publish_key,
        @event,
        variables_for_signature
      ].join("\n")
      Base64.urlsafe_encode64(
          OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'),
                               @secret_key.to_s, message)
      ).strip
    end

    def parameters(set_signature = false)
      params = super()

      unless @group.blank?
        params.merge!('channel-group' => @group.join(','))
      end

      params.merge!(timestamp: @timestamp)
      params.merge!(channel:   @channel.join(',')) unless @channel.first.blank?
      params.merge!(signature: signature)          unless set_signature
      params
    end

    def variables_for_signature
      parameters(true).map do|k, v|
        "#{k}=#{CGI.escape(v.to_s).gsub('+', '%20')}"
      end.sort.join('&')
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code != '200'

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    [valid_envelope(parsed_response)]
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def valid_envelope(parsed_response)
      Envelope.new(
          parsed_response: parsed_response,
          payload:         parsed_response['payload'],
          service:         parsed_response['service'],
          message:         parsed_response['message'],
          status:          parsed_response['status'],
          uuids:           parsed_response['uuids']
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: response_message(parsed_response),
          channel:          @channel.first,
          timetoken:        timetoken(parsed_response)
      )
    end
  end
end
