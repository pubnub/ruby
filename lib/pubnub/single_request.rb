module Pubnub
  module SingleRequest
    def perform_single_request(options)
      if options[:http_sync]
        $logger.debug('Performing synchronized single request')
        single_request(options)
      else
        $logger.debug('Performing asynchronized single request')
        EM.defer { single_request(options) }
      end
    end

    private

    def single_request(options)
      setup_connections(options)

      $logger.debug("Sending reqest to #{path_for_event(options)}")

      if options[:action] == :leave
        preform_leave_event(options)
      end

      response = fire_single_request(options)

      if (200..206).include?(response.status) && Pubnub::Parser.valid_json?(response.body)
        envelopes = format_envelopes(
            response.body,
            options[:action],
            options[:cipher_key]
        )

        envelopes = fix_empty_channels_non_subscribe(envelopes, options)

        envelopes.each { |envelope| fire_callback_for_non_subscribe(envelope, options[:callback]) }


      elsif !Pubnub::Parser.valid_json?(response.body)
        envelopes = format_envelopes(response.body, :error, nil, [0, 'Invalid JSON in response.'].to_json)

        handle_error_response(envelopes)
      else
        envelopes = format_envelopes(response.body, :error)

        handle_error_response(envelopes)
      end

      envelopes
    end

    def preform_leave_event(options)
      @subscribed_channel_list[options[:origin]] -= [options[:channel]]
      @callback_list[options[:origin]].delete_if { |k,v| k.to_sym == options[:channel].to_sym }
    end

    def fire_callback_for_non_subscribe(envelope, callback)
      callback.call(envelope) if callback
    end

    # Sets channel for envelope without channel
    # It happens when we're subscribed to one channel only
    def fix_empty_channels_non_subscribe(envelopes, options = nil)
      envelopes.each do |e|
        if e.have_message_without_channel?
          e.set_channel options[:channel]
        end
      end

      envelopes
    end

    def format_envelopes(response, pubsub_operation, cipher_key = nil, msg = nil)
      Pubnub::Envelope.format_from_string_with_json(response, pubsub_operation, cipher_key, msg)
    end

    def fire_single_request(options, retry_attempts = 0)
      response = @single_event_connections_pool[options[:origin]].get(
          path_for_event(options),
          variables_for_request(options)
      ) do |request|
        request.options[:timeout]      = options[:timeout] # open/read timeout in seconds
        request.options[:open_timeout] = options[:timeout] # connection open timeout in seconds
      end

      if Pubnub::Parser.valid_json?(response.body) || retry_attempts >= options[:max_retries]
        response
      else
        $logger.debug 'Retrying single request'
        fire_single_request(options, retry_attempts += 1)
      end
    end

    def variables_for_request(options)
      vars = case options[:action]
        when :history
          {
            :start   => options[:start],
            :end     => options[:end],
            :reverse => options[:reverse],
            :count   => options[:count]
          }.delete_if{ |k, v| v.blank? }
        else
          { }
      end
      vars.merge({ :uuid => options[:uuid] }) if options[:uuid]
    end

    def path_for_event(options)
      path = case options[:action]
               when :leave
                 '/' + [
                     'v2',
                     'presence',
                     'sub-key',
                     options[:subscribe_key],
                     'channel',
                     options[:channel],
                     'leave'
                 ].join('/')

               when :presence
                 '/' + [
                     'v2',
                     'presence',
                     'sub-key',
                     options[:subscribe_key],
                     'channel',
                     options[:channel]
                 ].join('/')

               when :publish
                 '/' + [
                     'publish',
                     options[:publish_key],
                     options[:subscribe_key],
                     generate_secret_key(@env, options[:secret_key]),
                     options[:channel],
                     '0',
                     format_message_for_publish(options)
                 ].join('/')

               when :history
                 '/' + [
                     'v2',
                     'history',
                     'sub-key',
                     options[:subscribe_key],
                     'channel',
                     options[:channel]
                 ].join('/')

               when :here_now
                 '/' + [
                     'v2',
                     'presence',
                     'sub-key',
                     options[:subscribe_key],
                     'channel',
                     options[:channel]
                 ].join('/')

               when :time
                 '/time/0'
               else
                 # TODO: rise error
             end

      escape_path(path)
    end

    def escape_path(path)
      $logger.debug('Escaping path')
      URI.escape(path).gsub(/\?/,'%3F')
    end

    def format_message_for_publish(options)
      $logger.debug('Formatting message for publish')
      if options[:cipher_key]
        pc = Pubnub::Crypto.new(options[:cipher_key])
        message = pc.encrypt(options[:message])
      else
        message = options[:message]
      end
      message.to_json
    end

    def generate_secret_key(options, self_secret_key)
      if self_secret_key != options[:secret_key]
        raise("existing secret_key #{self_secret_key} cannot be overridden at publish-time.")

      elsif !self_secret_key.blank?

        my_secret_key = self_secret_key || options[:secret_key]
        raise('secret key must be a string.') if my_secret_key.class != String

        signature = '{ @publish_key, @subscribe_key, @secret_key, channel, message}'
        digest    = OpenSSL::Digest.new('sha256')
        key       = [my_secret_key]
        hmac      = OpenSSL::HMAC.hexdigest(digest, key.pack('H*'), signature)
        @secret_key = hmac
      else
        @secret_key = '0'
      end
    end

  end
end