module Pubnub
  module SingleRequest
    def preform_single_request(options)
      if options[:http_sync]
        $logger.debug('preforming synchronized single request')
        single_request(options)
      else
        $logger.debug('preforming asynchronized single request')
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

      @timestamp = current_time
      response = fire_single_request(options)

      if (200..206).include?(response.status) && Pubnub::Parser.valid_json?(response.body)
        envelopes = format_envelopes(
            response,
            options[:action],
            options[:cipher_key]
        )

        envelopes = fix_empty_channels_non_subscribe(envelopes, options)

        envelopes.each_with_index { |envelope, i|
          envelope.first = true if i == 0
          envelope.last  = true if i == envelopes.size-1
          fire_callback_for_non_subscribe(envelope, options[:callback])
        }

      elsif !Pubnub::Parser.valid_json?(response.body)
        envelopes = Pubnub::JSONParseError.new(
            :response => response,
            :message => [0, 'Invalid JSON in response.'].to_json,
            :operation => options[:operation],
            :env => @env,
            :options => options
        ).to_envelope

        handle_error_response(envelopes)
      else
        envelopes = Pubnub::ResponseError.new(
            :message => [0, 'Non 2xx server response'].to_json,
            :response => response,
            :operation => options[:operation],
            :env => @env,
            :options => options
        ).to_envelope

        handle_error_response(envelopes)
      end

      envelopes
    end

    def preform_leave_event(options)
      @subscribed_channel_list[options[:origin]] -= [options[:channel].to_s] if @subscribed_channel_list
      @callback_list[options[:origin]].delete_if { |k,v| k.to_sym == options[:channel].to_sym } if @subscribed_channel_list
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
      response = @single_event_connections_pool[options[:origin]].get(path_for_event(options)) do |request|
        request.params                 = params_for_request(options)
        request.options[:timeout]      = options[:timeout] # open/read timeout in seconds
        request.options[:open_timeout] = options[:timeout] # connection open timeout in seconds
      end

      $logger.debug 'Got response'

      if Pubnub::Parser.valid_json?(response.body) || retry_attempts >= options[:max_retries]
        response
      else
        $logger.debug 'Retrying single request'
        fire_single_request(options, retry_attempts += 1)
      end
    end

    def params_for_request(options, generating_signature = false)
      # TODO: refactor to use if statements?
      vars = case options[:action]
        when :history
          {
            :start   => options[:start],
            :end     => options[:end],
            :reverse => options[:reverse],
            :count   => options[:count]
          }.delete_if{ |k, v| v.blank? }
        when :audit
          {
            :timestamp => @timestamp,
            :channel       => options[:channel],
            :auth          => options[:auth_key_parameter],
            :subscribe_key => options[:subscribe_key_parameter]
          }.delete_if{ |k, v| v.blank? }
        when :grant

          if options[:write] == true
            options[:write] = '1'
          elsif options[:write] == false
            options[:write] = '0'
          end

          if options[:read] == true
            options[:read] = '1'
          elsif options[:read] == false
            options[:read] = '0'
          end

          {
            :timestamp     => @timestamp,
            :channel       => options[:channel],
            :auth          => options[:auth_key_parameter],
            :w             => options[:write],
            :r             => options[:read],
            :ttl           => options[:ttl]
          }.delete_if{ |k, v| v.blank? }
        else
          { }
      end
      vars.merge!({ :uuid => options[:uuid] })                    if     options[:uuid]
      vars.merge!({ :auth => options[:auth_key] })                unless [:audit, :grant, :revoke].include?(options[:action])
      vars.merge!({ :pnsdk => "PubNub-Ruby/#{Pubnub::VERSION}" }) unless generating_signature
      if !generating_signature && [:audit, :grant].include?(options[:action])
        vars.merge!({ :signature => get_signature(options) })
      end
      vars
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
                     if !options[:auth_key].blank? then options[:secret_key] else '0' end,
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

               when :audit
                 '/' + [
                      'v1',
                      'auth',
                      'audit',
                      'sub-key',
                      options[:subscribe_key]
                 ].join('/')

               when :grant
                 '/' + [
                      'v1',
                      'auth',
                      'grant',
                      'sub-key',
                      options[:subscribe_key]
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

    def get_signature(options)
      $logger.debug 'Generating signature'
      options[:channel] = CGI.escape(options[:channel]).gsub('+','%20')
      @timestamp = current_time
      message = "#{options[:subscribe_key]}\n#{options[:publish_key]}\n#{options[:action]}\n#{variables_for_signature(options)}"
      Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha256'), options[:secret_key], message)).strip
    end

    def variables_for_signature(options)
      params_for_request(options, true).map{|k,v| "#{k.to_s}=#{v.to_s}"}.sort.join('&')
    end

    def current_time
      Time.now.to_i
    end

  end
end