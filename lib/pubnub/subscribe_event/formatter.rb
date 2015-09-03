# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds methods for formatting and parsing responses in subscribe_event
    module Formatter
      private

      def error_envelope(parsed_response, error)
        ErrorEnvelope.new(
            error: error,
            response_message: parsed_response,
            message: parsed_response,
            parsed_response: parsed_response,
            channel: @channel.first
        )
      end

      def valid_envelope(parsed_response, msg = nil, channel = nil, group = nil)
        if group && group.index('.*')
          wildcard_channel = group
          group = nil
        end

        Envelope.new(
            parsed_response: parsed_response,
            message: msg,
            channel: channel,
            group: group,
            wildcard_channel: wildcard_channel,
            response_message: parsed_response,
            timetoken: timetoken(parsed_response)
        )
      end

      def envelope_from_channel_group_or_wc(parsed_response, i)
        valid_envelope(parsed_response,
                       parsed_response[0][i],
                       parsed_response[3].split(',')[i],
                       parsed_response[2].split(',')[i])
      end

      def format_channel_group_or_wc(parsed_response)
        Pubnub.logger.debug('Pubnub') { 'Formatting channel group' }
        envelopes = []
        if parsed_response.first.empty? # timetoken update
          envelopes << format_timetoken(parsed_response)
        else
          parsed_response.first.size.times do |i|
            envelopes << envelope_from_channel_group_or_wc(parsed_response, i)
          end
        end
        envelopes
      end

      def envelope_from_multiple(parsed_response, i)
        valid_envelope(parsed_response,
                       parsed_response.first[i],
                       parsed_response.last.split(',')[i])
      end

      def format_multiple_channels(parsed_response)
        Pubnub.logger.debug('Pubnub') { 'Formatting multiple channel' }
        if parsed_response.last == ''
          [format_timetoken(parsed_response)]
        else
          envelopes = []
          parsed_response.first.size.times do |i|
            envelopes << envelope_from_multiple(parsed_response, i)
          end
          envelopes
        end
      end

      def format_single_channel(parsed_response)
        Pubnub.logger.debug('Pubnub') { 'Formatting single channel' }
        if parsed_response.first.size != 0
          parsed_response.first.map do |msg|
            valid_envelope(parsed_response, msg, @channel.first)
          end
        else
          [format_timetoken(parsed_response)]
        end
      end

      def format_timetoken(parsed_response)
        Pubnub.logger.debug('Pubnub') { 'Formatting timetoken' }
        valid_envelope(parsed_response)
      end

      def format_non_error_envelopes(parsed_response)
        case parsed_response.size
        when 2
          format_single_channel(parsed_response)
        when 3
          format_multiple_channels(parsed_response)
        when 4
          format_channel_group_or_wc(parsed_response)
        end
      end

      def format_envelopes(response)
        parsed_response, error = Pubnub::Formatter.parse_json(response.body)

        error = response if parsed_response && response.code != '200'

        envelopes = if error
                      [error_envelope(parsed_response, error)]
                    else
                      format_non_error_envelopes(parsed_response)
                    end

        add_common_data_to_envelopes(envelopes, response)
      end

      def timetoken(parsed_response)
        parsed_response[1]
      rescue
        nil
      end
    end
  end
end
