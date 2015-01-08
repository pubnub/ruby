# Toplevel Pubnub module
module Pubnub
  # SubscribeEvent module holds infrastructure for subscribe events.
  module SubscribeEvent
    attr_reader :heart

    def initialize(options, app)
      super
      @heartbeat = @app.env[:heartbeat]
      setup_cb_pools
      @channel.each do |channel|
        @c_cb_pool[channel] = @callback
        @e_cb_pool[channel] = @error_callback
      end
      @g_cb_pool[@group] = @callback if @group
    end

    def fire
      unless @finalized
        Pubnub.logger.debug('Pubnub') { "Fired event #{self.class}" }

        fire_heartbeat if @heartbeat && !@http_sync && !@heart

        message = send_request

        envelopes = fire_callbacks(handle(message))

        finalize_event(envelopes)

        async.fire unless @http_sync

        envelopes
      end
    end

    def add(event)
      Pubnub.logger.debug('Pubnub') { "#{self.class}#add" }
      kill_requester
      event.channel.each do |channel|
        add_channel channel
        add_cb channel, event.callback, event.error_callback
      end
      restart_heartbeat if @heart
    end

    def remove(event)
      Pubnub.logger.debug('Pubnub') { "#{self.class}#remove" }
      kill_requester
      event.channel.each do |channel|
        remove_channel channel
        remove_cb channel
      end

      if @channel.empty?
        finish
      else
        restart_heartbeat if @heart
      end
    end

    def leave_all
      Pubnub.logger.debug('Pubnub') { 'Leaving all subscriptions' }
      @channel.each do |channel|
        @app.leave(channel: channel, skip_restart: true, http_sync: true)
      end
      finish
    end

    private

    def fire_heartbeat
      Pubnub.logger.debug('Pubnub') { "#{self.class}#fire_heartbeat" }

      @heart = Heart.new(app: @app, heartbeat: @heartbeat, channel: @channel)
      @heart.async.start_beating
    end

    def stop_heartbeat
      Pubnub.logger.debug('Pubnub') { "#{self.class}#stop_heartbeat" }

      Celluloid::Actor.kill(@heart) if @heart
      @heart = nil
    end

    def restart_heartbeat
      stop_heartbeat
      fire_heartbeat
    end

    def send_request
      requester.send_request(Celluloid::Actor.current)
    end

    def finish
      Pubnub.logger.debug('Pubnub') { 'Stopping subscription' }
      stop_heartbeat if @heart
      kill_requester
      @finalized = true
      @app.env[:subscription_pool][@origin] = nil
      terminate
    end

    def remove_channel(channel)
      @channel.delete(channel)
    end

    def add_channel(channel)
      @channel << channel
    end

    def add_cb(channel, cb, e_cb)
      @c_cb_pool[channel]   = cb
      @e_cb_pool[channel] = e_cb
    end

    def remove_cb(channel)
      @c_cb_pool[channel]   = nil
      @e_cb_pool[channel] = nil
    end

    def setup_cb_pools
      @g_cb_pool ||= {} # group
      @c_cb_pool ||= {} # channel
      @e_cb_pool ||= {} # error
    end

    def requester
      @app.requester(@origin, :subscribe_event, @http_sync)
    end

    def kill_requester
      @app.kill_requester(@origin, :subscribe_event)
    end

    def fire_callbacks(envelopes)
      if @http_sync
        super
      else
        Pubnub.logger.debug('Pubnub') { "Firing callbacks for #{self.class}" }
        envelopes.each do |envelope|
          if !envelope.error && !envelope.message.nil?
            if envelope.group
              @g_cb_pool[envelope.group].call envelope
            else
              @c_cb_pool[envelope.channel].call envelope
            end
          elsif envelope.error
            if @e_cb_pool[envelope.channel]
              @e_cb_pool[envelope.channel].call(envelope)
            else
              @app.env[:error_callback].call(envelope)
            end
          end
        end
      end
      envelopes
    end

    def finalize_event(envelopes)
      @app.timetoken = envelopes.first.timetoken
    end

    def path
      '/' + [
        'subscribe',
        @subscribe_key,
        Formatter.channels_for_url(@channel),
        0,
        (@app.env[:timetoken] || 0)
      ].join('/').gsub(/\?/, '%3F')
    end

    def timetoken(parsed_response)
      parsed_response[1]
    rescue
      nil
    end

    def format_envelopes(response)
      parsed_response, error = Formatter.parse_json(response.body)

      error = response if parsed_response && response.code != '200'

      envelopes = if error
                    [error_envelope(parsed_response, error)]
                  else
                    format_non_error_envelopes(parsed_response)
                  end

      add_common_data_to_envelopes(envelopes, response)
    end

    def format_non_error_envelopes(parsed_response)
      case parsed_response.size
      when 2
        format_single_channel(parsed_response)
      when 3
        format_multiple_channels(parsed_response)
      when 4
        format_channel_group(parsed_response)
      end
    end

    def format_timetoken(parsed_response)
      Pubnub.logger.debug('Pubnub') { 'Formatting timetoken' }
      valid_envelope(parsed_response)
    end

    def format_single_channel(parsed_response)
      Pubnub.logger.debug('Pubnub') { 'Formatting single channel' }
      if parsed_response.first.size != 0
        parsed_response.first.map do |msg|
          valid_envelope(parsed_response, msg, @channel.first)
        end
      else
        [format_timetoken(parsed_response)]
      end
    end

    def format_multiple_channels(parsed_response)
      Pubnub.logger.debug('Pubnub') { 'Formatting multiple channel' }
      if parsed_response.last == ''
        [format_timetoken(parsed_response)]
      else
        envelopes = []
        parsed_response.first.size.times do |i|
          envelopes << valid_envelope(parsed_response,
                                      parsed_response.first[i],
                                      parsed_response.last.split(',')[i]
          )
        end
        envelopes
      end
    end

    def format_channel_group(parsed_response)
      Pubnub.logger.debug('Pubnub') { 'Formatting channel group' }
      envelopes = []
      parsed_response.first.size.times do |i|
        envelopes << valid_envelope(parsed_response,
                                    parsed_response[0][i],
                                    parsed_response[3].split(',')[i],
                                    parsed_response[2].split(',')[i]
        )
      end
      envelopes
    end

    def valid_envelope(parsed_response, msg = nil, channel = nil, group = nil)
      Envelope.new(
          parsed_response:  parsed_response,
          message:          msg,
          channel:          channel,
          group:            group,
          response_message: parsed_response,
          timetoken:        timetoken(parsed_response)
      )
    end

    def error_envelope(parsed_response, error)
      ErrorEnvelope.new(
          error:            error,
          response_message: parsed_response,
          message:          parsed_response,
          parsed_response:  parsed_response,
          channel:          @channel.first
      )
    end
  end
end
