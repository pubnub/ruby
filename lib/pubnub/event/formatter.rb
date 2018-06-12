# Toplevel Pubnub module.
module Pubnub
  # Event class lib/pubnub/event.rb
  class Event
    # Module that holds formatters for events
    module EFormatter
      def format_envelopes(response, request)
        if response.kind_of?(HTTPClient::TimeoutError) || response.is_a?(OpenSSL::SSL::SSLError)
          return error_envelope(nil, response, request: request, response: response)
        else
          parsed_response, error = Formatter.parse_json(response.body)
        end

        error = response if parsed_response && response.code.to_i != 200

        if error
          error_envelope(parsed_response, error, request: request, response: response)
        else
          valid_envelope(parsed_response, request: request, response: response)
        end
      end

      def format_channels
        @channel =  Formatter.format_channel(@channel || @channels)
        @channel += Formatter.format_presence_channel(@presence)
        @channel += Formatter.format_presence_channel(@channel || @channels) if @with_presence
        @wildcard_channel = @channel.select { |e| e.index('.*') } || []
      end

      def format_group
        @group = (@channel_group || @channel_groups) if (@channel_group || @channel_groups) && @group.blank?
        @group = Formatter.format_group(@group)

        if @group.first.to_s.count(':') > 0
          @namespace_id, @group_id = @group.first.to_s.split(':')
        else
          @namespace_id = nil
          @group_id = @group.first.to_s
        end
      end
    end
  end
end
