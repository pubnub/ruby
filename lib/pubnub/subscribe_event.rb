require File.expand_path(File.dirname(__FILE__) + '/subscribe_event/adding.rb')
module Pubnub
  # SubscribeEvent module holds infrastructure for subscribe events.
  class SubscribeEvent < Event
    include Adding
    include Removing
    include Heartbeat
    include Formatter
    attr_reader :heart

    def initialize(options, app)
      super
      @heartbeat = @app.env[:heartbeat]
      setup_cb_pools
      @channel.each do |channel|
        @c_cb_pool[channel] = @callback
        @e_cb_pool[channel] = @error_callback
      end

      @group.each do |group|
        @g_cb_pool[group] = @callback
      end
    end

    def fire
      return false if @finalized

      Pubnub.logger.debug('Pubnub') { "Fired event #{self.class}" }

      fire_heartbeat if @heartbeat && !@http_sync && !@heart

      message = send_request

      envelopes = fire_callbacks(handle(message))

      finalize_event(envelopes)

      async.fire unless @http_sync

      envelopes
    end

    def leave_all
      Pubnub.logger.debug('Pubnub') { 'Leaving all subscriptions' }
      @channel.each do |channel|
        @app.leave(channel: channel, skip_restart: true, http_sync: true)
      end
      finish
    end

    private

    def send_request
      request_dispatcher.send_request(Celluloid::Actor.current)
    end

    def setup_cb_pools
      @g_cb_pool ||= {} # group
      @c_cb_pool ||= {} # channel
      @e_cb_pool ||= {} # error
    end

    def request_dispatcher
      @app.request_dispatcher(@origin, :subscribe_event, @http_sync)
    end

    def fire_callbacks(envelopes)
      if @http_sync
        super
      else
        Pubnub.logger.debug('Pubnub') { "Firing callbacks for #{self.class}" }
        fire_async_callbacks(envelopes)
      end
      envelopes
    end

    def fire_async_callbacks(envelopes)
      envelopes.each do |envelope|
        if !envelope.error && !envelope.message.nil?
          fire_success_callback envelope
        elsif envelope.error
          fire_error_callback envelope
        end
      end
    end

    def fire_success_callback(envelope)
      if envelope.group
        @g_cb_pool[envelope.group].call envelope
      else
        @c_cb_pool[envelope.channel].call envelope
      end
    end

    def fire_error_callback(envelope)
      if @e_cb_pool[envelope.channel]
        @e_cb_pool[envelope.channel].call(envelope)
      else
        @app.env[:error_callback].call(envelope)
      end
    end

    def finalize_event(envelopes)
      @app.timetoken = envelopes.first.timetoken
    end

    def path
      '/' + [
        'subscribe',
        @subscribe_key,
        Pubnub::Formatter.channels_for_url(@channel),
        0,
        (@app.env[:timetoken] || 0)
      ].join('/').gsub(/\?/, '%3F')
    end

    def parameters
      params = super
      params.merge!('channel-group' => @group.join(',')) unless @group.empty?
      params
    end
  end
end
