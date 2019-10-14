# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds CreateUser functionality
  class CreateUser < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::CreateUser

    def initialize(options, app)
      @event = :create_user
      @telemetry_name = :l_obj
      @data = options[:data]
      @include = options[:include]
      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::CreateUser') { "Fired event #{self.class}" }

      body = Formatter.format_message(@data, @cipher_key, false)
      response = send_request(body)

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_CREATE_USER
    end

    def parameters(*_args)
      parameters = super
      parameters[:include] = @include if @include
      parameters
    end

    def path
      '/' + [
        'v1',
        'objects',
        @subscribe_key,
        'users'
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_CREATE_USER,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: parsed_response
        },

        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_CREATE_USER,
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
