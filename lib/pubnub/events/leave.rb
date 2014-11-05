module Pubnub
  class Leave
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @event = 'leave'
      @allow_multiple_channels = true
      @doesnt_require_callback = true
      @force = options[:force]
      @skip_remove = options[:skip_remove]
    end

    def validate!
      super

      # check channel
      # raise ArgumentError.new(:object => self, :message => 'Leave requires :channel argument') unless @channel
      # raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String, Symbol, or Array of both') unless valid_channel?
    end

    def fire(app)
      $logger.debug('Pubnub'){"Pubnub::Leave#fire"}
      unless @left
        app.update_timetoken(0)
        if app.env[:subscriptions][@origin].nil?
          $logger.error('Pubnub'){'There\'s no subscription for that origin'}
          raise ArgumentError.new(:object => self, :message => 'You cannot leave channel that is not subscribed')
        else
          @channel.each do |channel|
            $logger.debug('Pubnub'){"#{app.env[:subscriptions][@origin].get_channels.to_s}.include? #{channel}"}
            raise ArgumentError.new(:object => self, :message => 'You cannot leave channel that is not subscribed') unless app.env[:subscriptions][@origin].get_channels.include?(channel)
          end

          @channel_group.each do |channel_group|
            $logger.debug('Pubnub'){"#{app.env[:subscriptions][@origin].get_channel_groups.to_s}.include? #{channel_group}"}
            raise ArgumentError.new(:object => self, :message => 'You cannot leave channel group that is not subscribed') unless app.env[:subscriptions][@origin].get_channel_groups.include?(channel_group)
          end
        end unless @force

        @channel.each do |channel|
          app.env[:subscriptions][@origin].remove_channel(channel, app) if app.env[:subscriptions][@origin]
          @left = true
        end unless @skip_remove

        @channel_group.each do |channel_group|
          app.env[:subscriptions][@origin].remove_channel_group(channel_group, app) if app.env[:subscriptions][@origin]
          @left = true
        end unless @skip_remove
      end

      envelopes = super
      app.start_subscribe
      envelopes
    end

    private

    def parameters(app)
      params = super(app)
      params.merge!({ 'channel-group' => @channel_group.join(',') }) unless @channel_group.blank?
      params
    end

    def path(app)
      if @channel == [''] || @channel.blank?
        channel = [',']
      else
        channel = @channel
      end

      '/' + [
          'v2',
          'presence',
          'sub-key',
          @subscribe_key,
          'channel',
          channel.join(','),
          'leave'
      ].join('/')
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
          {
              :parsed_response => parsed_response,
              :action  => (parsed_response['action']   if parsed_response),
              :message => (parsed_response['message']  if parsed_response),
              :uuid    => (parsed_response['uuid']     if parsed_response),
              :status  => (parsed_response['status']   if parsed_response),
              :service => (parsed_response['service']  if parsed_response)
          },
          app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end

  end
end
