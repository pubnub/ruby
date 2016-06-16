# Toplevel Pubnub module.
module Pubnub
  # Module that holds subscriber logic
  class Subscriber
    attr_reader :channels, :groups, :wildcard_channels, :callbacks, :current_subscription_id, :current_subscription
    attr_reader :listeners
    attr_accessor :ssl

    def initialize(app)
      @app = app
      @channels = []
      @groups = []
      @wildcard_channels = []
      @listeners = {}
      @callbacks = { channels: {}, groups: {}, wildcard_channels: {} }
    end

    def add_listener(options)
      name     = (options[:name] || UUID.generate).to_sym
      callback = options[:callback]

      fail 'Invalid listener.' unless callback.is_a?(SubscribeCallback)
      fail 'Listener with such name already exists.' if @listeners.keys.include?(name)

      @listeners[name] = callback
    end

    def remove_listener(options)
      name = options[:name]
      callback = options[:callback]

      fail 'You have to specify name _or_ listener object.' if name && callback

      @listeners.delete_if { |k, _v| k == name.to_sym } if name

      @listeners.delete_if { |_k, v| v == callback } if callback
    end

    def add_subscription(event)
      @ssl = event.ssl
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Adding subscription to Subscriber' }
      add_channels event
      add_groups event
      add_wildcard_channels event
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Added subscription to Subscriber' }
    end

    def remove_subscription(event)
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removing subscription from Subscriber' }
      remove_channels event
      remove_groups event
      remove_wildcard_channels event
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removed subscription from Subscriber' }
    end

    def reset
      remove_current_subscription
      return if @channels.empty? && @groups.empty? && @wildcard_channels.empty?
      build_subscription
      start_subscription
    end

    def fire_async_callbacks(envelopes)
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Firing callback from listeners' }
      envelopes.each do |envelope|
        @listeners.each do |name, callbacks|
          Pubnub.logger.debug('Pubnub::Subscriber') { "Firing callbacks from listener '#{name}'." }
          if envelope.is_a?(ErrorEnvelope)
            secure_call callbacks.callbacks[:status], envelope
          else
            case envelope.result[:operation]
            when Pubnub::Constants::OPERATION_SUBSCRIBE
              secure_call callbacks.callbacks[:message], envelope
            when Pubnub::Constants::OPERATION_PRESENCE
              secure_call callbacks.callbacks[:presence], envelope
            else
              secure_call callbacks.callbacks[:status], envelope
            end
          end
        end
      end
    end

    def announce_status(options)
      announcement_type = options[:announcement_type]
      event             = options[:event]
      given_options     = options[:given_options]
      request           = options[:request]
      _response         = options[:response]

      case announcement_type
      when Pubnub::Constants::TIMEOUT_ANNOUNCEMENT
        envelope = ErrorEnvelope.new(
          event:         event,
          event_options: given_options,
          timetoken:     nil,
          status: {
            code: nil,
            client_request: request,
            server_response: nil,
            data: nil,
            category: Pubnub::Constants::STATUS_TIMEOUT,
            error: true,
            auto_retried: true,

            current_timetoken:         @app.env[:timetoken].to_i,
            last_timetoken:            @app.env[:timetoken].to_i,
            subscribed_channels:       @app.subscribed_channels,
            subscribed_channel_groups: @app.subscribed_groups,

            config: get_config

          },
          result: {
            code: nil,
            operation: nil,
            client_request: request,
            server_response: nil,

            data: nil
          }
        )
      when Pubnub::Constants::RECONNECTED_ANNOUNCEMENT
        envelope = ErrorEnvelope.new(
          event:         event,
          event_options: given_options,
          timetoken:     nil,
          status: {
            code: nil,
            client_request: request,
            server_response: nil,
            data: nil,
            category: Pubnub::Constants::STATUS_ACK,
            error: false,
            auto_retried: true,

            current_timetoken:         @app.env[:timetoken].to_i,
            last_timetoken:            @app.env[:timetoken].to_i,
            subscribed_channels:       @app.subscribed_channels,
            subscribed_channel_groups: @app.subscribed_groups,

            config: get_config

          },
          result: {
            code: nil,
            operation: nil,
            client_request: request,
            server_response: nil,

            data: nil
          }
        )
      else
        Pubnub.logger.warn('Unknown announcement type.')
      end
      @listeners.each do |_name, callbacks|
        secure_call callbacks.callbacks[:status], envelope
      end
    end

    private

    # TODO: remove?
    # def conflict_with?(event)
    #   channels = event.channel
    #   groups = event.group
    #   wildcard_channels = event.wildcard_channel
    #
    #   checks  = channels.map          { |channel|          subscribed_to?(:channel, channel) }
    #   checks += groups.map            { |group|            subscribed_to?(:group, group) }
    #   checks += wildcard_channels.map { |wildcard_channel| subscribed_to?(:wildcard_channel, wildcard_channel) }
    #
    #   fail "Can't subscribe, conflicts with currently running subscription." if checks.include?(true)
    # end

    def subscribed_to?(type, name)
      case type
      when :channel
        @channels.include? name
      when :group
        @groups.include? name
      when :wildcard_channel
        @wildcard_channels.include? name
      end
    end

    def add_channels(event)
      @channels += event.channel
      @channels.uniq!
      @callbacks[:channels].merge! event.c_cb_pool
    end

    def add_groups(event)
      @groups += event.group
      @groups.uniq!
      @callbacks[:groups].merge! event.g_cb_pool
    end

    def add_wildcard_channels(event)
      @wildcard_channels += event.wildcard_channel
      @wildcard_channels.uniq!
      @callbacks[:wildcard_channels].merge! event.wc_cb_pool
    end

    def remove_channels(event)
      @channels -= event.channel
      event.channel.each { |channel| @callbacks[:channels].delete_if { |k, _v| k.to_sym == channel.to_sym } }
    end

    def remove_groups(event)
      @groups -= event.group
      event.group.each { |group| @callbacks[:groups].delete_if { |k, _v| k.to_sym == group.to_sym } }
    end

    def remove_wildcard_channels(event)
      @wildcard_channels -= event.wildcard_channel
      event.wildcard_channel.each do |wildcard_channel|
        @callbacks[:wildcard_channels].delete_if { |k, _v| k.to_sym == wildcard_channel.to_sym }
      end
    end

    def build_subscription
      @current_subscription = Subscribe.new({ ssl: @ssl }, @app)
      @current_subscription_id = @current_subscription.bare_object.object_id
      @current_subscription.build(callbacks: @callbacks,
                                  channels: @channels,
                                  groups: @groups,
                                  wildcard_channels: @wildcard_channels)
    end

    def remove_current_subscription
      return if @current_subscription_id.nil?
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Removing current subscription' }
      @current_subscription.async.terminate
      @current_subscription    = nil
      @current_subscription_id = nil
      @app.timetoken = 0
    end

    def start_subscription
      Pubnub.logger.debug('Pubnub::Subscriber') { 'Starting subscription' }
      fail 'Cannot start subscription without builded @current_subscription' if @current_subscription.nil?
      @current_subscription.future.fire
    end

    def secure_call(cb, arg)
      cb.call arg
    rescue => error
      Pubnub.logger.error('Pubnub::Subscriber') { "Error while calling callback #{error.inspect}" }
    end

    def get_config
      {
        tls:      @app.env[:ssl],
        uuid:     @app.env[:uuid],
        auth_key: @app.env[:auth_key],
        origin:   @app.current_origin
      }
    end
  end
end
