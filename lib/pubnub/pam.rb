module Pubnub
  module PAM
    def initialize(options, app)
      super
      if options[:presence].present?
        @channel += format_channels(options[:presence]).map { |c| c + '-pnpres' }
      end
      @auth_key = options[:auth_key]
    end

    def signature(app)
      channel = @original_channel.first
      message = "#{@subscribe_key}\n#{@publish_key}\n#{@event}\n#{variables_for_signature(app)}"
      Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), @secret_key.to_s, message)).strip
    end

    def parameters(app, signature = false)
      params = super(app)
      params.merge!({ :timestamp     => @timestamp })
      params.merge!({ 'channel-group' => @channel_group.join(',') }) unless @channel_group.blank?
      params.merge!({ :channel       => @channel.join(',') })       unless @channel.first.blank?
      params.merge!({ :signature     => signature(app) })           unless signature
      params
    end

    def variables_for_signature(app)
      parameters(app, true).map{|k,v|
        "#{k.to_s}=#{CGI.escape(v.to_s).gsub('+','%20')}"
      }.sort.join('&')
    end

    def current_time
      ::Time.now.to_i
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :parsed_response => parsed_response,
              :payload => (parsed_response['payload'] if parsed_response),
              :message => (parsed_response['message'] if parsed_response),
              :channel => (parsed_response['channel'] if parsed_response),
              :service => (parsed_response['service'] if parsed_response),
              :status  => (parsed_response['status']  if parsed_response)
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end
