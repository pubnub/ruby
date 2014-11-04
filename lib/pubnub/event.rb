module Pubnub
  module Event

    attr_reader :fired, :finished

    def initialize(options, app)
      @app              = app
      @origin           = options[:origin]           || app.env[:origin]
      @channel          = options[:channel]
      @message          = options[:message]
      @http_sync        = options[:http_sync]
      @callback         = options[:callback]
      @error_callback   = options[:error_callback]   || app.env[:error_callback]
      @connect_callback = options[:connect_callback] || app.env[:connect_callback]
      @ssl              = options[:ssl]              || app.env[:ssl]

      @cipher_key       = app.env[:cipher_key]
      @secret_key       = app.env[:secret_key]
      @auth_key         = options[:auth_key]         || app.env[:auth_key]
      @publish_key      = app.env[:publish_key]
      @subscribe_key    = app.env[:subscribe_key]

      @response         = nil
      @timetoken        = app.env[:timetoken] || 0
      validate!
      @original_channel = format_channels(@channel, false)
      @channel          = format_channels(@channel)
      $logger.debug('Pubnub'){"Event#initialize | Initialized #{self.class.to_s}"}
    end

    def fire(app)
      $logger.debug('Pubnub'){'Pubnub::Event#fire'}
      @fired = true
      $logger.debug('Pubnub'){'Event#fire'}
      setup_connection(app) unless connection_exist?(app)
      envelopes = start_event(app)
    end

    def send_request(app)
      if app.disabled_persistent_connection?
        @response = Net::HTTP.get_response uri(app)
      else
        @response = get_connection(app).request(uri(app))
      end
    end

    def start_event(app, count = 0)
      begin
        if count <= app.env[:max_retries]
          $logger.debug('Pubnub'){'Event#start_event | sending request'}
          $logger.debug('Pubnub'){"Event#start_event | tt: #{@timetoken}; ctt #{app.env[:timetoken]}"}
          @response = send_request(app)
        end

        error = response_error(@response, app)

        if ![error].flatten.include?(:json) || count > app.env[:max_retries]
          handle_response(@response, app, error)
        else
          start_event(app, count + 1)
        end
      rescue => e
        $logger.error('Pubnub'){e.inspect}
        if count <= app.env[:max_retries]
          start_event(app, count + 1)
        else
          $logger.error('Pubnub'){"Aborting #{self.class} event due to network errors and reaching max retries"}
        end
        false
      end
    end

    def validate!
      if @allow_multiple_channels == true
        raise ArgumentError.new(:object => self, :message => 'Invalid channel(s) format! Should be type of: String, Symbol, or Array of both') unless valid_channel?(true)
      elsif @allow_multiple_channels == false
        raise ArgumentError.new(:object => self, :message => 'Invalid channel(s) format! Should be type of: String, Symbol') unless valid_channel?(false)
      end

      unless @doesnt_require_callback
        raise ArgumentError.new(:object => self, :message => 'Callback parameter is required while using async') if (!@http_sync && @callback.blank?)
      end

    end

    private

    def response_error(response, app)
      if Parser.valid_json?(response.body) && (200..206).include?(response.code.to_i)
        error = false
      elsif Parser.valid_json?(response.body) && !(200..206).include?(response.code.to_i)
        error = [:code]
      elsif !Parser.valid_json?(response.body) && (200..206).include?(response.code.to_i)
        error = [:json]
      else
        error = [:code, :json]
      end

      error
    end

    def handle_response(response, app, error)

      $logger.debug('Pubnub'){'Event#handle_response'}
      envelopes = format_envelopes(response, app, error)
      $logger.debug('Pubnub'){"Response: #{response.body}"} if (response && response.body)
      update_app_timetoken(envelopes, app)
      fire_callbacks(envelopes,app)
      @finished = true
      envelopes

    end

    def update_app_timetoken(envelopes, app)
      # stub
    end

    def fire_callbacks(envelopes, app)
      unless envelopes.blank?
        $logger.debug('Pubnub'){'Firing callbacks'}
        envelopes.each do |envelope|
          @callback.call(envelope)       if envelope && !envelope.error && @callback && !envelope.timetoken_update
          #if envelope.timetoken_update || envelope.timetoken.to_i > app.env[:timetoken].to_i
          #  update_timetoken(app, envelope.timetoken)
          #end
        end
        @error_callback.call(envelopes.first) if envelopes.first.error
      else
        $logger.debug('Pubnub'){'No envelopes for callback'}
      end
    end

    def update_timetoken(app, timetoken)
      @timetoken = timetoken.to_i
      app.update_timetoken(timetoken.to_i)
      $logger.debug('Pubnub'){"Updated timetoken to #{timetoken}"}
    end

    def add_common_data_to_envelopes(envelopes, response, app, error)
      $logger.debug('Pubnub'){'Event#add_common_data_to_envelopes'}

      envelopes.each do |envelope|
        envelope.response      = response.body
        envelope.object        = response
        envelope.status        = response.code.to_i
      end

      envelopes.last.last   = true if envelopes.last
      envelopes.first.first = true if envelopes.first

      envelopes = insert_errors(envelopes, error, app) if error

      envelopes
    end

    def insert_errors(envelopes, error_symbol, app)
      case error_symbol
        when [:json]
          error_message = '[0,"Invalid JSON in response."]'
          error         = JSONParseError.new(
              :app     => app,
              :message => error_message,
              :request => self.class,
              :response => @response.body,
              :error    => error_symbol
          )
        when [:code]
          error_message = '[0,"Non 2xx server response."]'
          error         = ResponseError.new(
              :app     => app,
              :message => error_message,
              :request => self.class,
              :response => @response.body,
              :error    => error_symbol
          )
        when [:code, :json]
          error_message = '[0,"Invalid JSON in response."]'
          error         = ResponseError.new(
              :app     => app,
              :message => error_message,
              :request => self.class,
              :response => @response.body,
              :error    => error_symbol
          )
        else
          error_message = '[0, "Unknown Error."]'
          error         = Error.new(
              :app     => app,
              :message => error_message,
              :request => self.class,
              :response => @response.body,
              :error    => error_symbol
          )
      end

      envelopes.first.error   = error
      envelopes.first.message = error_message
      envelopes.first.last = true

      [envelopes.first]
    end

    def uri(app)
      $logger.debug('Pubnub'){"#{self.class}#uri #{[origin(app), path(app), '?', params_hash_to_url_params(parameters(app))].join}"}
      URI [origin(app), path(app), '?', params_hash_to_url_params(parameters(app))].join
    end

    def origin(app)
      h = @ssl ? 'https://' : 'http://'
      h + @origin
    end

    def parameters(app)
      required = {
          :pnsdk => "PubNub-Ruby/#{Pubnub::VERSION}"
      }

      empty_if_blank = {
          :auth => @auth_key,
          :uuid => app.env[:uuid],
          :heartbeat => app.env[:heartbeat]
      }

      empty_if_blank.delete_if {|k, v| v.blank? }

      required.merge(empty_if_blank)
    end

  end

  module SingleEvent

    def fire(app)
      $logger.debug('Pubnub'){'Pubnub::SingleEvent#fire'}
      if @http_sync
        $logger.debug('Pubnub'){'Pubnub::SingleEvent#fire | Sync event!'}
        super(app)
      elsif app.async_events.include? self
        $logger.debug('Pubnub'){'Pubnub::SingleEvent#fire | Event already on list!'}
        super(app)
      else
        $logger.debug('Pubnub'){'Pubnub::SingleEvent#fire | Adding event to async_events'}
        app.async_events << self
        $logger.debug('Pubnub'){'Pubnub::SingleEvent#fire | Starting railgun'}
        app.start_railgun
      end
    end

    private

    def setup_connection(app)
      app.single_event_connections_pool[@origin] = new_connection(app)
    end

    def connection_exist?(app)
      !app.single_event_connections_pool[@origin].nil? && !app.single_event_connections_pool[@origin].nil?
    end

    def get_connection(app)
      app.single_event_connections_pool[@origin]
    end

    def new_connection(app)
      unless app.disabled_persistent_connection?
        connection = Net::HTTP::Persistent.new "pubnub_ruby_client_v#{Pubnub::VERSION}"
        connection.idle_timeout = app.env[:timeout]
        connection.read_timeout = app.env[:timeout]
        connection.proxy_from_env
        connection
      end
    end
  end

  module SubscribeEvent
    def fire(app)
      begin
        $logger.debug('Pubnub'){'SubscribeEvent#fire'}
        if @http_sync
          $logger.debug('Pubnub'){'SubscribeEvent#fire sync'}
          if self.class == Pubnub::Subscribe && app.env[:heartbeat]
            app.heartbeat(:channel => @channel, :http_sync => true)
            envelopes = super
            @channel.each do |channel|
              app.leave(:channel => channel, :http_sync => true, :skip_remove => true, :force => true) unless (app.env[:subscriptions][@origin] && app.env[:subscriptions][@origin].get_channels.include(channel))
            end
          else
            envelopes = super
          end
          envelopes
        else
          $logger.debug('Pubnub'){'SubscribeEvent#fire async'}
          $logger.debug('Pubnub'){"Channel: #{@channel}"}
          setup_connection(app) unless connection_exist?(app)
          unless app.env[:subscriptions][@origin].blank?
            @channel.each do |channel|
              if app.env[:subscriptions][@origin].get_channels.include?(channel)
                @channel.delete(channel)
                $logger.error('Pubnub'){"Already subscribed to channel #{channel}, you have to leave that channel first"}
              end
            end

            @channel.each do |channel|
              $logger.debug('Pubnub'){'SubscribeEvent#add_channel | Adding channel'}
              app.env[:subscriptions][@origin].add_channel(channel, app)
            end

            if @channel.empty?
              false
            else
              app.start_respirator
              true
            end
          end

          if app.env[:subscriptions][@origin].nil?
            app.env[:subscriptions][@origin]        = self            if app.env[:subscriptions][@origin].nil?
            app.env[:callbacks_pool][@origin]       = Hash.new        if app.env[:callbacks_pool][@origin].nil?
            app.env[:error_callbacks_pool][@origin] = @error_callback if app.env[:error_callbacks_pool][@origin].nil?

            @channel.each do |channel|
              app.env[:callbacks_pool][@origin][channel] = Hash.new

              app.env[:callbacks_pool][@origin][channel][:callback]       = @callback       unless app.env[:callbacks_pool][@origin][:callback]
            end

          else
            @channel.each do |channel|
              app.env[:callbacks_pool][@origin][channel] = Hash.new
              app.env[:callbacks_pool][@origin][channel] = Hash.new

              app.env[:callbacks_pool][@origin][channel][:callback]       = @callback       unless app.env[:callbacks_pool][@origin][:callback]
              app.env[:callbacks_pool][@origin][channel][:error_callback] = @error_callback unless app.env[:callbacks_pool][@origin][:error_callback]
            end
          end

          app.start_subscribe

        end
      rescue => error
        $logger.error('Pubnub'){error}
      end
    end

    def set_timetoken(timetoken)
      @timetoken = timetoken
    end

    def add_channel(channel, app)
      @channel = @channel + format_channels(channel)
      $logger.debug('Pubnub'){'SubscribeEvent#add_channel | Added channel'}
    end

    def remove_channel(channel, app)
      @channel = @channel - format_channels(channel)
      $logger.debug('Pubnub'){'SubscribeEvent#remove_channel | Removed channel'}
      begin
        shutdown_subscribe(app) if @channel.empty?
      rescue => e
        $logger.error('Pubnub'){e.message}
        $logger.error('Pubnub'){e.backtrace}
      end
    end

    def get_channels
      @channel
    end

    private

    def parameters(app)
      parameters = super(app)
      parameters.merge!({:heartbeat => app.env[:heartbeat]}) if app.env[:heartbeat]
      parameters.merge!({:state => encode_state(app.env[:state][@origin])}) if app.env[:state] && app.env[:state][@origin]
      parameters
    end

    def encode_state(state)
      URI.encode_www_form_component(state.to_json).gsub('+', '%20')
    end

    def update_app_timetoken(envelopes, app)
      $logger.debug('Pubnub'){'Event#update_app_timetoken'}
      envelopes.each do |envelope|
        if envelope.timetoken_update || envelope.timetoken.to_i > app.env[:timetoken].to_i
          update_timetoken(app, envelope.timetoken)
        end
      end
      app.env[:wait_for_response][@origin] = false unless @http_sync
    end

    def shutdown_subscribe(app)
      app.env[:subscriptions][@origin]  = nil
      app.env[:subscriptions].delete(@origin)
      app.env[:callbacks_pool][@origin] = nil
      app.env[:callbacks_pool].delete(@origin)
      app.subscribe_event_connections_pool[@origin].shutdown_in_all_threads
      app.subscribe_event_connections_pool[@origin] = nil
      app.subscribe_event_connections_pool.delete(@origin)
    end

    def fire_callbacks(envelopes, app)
      if @http_sync
        super
      else
        begin
          $logger.debug('Pubnub'){'Event#fire_callbacks async'}
          envelopes.each do |envelope|
            app.env[:callbacks_pool][@origin][envelope.channel][:callback].call(envelope) if !envelope.error && !envelope.timetoken_update
          end
          $logger.debug('Pubnub'){'We can send next request now'}
          app.env[:error_callbacks_pool][@origin].call(envelopes.first) if envelopes.first.error
        rescue => error
          $logger.error('Pubnub'){error}
          $logger.error('Pubnub'){error.backtrace}
        end
      end unless envelopes.nil?

    end

    def setup_connection(app)
      app.subscribe_event_connections_pool[@origin] = new_connection(app)
    end

    def connection_exist?(app)
      !app.subscribe_event_connections_pool[@origin].nil? && !app.subscribe_event_connections_pool[@origin].nil?
    end

    def get_connection(app)
      app.subscribe_event_connections_pool[@origin]
    end

    def channels_for_url(channels)
      channels.join(',')
    end

    def path(app)
      path = URI.escape("/subscribe/#{@subscribe_key}/#{channels_for_url(@channel)}/0/#{@timetoken}").gsub(/\?/,'%3F')
    end

    def timetoken(parsed_response)
      parsed_response[1] if parsed_response.is_a? Array
    end

    def message(parsed_response, i, channel, app)
      if app.env[:cipher_key].blank? || channel.index('-pnpres')
        parsed_response.first[i]
      else
        pc = Crypto.new(app.env[:cipher_key])
        pc.decrypt(parsed_response.first[i])
      end
    end

    def format_envelopes(response, app, error)

      $logger.debug('Pubnub'){'Subscribe#format_envelopes'}

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      $logger.debug('Pubnub'){'Subscribe#format_envelopes | Response parsed'}

      envelopes = Array.new
      if error
        $logger.debug('Pubnub'){'Subscribe#format_envelopes | Error'}
        envelopes << Envelope.new(
            {
                :channel           => @channel,
                :timetoken         => timetoken(parsed_response)
            },
            app
        )
      elsif parsed_response[0].empty?
        $logger.debug('Pubnub'){'Subscribe#format_envelopes | Timetoken'}
        envelopes << Envelope.new(
            {
                :channel           => @channel.first,
                :response_message  => parsed_response,
                :timetoken         => timetoken(parsed_response),
                :timetoken_update  => true
            },
            app
        )
      else
        $logger.debug('Pubnub'){'Subscribe#format_envelopes | Not timetoken update'}

        if parsed_response[2]
          channels = parsed_response[2].split(',')
        else
          channels = @channel
        end

        parsed_response[0].size.times do |i|
          if channels.size <= 1
            channel = channels.first
          else
            channel = channels[i]
          end
          $logger.debug('Pubnub'){"Subscribe#format_envelopes | Channel #{channel} created"}

          $logger.debug('Pubnub'){"#{parsed_response}"}

          envelopes << Envelope.new(
              {
                  :message           => message(parsed_response, i, channel, app),
                  :channel           => channel,
                  :response_message  => parsed_response,
                  :timetoken         => timetoken(parsed_response)
              },
              app
          )

          $logger.debug('Pubnub'){'Subscribe#format_envelopes | Envelopes created'}

        end
      end

      $logger.debug('Pubnub'){'Subscribe#format_envelopes | envelopes created'}

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

    def new_connection(app)
      unless app.disabled_persistent_connection?
        connection = Net::HTTP::Persistent.new "pubnub_ruby_client_v#{Pubnub::VERSION}"
        connection.idle_timeout   = app.env[:subscribe_timeout]
        connection.read_timeout   = app.env[:subscribe_timeout]
        @connect_callback.call "New connection to #{@origin}"
        connection.proxy_from_env
        connection
      end
    end
  end
end
