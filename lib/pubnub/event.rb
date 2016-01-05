# Toplevel Pubnub module.
module Pubnub
  # Event module holds most basic and required infrastructure for every pubnub
  # event, there are also SingleEvent module and SubscribeEvent module
  class Event
    attr_reader :origin, :callback, :error_callback, :channel,
                :open_timeout, :read_timeout, :idle_timeout, :group,
                :presence_callback, :wildcard_channel, :ssl, :state

    alias_method :channels, :channel

    def initialize(options, app)
      @app = app
      env = app.env
      env.delete(:state)
      create_variables_from_options(env.merge(options))
      @origin = @app.current_origin
      format_channels
      format_group
      set_timestamp
      validate!
      Pubnub.logger.debug('Pubnub::Event') { "Initialized #{self.class}" }
    end

    def fire
      Pubnub.logger.debug('Pubnub::Event') { "Fired event #{self.class}" }

      sender = request_dispatcher

      message = sender.get(uri.to_s)

      envelopes = fire_callbacks(handle(message))
      finalize_event(envelopes)
      envelopes
    ensure
      # sender.terminate if @http_sync
      terminate unless @stay_alive
    end

    def uri
      uri = @ssl ? 'https://' : 'http://'
      uri += @origin
      uri += path
      uri += '?' + Formatter.params_hash_to_url_params(parameters)
      Pubnub.logger.debug('Pubnub::Event') { "Requested URI: #{uri}" }
      URI uri
    end

    def finalized?
      @finalized || @stop
    end

    def sync?
      @http_sync ? true : false
    end

    private

    def secure_call(cb, arg)
      cb.call arg
    rescue => error
      Pubnub.logger.error('Pubnub::Event') { "Error while calling callback #{error.inspect}" }
    end

    def format_channels
      @channel = Formatter.format_channel(@channel || @channels)
      @channel += Formatter.format_presence_channel(@presence)
      @wildcard_channel = @channel.select { |e| e.index('.*') } || []
    end

    def fire_callbacks(envelopes)
      Pubnub.logger.debug('Pubnub::Event') { "Firing callbacks for #{self.class}" }
      envelopes.each do |envelope|
        if !envelope.error && @callback && !envelope.timetoken_update
          secure_call @callback, envelope
        end
        secure_call(@error_callback, envelope) if envelope.error
      end
      envelopes
    end

    def parameters
      required = {
        pnsdk: "PubNub-Ruby/#{Pubnub::VERSION}"
      }

      empty_if_blank = {
        auth: @auth_key,
        uuid: @app.env[:uuid]
      }

      empty_if_blank.delete_if { |_k, v| v.blank? }

      required.merge(empty_if_blank)
    end

    def add_common_data_to_envelopes(envelopes, response)
      Pubnub.logger.debug('Pubnub::Event') { 'Event#add_common_data_to_envelopes' }

      envelopes.each do |envelope|
        envelope.response = response.body
        envelope.object = response
        envelope.status = response.code.to_i
        envelope.mark_as_timetoken
      end

      envelopes.last.last = true if envelopes.last
      envelopes.first.first = true if envelopes.first

      envelopes
    end

    def handle(response)
      Pubnub.logger.debug('Pubnub::Event') { 'Event#handle' }

      @response = response
      @envelopes = format_envelopes response
    end

    def connection
      @app.connection_for(self)
    end

    def create_variables_from_options(options)
      variables = %w(channel channels message http_sync callback
                     connect_callback ssl cipher_key secret_key auth_key
                     publish_key subscribe_key timetoken error_callback
                     open_timeout read_timeout idle_timeout heartbeat
                     group action read write manage ttl presence start
                     end count reverse presence_callback store skip_validate
                     state channel_group compressed)

      options = options.reduce({}) { |memo, (k, v)| memo[k.to_sym] = v; memo }

      variables.each do |variable|
        instance_variable_set('@' + variable, options[variable.to_sym]) unless variable.nil?
      end

      return if @event != :subscribe && @event != :presence

      @open_timeout = options[:s_open_timeout]
      @read_timeout = options[:s_read_timeout]
      @idle_timeout = options[:s_idle_timeout]
    end

    def format_group
      @group = @channel_group if @channel_group && @group.blank?
      @group = Formatter.format_group(@group)

      if @group.first.to_s.count(':') > 0
        @namespace_id, @group_id = @group.first.to_s.split(':')
      else
        @namespace_id = nil
        @group_id = @group.first.to_s
      end
    end

    # TODO: refactor this nicely and change test stubs
    def set_timestamp
      @timestamp = current_time
    end

    def current_time
      ::Time.now.to_i
    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end
  end
end
