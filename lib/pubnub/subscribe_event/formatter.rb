# Toplevel Pubnub module.
module Pubnub
  class SubscribeEvent < Event
    # Holds methods for formatting and parsing responses in subscribe_event
    module Formatter
      private

      def build_error_envelopes(parsed_response, error)
        ErrorEnvelope.new(
          event: @event,
          event_options: @given_options,
          error: error,
          response_message: parsed_response,
          message: parsed_response,
          parsed_response: parsed_response,
          channel: @channel.first
        )
      end

      def build_non_error_envelopes(parsed_response, req_res_objects)
        Pubnub.logger.debug('Pubnub::SubscribeEvent::Formatter') { 'Formatting non-errror envelopes' }
        timetoken = parsed_response['t']
        messages  = expand_messages_keys(parsed_response['m'])

        # STATUS
        if messages.empty?
          envelopes = [
              Envelope.new(
                  event:         @event,
                  event_options: @given_options,
                  timetoken:     expand_timetoken(timetoken),
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
          ]
        else # RESULT
          envelopes = messages.map do |message|
            Envelope.new(
              event:         @event,
              event_options: @given_options,
              timetoken:     expand_timetoken(timetoken),
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
                      message: message[:payload],
                      subscribed_channel: message[:subscription_match],
                      actual_channel: message[:channel],
                      publish_time_object: message[:publish_timetoken],
                      message_meta_data: message[:user_meta_data],
                      presence_event: get_presence_event(message),
                      presence: get_presence_data(message)
                  }
              }
          )
          end
        end

        validate_envelopes(envelopes)

        envelopes
      end

      def validate_envelopes(envelopes)
        # return if envelopes.size == 1 && envelopes.first.timetoken_update?

        results_validation = envelopes.map(&:result).map do |result|
          Pubnub::Schemas::Envelope::ResultSchema.call result
        end

        statuses_validation = envelopes.map(&:status).map do |status|
          Pubnub::Schemas::Envelope::StatusSchema.call status
        end

        if (results_validation + statuses_validation).map(&:failure?).index(true)
          Pubnub.logger.error('Pubnub::SubscribeEvent::Formatter') { 'Invalid formatted envelope.' }
          raise Exception, 'Invalid formatted envelope.'
        end
      end

      def get_config
        {
            tls:      @app.env[:ssl],
            uuid:     @app.env[:uuid],
            auth_key: @app.env[:auth_key],
            origin:   @app.current_origin
        }
      end

      def format_envelopes(response, request)
        parsed_response, error = Pubnub::Formatter.parse_json(response.body)

        error = response if parsed_response && response.code.to_i != 200

        if error
          build_error_envelopes(parsed_response, error)
        else
          build_non_error_envelopes(parsed_response, {response: response, request: request})
        end
      end

      def get_operation(message = nil)
        if message == nil
          Pubnub::Constants::OPERATION_TIME
        elsif message[:channel].to_s.index(/pnpres\z/)
          Pubnub::Constants::OPERATION_PRESENCE
        else
          Pubnub::Constants::OPERATION_SUBSCRIBE
        end
      end

      def get_presence_data(message)
        return nil unless get_operation(message) == Pubnub::Constants::OPERATION_PRESENCE
        {
            uuid:      message[:payload]['uuid'],
            timestamp: message[:payload]['timestamp'],
            state:     message[:payload]['data'],
            occupancy: message[:payload]['occupancy']
        }
      end

      def get_presence_event(message)
        return nil unless get_operation(message) == Pubnub::Constants::OPERATION_PRESENCE
        message[:payload]['action']
      rescue
        nil
      end

      def expand_messages_keys(messages)
        messages.map do |m|
          {
              shard:                  m['a'],
              channel:                m['c'],
              subscription_match:     m['b'],
              payload:                m['d'],
              flags:                  m['f'],
              issuing_client_id:      m['i'],
              subscribe_key:          m['k'],
              sequence_number:        m['s'],
              user_meta_data:         m['u'],
              replication_map:        m['r'],
              eat_after_reading:      m['ear'],
              waypoint_list:          m['w'],
              origination_time_token: expand_timetoken(m['o']),
              publish_timetoken:      expand_timetoken(m['p'])
          }
        end
      end

      def expand_timetoken(timetoken)
        return nil unless timetoken
        {
            timetoken:   timetoken['t'],
            region_code: timetoken['r']
        }
      end
    end
  end
end
