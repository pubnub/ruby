# Toplevel Pubnub module.
module Pubnub
  # Event class lib/pubnub/event.rb
  class Event
    # Module that holds signature computing code
    module Signature
      private

      def super_admin_signature
        return unless @app.env[:secret_key]

        message = [
          @app.env[:subscribe_key],
          @app.env[:publish_key],
          path,
          variables_for_signature.gsub(/[!~'()*]/) { |char| '%' + char.ord.to_s(16).upcase }, # Replace ! ~ * ' ( )
        ].join("\n")

        URI.encode_www_form_component(Base64.encode64(
          OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'),
                               @app.env[:secret_key].to_s, message)
        ).strip).gsub('+', '%20')
      end

      def variables_for_signature
        parameters(true).map do |k, v|
          if %w[meta ortt].include?(k.to_s)
            encoded_value = URI.encode_www_form_component(v.to_json).gsub('+', '%20')
            "#{k}=#{encoded_value}"
          elsif %w[t state filter-expr].include?(k.to_s)
            "#{k}=#{v}"
          else
            "#{k}=#{URI.encode_www_form_component(v.to_s).gsub('+', '%20')}"
          end
        end.sort.join('&')
      end
    end
  end
end
