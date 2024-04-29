# Toplevel Pubnub module.
module Pubnub
  # Event class lib/pubnub/event.rb
  class Event
    # Module that holds signature computing code
    module Signature
      private

      def super_admin_signature(http_method, body)
        return unless @app.env[:secret_key]

        # Handle special case with publish operation signing when message sent as POST body.
        http_method = if http_method.upcase == "POST" && current_operation == Pubnub::Constants::OPERATION_PUBLISH
                        "GET"
                      else
                        http_method.upcase
                      end

        message = [
          http_method.upcase,
          @app.env[:publish_key],
          path,
          variables_for_signature.gsub(/[!~'()*]/) { |char| '%' + char.ord.to_s(16).upcase }, # Replace ! ~ * ' ( )
        ]

        if %w[POST PATCH].include?(http_method)
          message.push(body)
        else
          message.push('')
        end

        signature = URI.encode_www_form_component(Base64.encode64(
          OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'),
                               @app.env[:secret_key].to_s, message.join("\n"))
        ).strip.gsub(/\+/, '-').gsub(/\//, '_').gsub(/=+$/, ''))

        "v2.#{signature}"
      end

      def variables_for_signature
        unsorted_params = parameters(true)
        sorted_keys = unsorted_params.sort_by { |k, v| k.to_s }
        sorted_keys.map do |k, v|
          if %w[meta ortt filter].include?(k.to_s)
            value_for_encoding = v.is_a?(String) ? v : v.to_json
            encoded_value = URI.encode_www_form_component(value_for_encoding).gsub('+', '%20')
            "#{k}=#{encoded_value}"
          elsif %w[t state filter-expr sort].include?(k.to_s)
            "#{k}=#{v}"
          else
            "#{k}=#{URI.encode_www_form_component(v.to_s).gsub('+', '%20')}"
          end
        end.join('&')
      end
    end
  end
end
