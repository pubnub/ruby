module Pubnub
  class Envelope
    def self.format_from_string_with_json(response_string, pubsub_operation, cipher_key = nil, msg = nil)
      envelopes = case pubsub_operation
                    when :subscribe
                      format_after_subscribe(response_string, cipher_key)
                    when :leave
                      format_after_leave(response_string)
                    when :publish
                      format_after_publish(response_string)
                    when :history
                      format_after_history(response_string)
                    when :here_now
                      format_after_here_now(response_string)
                    when :time
                      format_after_time(response_string)
                    when :error
                      format_after_error(response_string, msg)
                    else
                      # TODO rise error
                  end
      envelopes
    end

    attr_reader :message, :timetoken, :channel, :timetoken_update, :response, :error
    attr_reader :history_end, :history_start, :object

    alias_method 'msg', 'message'

    def initialize(options)
      @message   = options[:message]
      @timetoken = options[:timetoken]
      @channel   = options[:channel]
      @response  = options[:response]
      @object    = options[:object]

      # History specific values
      @history_start  = options[:history_start]
      @history_end    = options[:history_end]

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

    private

    # Object here is array containing 3 values
    # 1. Messages
    # 2. Timetoken
    # 3. Channels
    # First message is form first channel etc.
    #
    # The only exception from that is when we get only update with current timetoken
    def self.format_after_subscribe(response_string, cipher_key = nil)
      $logger.debug('Formatting envelopes after subscribe')
      object = Pubnub::Parser.parse_json(response_string)
      envelopes = []
      if object.size == 3 # That's when we are subscribed to more than one channel
        object[2].split(',').size.times do |i|
          envelopes << Pubnub::Envelope.new({
                                              :message   => decrypt(object[0][i], cipher_key),
                                              :response  => decrypt(response_string, cipher_key),
                                              :channel   => object[2][i],
                                              :timetoken => object[1].to_i
                                            })
        end
      elsif object.size == 2 && !object[0].empty? # That's when we are subscribed to one channel only
        [object[0]].flatten.size.times do |i|
          envelopes << Pubnub::Envelope.new({
                                                :message   => decrypt([object[0]].flatten[i], cipher_key),
                                                :response  => decrypt(response_string, cipher_key),
                                                :channel   => nil,            # nil channel is fixed as Pubnub::Subscription level
                                                :timetoken => object[1].to_i
                                            })
        end
      else # We have got only timetoken update
        envelopes = [
            Pubnub::Envelope.new({
                                    :timetoken        => object[1].to_i,
                                    :timetoken_update => true
                                })
        ]
      end
      $logger.debug("Formatted after subscribe:\n#{envelopes}")
      envelopes
    end

    # Returns Pubnub::Envelope object in array formatted after here_now operation
    # There's only message, nil channel (channel is set before firing callback or returning value)
    # and response, as raw server response string
    def self.format_after_here_now(response_string)
      object = Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                   :message => object,
                                   :channel => nil,
                                   :response => response_string
                               })
      ]
    end

    # Returns Pubnub::Envelope object in array formatted after leave operation
    # There's only message, nil channel (channel is set before firing callback or returning value)
    # and response, as raw server response string
    def self.format_after_leave(response_string)
      object = Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                   :message => object,
                                   :channel => nil,
                                   :response => response_string
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
    def self.format_after_history(response_string)
      $logger.debug('Formating envelopes after history')
      object = Pubnub::Parser.parse_json(response_string)
      envelopes = []
      object[0].each do |message|
        envelopes << Pubnub::Envelope.new({
                                              :message => message,
                                              :channel => nil,
                                              :response => response_string,
                                              :history_start => object[1],
                                              :history_end => object[2],
                                              :timetoken => object[2]
                                          })
      end
      envelopes
    end

    def self.format_after_publish(response_string)
      $logger.debug('Formatting envelopes after publish')
      object = Pubnub::Parser.parse_json(response_string)
      #if object.class == Pubnub::Envelope # Got error envelope at JSON parse stage
      #  [object]
      #else
        [
            Pubnub::Envelope.new({
                                     :message => object[1],
                                     :response => response_string,
                                     :timetoken => object[2]
                                 })
        ]
      #end
    end

    def self.format_after_time(response_string)
      object = Pubnub::Parser.Pubnub::Parser.parse_json(response_string)
      [
          Pubnub::Envelope.new({
                                    :message => object[0],
                                    :response => response_string,
                                    :timetoken => object[0]
                               })
      ]
    end

    def self.format_after_error(response_string, msg)
      object = Pubnub::Parser.parse_json(response_string)

      Pubnub::Envelope.new({
                               :message  => msg,
                               :object   => object,
                               :response => response_string,
                               :error    => true
                           })
    end

    def self.format_after_json_error(response_string, error)
      Pubnub::Envelope.new({
                               :message  => [0, 'Invalid JSON in response.'].to_json,
                               :response => response_string,
                               :error    => error
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