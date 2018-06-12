# Toplevel Pubnub module.
module Pubnub
  # Holds publish functionality
  class Publish < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::Publish

    attr_reader :store

    def initialize(options, app)
      @event = :publish
      @telemetry_name = :l_pub
      super
      @sequence_number = sequence_number!
      @origination_time_token = @app.generate_ortt

      case @store
      when false
        @store = 0
        @ttl = nil
      when true
        @store = 1
      end
    end

    def fire
      Pubnub.logger.debug('Pubnub::Publish') { "Fired event #{self.class}" }

      if @compressed
        compressed_body = Formatter.format_message(@message, @cipher_key, false)
        response = send_request(compressed_body)
      else
        response = send_request
      end

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    ensure
      terminate unless @stay_alive
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_PUBLISH
    end

    def parameters(*_args)
      params = super

      empty_if_blank = {
        store: @store,
        meta: @meta,
        ttl: @ttl
      }

      replication = @replicate == false ? { norep: true } : {}

      empty_if_blank.delete_if { |_k, v| v.blank? }

      params = params.merge(empty_if_blank)
      params = params.merge(replication)
      params = params.merge(seqn: @sequence_number,
                            ortt: { t: @origination_time_token })
      params
    end

    def path
      rpath = [
        'publish',
        @publish_key,
        @subscribe_key,
        '0',
        Formatter.format_channel(@channel, true),
        '0',
        Formatter.format_message(@message, @cipher_key)
      ]

      rpath.pop if @compressed

      '/' + rpath.join('/')
    end

    def sequence_number!
      @app.sequence_number_for_publish!
    end

    def timetoken(parsed_response)
      parsed_response[2]
    rescue
      nil
    end

    def response_message(parsed_response)
      parsed_response[1]
    rescue
      nil
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: timetoken(parsed_response),
        status: {
          code: req_res_objects[:response].code,
          operation: Pubnub::Constants::OPERATION_PUBLISH,
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
