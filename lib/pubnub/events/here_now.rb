# Toplevel Pubnub module.
module Pubnub
  # Holds here_now functionality
  class HereNow < SingleEvent
    include Celluloid
    include Pubnub::Validator::HereNow

    def initialize(options, app)
      @event = :here_now
      @telemetry_name = :l_pres
      super
    end

    private

    def current_operation
      get_operation
    end

    def path
      if @channel.first.blank?
        global_path
      else
        channel_path
      end
    end

    def channel_path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        'channel',
        Formatter.channels_for_url(@channel)
      ].join('/')
    end

    def global_path
      '/' + [
        'v2',
        'presence',
        'sub-key',
        @subscribe_key,
        ('channel' unless @group.blank?),
        (',' unless @group.blank?)
      ].delete_if(&:nil?).join('/')
    end

    def parameters(*_args)
      parameters = super
      parameters.merge!(
        'channel-group' => @group.join(',')
      ) unless @group.blank?
      parameters
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event:           @event,
        event_options:   @given_options,

        result: {
          code: req_res_objects[:response].code,
          operation: get_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: {
            uuids: parsed_response['uuids'],
            occupancy: parsed_response['occupancy'],
            total_occupancy: (parsed_response['payload'] ? parsed_response['payload']['total_occupancy'] : nil),
            total_channels: (parsed_response['payload'] ? parsed_response['payload']['total_channels'] : nil),
            channels: (parsed_response['payload'] ? parsed_response['payload']['channels'] : nil)
          }
        },

        status: {
          code: req_res_objects[:response].code,
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

    def get_operation
      if @channel.empty? && @group.empty?
        Pubnub::Constants::OPERATION_GLOBAL_HERE_NOW
      else
        Pubnub::Constants::OPERATION_HERE_NOW
      end
    end
  end
end
