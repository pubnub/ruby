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
      @store = case @store
               when false
                 0
               when true
                 1
               end
    end

    def fire
      Pubnub.logger.debug('Pubnub::Publish') { "Fired event #{self.class}" }

      sender = request_dispatcher

      if @compressed
        compressed_body = Formatter.format_message(@message, @cipher_key, false)

        message = sender.post(uri.to_s, body: compressed_body)
      else
        message = sender.get(uri.to_s)
      end

      envelopes = fire_callbacks(handle(message))
      finalize_event(envelopes)
      envelopes
    ensure
      # sender.terminate if @http_sync
      terminate unless @stay_alive
    end

    private

    def parameters
      empty_if_blank = {
        store: @store
      }

      empty_if_blank.delete_if { |_k, v| v.blank? }

      super.merge(empty_if_blank)
    end

    def path
      rpath = [
        'publish',
        @publish_key,
        @subscribe_key,
        (@auth_key.blank? ? '0' : @secret_key),
        @channel,
        '0',
        Formatter.format_message(@message, @cipher_key)
      ]

      rpath.pop if @compressed

      '/' + rpath.join('/')
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

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code.to_i != 200

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    [valid_envelope(parsed_response)]
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def valid_envelope(parsed_response)
      Envelope.new(
        parsed_response:  parsed_response,
        message:          @message,
        channel:          @channel.first,
        response_message: response_message(parsed_response),
        timetoken:        timetoken(parsed_response)
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
        error:            error,
        response_message: response_message(parsed_response),
        channel:          @channel.first,
        timetoken:        timetoken(parsed_response)
      )
    end
  end
end
