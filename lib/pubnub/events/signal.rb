# frozen_string_literal: true

# Toplevel Pubnub module.
module Pubnub
  # Holds history functionality
  class Signal < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::Signal

    attr_reader :store

    def initialize(options, app)
      @event = :signal
      @telemetry_name = :l_sig
      super
      @sequence_number = sequence_number!
      @origination_time_token = @app.generate_ortt
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_SIGNAL
    end

    def parameters(*_args)
      params = super

      empty_if_blank = { custom_message_type: @custom_message_type }
      empty_if_blank.delete_if { |_k, v| v.blank? }

      params = params.merge(empty_if_blank)
      params = params.merge(seqn: @sequence_number,
                            ortt: { t: @origination_time_token })
      params
    end

    def path
      '/' + [
        'signal',
        @publish_key,
        @subscribe_key,
        '0',
        Formatter.format_channel(@channel, true),
        '0',
        Formatter.format_message(@message, @crypto_module)
      ].join('/')
    end

    def sequence_number!
      @app.sequence_number_for_publish!
    end

    def timetoken(parsed_response)
      parsed_response[2]
    rescue StandardError
      nil
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue StandardError
      nil
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: timetoken(parsed_response),
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_SIGNAL,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: nil,
          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config
        }
      )
    end
  end
end
