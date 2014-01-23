module Pubnub
  class Envelope
    def self.format_from_string_with_json(response, pubsub_operation, cipher_key = nil, msg = nil, error = nil)
      envelopes = case pubsub_operation
                    when :subscribe
                      format_after_subscribe(response, cipher_key)
                    when :leave
                      format_after_leave(response)
                    when :publish
                      format_after_publish(response)
                    when :history
                      format_after_history(response)
                    when :here_now
                      format_after_here_now(response)
                    when :audit
                      format_after_audit(response)
                    when :grant
                      format_after_grant(response)
                    when :time
                      format_after_time(response)
                    when :error
                      format_after_error(response, msg, error)
                    else
                      raise "Don't know how to generate envelope for: #{pubsub_operation}"
                  end
      envelopes
    end

    attr_reader :last, :first, :message, :timetoken, :channel, :timetoken_update, :response, :error
    attr_reader :history_end, :history_start, :object, :response_object, :payload, :serviece

    attr_writer :last, :first

    alias_method 'msg', 'message'

    def initialize(options)
      @message          = options[:message]
      @timetoken        = options[:timetoken]
      @channel          = options[:channel]
      @response         = options[:response]
      @response_object  = options[:response_object]
      @object           = options[:object]

      # History specific values
      @history_start  = options[:history_start]
      @history_end    = options[:history_end]

      # Audit
      @payload = options[:payload]
      @service = options[:service]

      @timetoken_update = options[:timetoken_update]
      @error            = options[:error]
    end

    def have_message_without_channel?
      !@message.blank? && @channel.blank?
    end

    def set_channel(channel)
      @channel = channel
    end

    def timetoken_update?
      @timetoken_update
    end

    def update_message(msg)
      @message = msg
    end

    def is_error?
      @error ? true : false
    end

    def is_last?
      @last || @error ? true : false
    end

    def is_first?
      @first || @error ? true : false
    end

    private

    # Object here is array containing 3 values
    # 1. Messages
    # 2. Timetoken
    # 3. Channels
    # First message is form first channel etc.
    #
    # The only exception from that is when we get only update with current timetoken
    def self.format_after_subscribe(response, cipher_key = nil)
      $logger.debug('Formatting envelopes afffter subscribe')
      response_string = response.body
      object = Pubnub::Parser.parse_json(response_string)
      envelopes = []
      if object.size == 3 # That's when we are subscribed to more than one channel
        object[2].split(',').size.times do |i|
          envelopes << Pubnub::Envelope.new({
                                              :message         => decrypt(object[0][i], cipher_key),
                                              :response        => decrypt(response_string, cipher_key),
                                              :channel         => object[2][i],
                                              :timetoken       => object[1].to_i,
                                              :response_object => response
                                            })
        end
      elsif object.size == 2 && !object[0].empty? # That's when we are subscribed to one channel only
        [object[0]].flatten.size.times do |i|
          envelopes << Pubnub::Envelope.new({
                                                :message         => decrypt([object[0]].flatten[i], cipher_key),
                                                :response        => decrypt(response_string, cipher_key),
                                                :channel         => nil,            # nil channel is fixed as Pubnub::Subscription level
                                                :timetoken       => object[1].to_i,
                                                :response_object => response
                                            })
        end
      else # We have got only timetoken update
        envelopes = [
            Pubnub::Envelope.new({
                                    :timetoken        => object[1].to_i,
                                    :timetoken_update => true,
                                    :response_object  => response
                                })
        ]
      end
      $logger.debug("Formatted after subscribe:\n#{envelopes}")
      envelopes
    end

    # Returns Pubnub::Envelope object in array formatted after here_now operation
    # There's only message, nil channel (channel is set before firing callback or returning value)
    # and response, as raw server response string
    def self.format_after_here_now(response)
      response_string = response.body
      object = Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                   :message         => object,
                                   :channel         => nil,
                                   :response        => response_string,
                                   :response_object => response
                               })
      ]
    end

    # Returns Pubnub::Envelope object in array formatted after leave operation
    # There's only message, nil channel (channel is set before firing callback or returning value)
    # and response, as raw server response string
    def self.format_after_leave(response)
      response_string = response.body
      object = Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                   :message         => object,
                                   :channel         => nil,
                                   :response        => response_string,
                                   :response_object => response
                               })
      ]
    end

    # Returns Pubnub::Envelope objects in array formatted after history operation
    # Envelope holds:
    # * message
    # * channel set now to nil (it's set before callback),
    # * response, as raw server response string
    # * history_start, with timetoken when first message appears
    # * history_end, with timetoken when history ends
    # * timetoken, same as history_end
    def self.format_after_history(response)
      response_string = response.body
      $logger.debug('Formating envelopes after history')
      object = Pubnub::Parser.parse_json(response_string)
      envelopes = []
      object[0].each do |message|
        envelopes << Pubnub::Envelope.new({
                                              :message         => message,
                                              :channel         => nil,
                                              :response        => response_string,
                                              :history_start   => object[1],
                                              :history_end     => object[2],
                                              :timetoken       => object[2],
                                              :response_object => response
                                          })
      end
      envelopes
    end

    def self.format_after_publish(response)
      response_string = response.body
      $logger.debug('Formatting envelopes after publish')
      object = Pubnub::Parser.parse_json(response_string)
      #if object.class == Pubnub::Envelope # Got error envelope at JSON parse stage
      #  [object]
      #else
        [
            Pubnub::Envelope.new({
                                     :message         => object[1],
                                     :response        => response_string,
                                     :timetoken       => object[2],
                                     :response_object => response
                                 })
        ]
      #end
    end

    def self.format_after_audit(response)
      response_string = response.body
      $logger.debug('Formatting envelopes after audit')
      object = Pubnub::Parser.parse_json(response_string)
        [
            Pubnub::Envelope.new({
                                     :message         => object['message'],
                                     :response        => response_string,
                                     :service         => object['service'],
                                     :payload         => object['payload'],
                                     :response_object => response
                                 })
        ]
    end

    def self.format_after_grant(response)
      response_string = response.body
      $logger.debug('Formatting envelopes after grant')
      object = Pubnub::Parser.parse_json(response_string)
        [
            Pubnub::Envelope.new({
                                     :message         => object['message'],
                                     :response        => response_string,
                                     :service         => object['service'],
                                     :payload         => object['payload'],
                                     :response_object => response
                                 })
        ]
    end


    def self.format_after_time(response)
      response_string = response.body
      object = Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                    :message         => object[0],
                                    :response        => response_string,
                                    :timetoken       => object[0],
                                    :response_object => response
                               })
      ]
    end

    def self.format_after_error(response, msg, error = nil)
      response_string = response.body
      object = Pubnub::Parser.parse_json(response_string) unless response_string.blank?
      Pubnub::Envelope.new({
                               :message         => msg,
                               :object          => object,
                               :response        => response_string,
                               :error           => error,
                               :response_object => response
                           })
    end

    def self.format_after_json_error(response_string, error)
      Pubnub::Envelope.new({
                               :message         => [0, 'Invalid JSON in response.'].to_json,
                               :response        => response_string,
                               :error           => error,
                               :response_object => response_string
                           })
    end

    def self.decrypt(string, cipher_key)
      if cipher_key.blank?
        string
      else
        $logger.debug('Cipher_key not blank, decrypting message')
        crypto = Pubnub::Crypto.new(cipher_key)
        crypto.decrypt(string)
      end
    end

  end
end