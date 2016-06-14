# Toplevel Pubnub module.
module Pubnub
  # Holds publish functionality
  class Publish < SingleEvent
    include Celluloid
    include Pubnub::Validator::Publish

    attr_reader :store

    def initialize(options, app)
      @event = :publish
      super
      @sequence_number = nil
      @store = case @store
               when false
                 0
               when true
                 1
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
      # sender.terminate if @http_sync
      terminate unless @stay_alive
    end

    private

    def parameters
      @sequence_number        = sequence_number!
      @origination_time_token = @app.generate_ortt

      empty_if_blank = {
        store: @store,
        meta: @meta
      }

      replication = @replicate == false ? { norep: true } : {}

      empty_if_blank.delete_if { |_k, v| v.blank? }
      params = {}
      params = params.merge(empty_if_blank)
      params = params.merge(replication)
      params = params.merge(seqn: @sequence_number,
                            ortt: Formatter.encode({ t: @origination_time_token }.to_json))
      super.merge(params)
    end

    def path
      rpath = [
        'publish',
        @publish_key,
        @subscribe_key,
        '0',
        @channel,
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

    def format_envelopes(response, request)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

      if error
        error_envelope(parsed_response, error, request: request, response: response)
      else
        valid_envelope(parsed_response, request: request, response: response)
                  end
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
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

    def error_envelope(_parsed_response, error, req_res_objects)
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
    end
  end
end
