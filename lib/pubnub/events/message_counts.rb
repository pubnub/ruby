# Toplevel Pubnub module.
module Pubnub
  # Holds history functionality
  class MessageCounts < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::MessageCounts

    def initialize(options, app)
      @event = :message_counts
      @telemetry_name = :l_mc
      @timetokens = parse_timetokens options[:channel_timetokens] || []
      super
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_MESSAGE_COUNTS
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue StandardError
      nil
    end

    def path
      '/' + [
        'v3',
        'history',
        'sub-key',
        @subscribe_key,
        'message-counts',
        Formatter.channels_for_url(@channel)
      ].join('/')
    end

    def parameters(*_args)
      params = super
      if @timetokens.length == 1
        params[:timetoken] = @timetokens.first
      elsif @timetokens.length > 1
        params[:channelTimetokens] = @timetokens.join(',')
      end
      params
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

          data: nil,
          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config
        },
        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response
        }
      )
    end

    def parse_timetokens(timetokens)
      timetokens ||= []
      if timetokens.is_a? String
        timetokens = timetokens.split(/\s*,\s*/)
      elsif timetokens.is_a? Integer
        timetokens = [timetokens]
      end
      timetokens.map(&:to_i)
    end
  end
end
