module Pubnub
  # SubscribeEvent module holds infrastructure for subscribe events.
  class SubscribeEvent < Event
    include Adding
    include Removing
    include Heartbeat
    include Formatter
    include Callbacks

    attr_reader :heart, :wildcard_channel, :channel, :group, :wc_cb_pool, :c_cb_pool, :g_cb_pool

    def initialize(options, app)
      super
      @heartbeat = @app.env[:heartbeat]
      setup_cb_pools

      @wildcard_channel = @channel.select { |e| e.index('.*') } || []
      @channel -= @wildcard_channel

      add_channel_cb_to_cb_pools
      add_group_cb_to_cb_pools
      add_wc_channel_cb_to_cb_pools
    end

    def fire
      return false if @finalized

      Pubnub.logger.debug('Pubnub') { "Fired event #{self.class}" }

      consider_heartbeat

      response = send_request

      return false if @app.subscriber.current_subscription_id != object_id && @http_sync != true

      Pubnub.logger.debug('Pubnub') { 'Fire before fire_callback' }

      envelopes = finalize_event(fire_callbacks(handle(response, uri)))

      Concurrent::Future.execute { fire } unless @http_sync

      envelopes
    end

    def leave_all
      Pubnub.logger.debug('Pubnub') { 'Leaving all subscriptions' }
      @channel.each do |channel|
        @app.leave(channel: channel, skip_restart: true, http_sync: true)
      end
      finish
    end

    def build(options)
      @c_cb_pool = options[:callbacks][:channels]
      @g_cb_pool = options[:callbacks][:groups]
      @wc_cb_pool = options[:callbacks][:wildcard_channels]

      @channel = options[:channels]
      @group = options[:groups]
      @wildcard_channel = options[:wildcard_channels]
    end

    private

    def send_request(retries = 0)
      Pubnub.logger.debug('Pubnub') { '#send_request start' }

      begin
        req = request_dispatcher.get(uri.to_s)
        if retries > 0
          @app.subscriber.announce_status(announcement_type: Pubnub::Constants::RECONNECTED_ANNOUNCEMENT,
                                          event: @event,
                                          given_options: @given_options,
                                          response: req,
                                          request: uri)
        end
        req
      rescue StandardError => error
        Pubnub.logger.warn('Pubnub') { "Connection lost! Reason: #{error}" }
        @app.subscriber.announce_status(announcement_type: Pubnub::Constants::TIMEOUT_ANNOUNCEMENT,
                                        event: @event,
                                        given_options: @given_options,
                                        response: nil,
                                        request: uri)
        if retries < @app.env[:reconnect_attempts]
          req = retry_sending_request(retries)
        else
          Pubnub.logger.error('Pubnub') { error }
          raise error
        end
      end
      req
    end

    def retry_sending_request(retries)
      retries += 1
      Pubnub.logger.warn('Pubnub') { "Sleeping #{@app.env[:reconnect_interval]} before trying to reconnect." }
      sleep(@app.env[:reconnect_interval])
      Pubnub.logger.warn('Pubnub') { 'Trying to reconnect.' }
      send_request(retries)
    end

    def request_dispatcher
      Pubnub.logger.debug('Pubnub') { '#request_dispatcher' }

      @app.request_dispatcher(@origin, :subscribe_event, @http_sync)
    end

    def finalize_event(envelopes)
      if envelopes.first.timetoken
        @app.timetoken = envelopes.first.timetoken[:timetoken]
        @app.region_code = envelopes.first.timetoken[:region_code]
      end

      set_timestamp

      envelopes
    end

    def path
      '/' + [
        'v2',
        'subscribe',
        @subscribe_key,
        Pubnub::Formatter.channels_for_url(@channel + @wildcard_channel),
        0
      ].join('/').gsub(/\?/, '%3F')
    end

    def parameters(*_args)
      params = super
      params = add_timetoken_to_params(params)
      params = add_group_to_params(params)
      params = add_filter_to_params(params)
      add_state_to_params(params)
    end

    def add_filter_to_params(params)
      params['filter-expr'] = encode_parameter("(#{@app.subscribe_filter})", false) if @app.subscribe_filter
      params
    end

    def add_timetoken_to_params(params)
      params[:t] = encode_parameter(r: @app.region_code, t: @app.timetoken)
      params
    end

    def add_group_to_params(params)
      params['channel-group'] = @group.join(',') unless @group.empty?
      params
    end

    def add_state_to_params(params)
      params[:state] = encode_parameter(@app.env[:state][@origin][:channel].merge(@app.env[:state][@origin][:group])) unless @app.empty_state?
      params
    end
  end
end
