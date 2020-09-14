# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds methods for formatting and parsing responses in subscribe_event
    module Formatter
      private

      def build_error_envelopes(_parsed_response, error, req_res_objects)
        [
          Pubnub::ErrorEnvelope.new(
            event: @event,
            event_options: @given_options,
            timetoken: nil,
            status: {
              code: req_res_objects[:response].code,
              operation: Pubnub::Constants::OPERATION_PUBLISH,
              client_request: req_res_objects[:request],
              server_response: req_res_objects[:response],
              data: nil,
              category: (error ? Pubnub::Constants::STATUS_NON_JSON_RESPONSE : Pubnub::Constants::STATUS_ERROR),
              error: true,
              auto_retried: false,

              current_timetoken: nil,
              last_timetoken: nil,
              subscribed_channels: nil,
              subscribed_channel_groups: nil,

              config: get_config
            }
          )
        ]
      end

      def decipher_payload(message)
        return message[:payload] if message[:channel].end_with?('-pnpres') || (@app.env[:cipher_key].nil? && @cipher_key.nil? && @cipher_key_selector.nil? && @env[:cipher_key_selector].nil?)
        cipher_key = compute_cipher_key(message.reject { |k, _v| k == :payload })
        crypto = Pubnub::Crypto.new(cipher_key)
        JSON.parse(crypto.decrypt(message[:payload]), quirks_mode: true)
      rescue StandardError
        message[:payload]
      end

      def build_non_error_envelopes(parsed_response, req_res_objects)
        Pubnub.logger.debug('Pubnub::SubscribeEvent::Formatter') { 'Formatting non-error envelopes' }
        timetoken = parsed_response['t']
        messages = expand_messages_keys(parsed_response['m'])

        # STATUS
        envelopes = if messages.empty?
                      [plain_envelope(req_res_objects, timetoken)]
                    else # RESULT
                      messages.map do |message|
                        encrypted_envelope(req_res_objects, message, timetoken)
                      end
                    end
        validate_envelopes(envelopes)
        envelopes
      end

      def plain_envelope(req_res_objects, timetoken)
        Pubnub::Envelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: expand_timetoken(timetoken),
          status: {
            code: req_res_objects[:response].code,
            client_request: req_res_objects[:request],
            server_response: req_res_objects[:response],
            data: nil,
            category: Pubnub::Constants::STATUS_ACK,
            error: false,
            auto_retried: true,

            current_timetoken: timetoken['t'].to_i,
            last_timetoken: @app.env[:timetoken].to_i,
            subscribed_channels: @app.subscribed_channels,
            subscribed_channel_groups: @app.subscribed_groups,

            config: get_config
          },
          result: {
            code: req_res_objects[:response].code,
            operation: get_operation,
            client_request: req_res_objects[:request],
            server_response: req_res_objects[:response],

            data: nil
          }
        )
      end

      def encrypted_envelope(req_res_objects, message, timetoken)
        Pubnub::Envelope.new(
          event: @event,
          event_options: @given_options,
          timetoken: expand_timetoken(timetoken),
          status: {
            code: req_res_objects[:response].code,
            client_request: req_res_objects[:request],
            server_response: req_res_objects[:response],
            data: message,
            category: Pubnub::Constants::STATUS_ACK,
            error: false,
            auto_retried: true,

            current_timetoken: timetoken['t'].to_i,
            last_timetoken: @app.env[:timetoken].to_i,
            subscribed_channels: @app.subscribed_channels,
            subscribed_channel_groups: @app.subscribed_groups,

            config: get_config
          },
          result: {
            code: req_res_objects[:response].code,
            operation: get_operation(message),
            client_request: req_res_objects[:request],
            server_response: req_res_objects[:response],

            data: {
              message: decipher_payload(message),
              subscribed_channel: message[:subscription_match] || message[:channel],
              actual_channel: message[:channel],
              publish_time_object: message[:publish_timetoken],
              message_meta_data: message[:user_meta_data],
              presence_event: get_presence_event(message),
              presence: get_presence_data(message)
            }
          }
        )
      end

      def validate_envelopes(envelopes)
        # return if envelopes.size == 1 && envelopes.first.timetoken_update?

        results_validation = envelopes.map(&:result).map do |result|
          Pubnub::Schemas::Envelope::ResultSchema.new.call result
        end

        statuses_validation = envelopes.map(&:status).map do |status|
          Pubnub::Schemas::Envelope::StatusSchema.new.call status
        end

        if (results_validation + statuses_validation).map(&:failure?).index(true)
          Pubnub.logger.error('Pubnub::SubscribeEvent::Formatter') { 'Invalid formatted envelope.' }
          raise Exception, 'Invalid formatted envelope.'
        end
      end

      def format_envelopes(response, request)
        if response.is_a?(StandardError)
          # unexpected error response
          raise response
        end

        parsed_response, error = Pubnub::Formatter.parse_json(response.body)

        error = response if parsed_response && response.code.to_i != 200

        if error
          build_error_envelopes(parsed_response, error, response: response, request: request)
        else
          build_non_error_envelopes(parsed_response, response: response, request: request)
        end
      end

      def get_operation(message = nil)
        if message.nil?
          Pubnub::Constants::OPERATION_TIME
        elsif message[:channel].to_s.index(/pnpres\z/)
          Pubnub::Constants::OPERATION_PRESENCE
        elsif message[:type] == 1
          Pubnub::Constants::OPERATION_SIGNAL
        elsif message[:type] == 2
          case message[:payload]['type']
          when 'user'
            case message[:payload]['event']
            when 'create'
              Pubnub::Constants::OPERATION_CREATE_USER
            when 'update'
              Pubnub::Constants::OPERATION_UPDATE_USER
            when 'delete'
              Pubnub::Constants::OPERATION_DELETE_USER
            else
              Pubnub.logger.error('Pubnub::SubscribeEvent::Formatter') { "Invalid event #{message[:payload]['event']}." }
              raise Exception, "Invalid event #{message[:payload]['event']}."
            end
          when 'space'
            case message[:payload]['event']
            when 'create'
              Pubnub::Constants::OPERATION_CREATE_SPACE
            when 'update'
              Pubnub::Constants::OPERATION_UPDATE_SPACE
            when 'delete'
              Pubnub::Constants::OPERATION_DELETE_SPACE
            else
              Pubnub.logger.error('Pubnub::SubscribeEvent::Formatter') { "Invalid event #{message[:payload]['event']}." }
              raise Exception, "Invalid event #{message[:payload]['event']}."
            end
          when 'membership'
            Pubnub::Constants::OPERATION_MANAGE_MEMBERSHIPS
          else
            Pubnub.logger.error('Pubnub::SubscribeEvent::Formatter') { "Invalid operation type #{message[:payload]['type']}." }
            raise Exception, "Invalid operation type #{message[:payload]['type']}."
          end

        else
          Pubnub::Constants::OPERATION_SUBSCRIBE
        end
      end

      def get_presence_data(message)
        return nil unless get_operation(message) == Pubnub::Constants::OPERATION_PRESENCE
        {
          uuid: message[:payload]['uuid'],
          timestamp: message[:payload]['timestamp'],
          state: message[:payload]['data'],
          occupancy: message[:payload]['occupancy']
        }
      end

      def get_presence_event(message)
        return nil unless get_operation(message) == Pubnub::Constants::OPERATION_PRESENCE
        message[:payload]['action']
      rescue StandardError
        nil
      end

      def expand_messages_keys(messages)
        messages.map do |m|
          {
            shard: m['a'],
            channel: m['c'],
            subscription_match: m['b'],
            payload: m['d'],
            type: m['e'],
            flags: m['f'],
            issuing_client_id: m['i'],
            subscribe_key: m['k'],
            sequence_number: m['s'],
            user_meta_data: m['u'],
            replication_map: m['r'],
            eat_after_reading: m['ear'],
            waypoint_list: m['w'],
            origination_time_token: expand_timetoken(m['o']),
            publish_timetoken: expand_timetoken(m['p'])
          }
        end
      end

      def expand_timetoken(timetoken)
        return nil unless timetoken
        {
          timetoken: timetoken['t'],
          region_code: timetoken['r']
        }
      end
    end
  end
end
