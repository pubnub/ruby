module Pubnub
  class State
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator

    def initialize(options, app)
      super

      @uuid_looking_for = options[:uuid]
      @uuid = app.uuid
    end

    def validate!
      super

      # check channel/channels
      # raise ArgumentError.new(:object => self, :message => 'State requires :channel argument') unless @channel
      # raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String or Symbol') unless @channel.is_a?(String) or @channel.is_a?(Symbol)
    end

    private

    def parameters(app)
      parameters = super(app)
      parameters.merge!({ 'channel-group' => format_channel_group(@channel_group).join(',') }) unless @channel_group.blank?
      parameters
    end

    def path(app)
      '/' + [
          'v2',
          'presence',
          'sub_key',
          @subscribe_key,
          'channel',
          channels_for_url(@channel),
          'uuid',
          @uuid_looking_for
      ].join('/')
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      envelopes << Envelope.new(
        {
            :parsed_response => parsed_response,
            :channel  => (parsed_response['channel']  if parsed_response),
            :payload  => (parsed_response['payload']  if parsed_response),
            :service  => (parsed_response['service']  if parsed_response),
            :message  => (parsed_response['message']  if parsed_response),
            :uuid     => (parsed_response['uuid']     if parsed_response),
            :status   => (parsed_response['status']   if parsed_response)
        },
        app
      )

      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end
