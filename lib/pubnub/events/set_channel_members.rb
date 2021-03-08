# Toplevel Pubnub module.
# frozen_string_literal: true

module Pubnub
  # Holds SetChannelMembers functionality
  class SetChannelMembers < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::SetChannelMembers

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_obj
      @channel = options[:channel]
      @limit = [options[:limit], 100].min unless options[:limit].nil?
      @sort = options[:sort].join(",") if options[:sort] && !options[:sort].empty?
      @filter = options[:filter] if options[:filter] && !options[:filter].empty?
      @start = options[:start] if options[:start] && !options[:start].empty?
      @end = options[:end] if options[:start] && !options[:end].empty?

      if options[:include]
        include = options[:include]
        @include_count = [0, '0', false].include?(include[:count]) ? "0" : "1" unless include[:count].nil?
        @include_custom = "custom" if !include[:custom].nil? && ![0, '0', false].include?(include[:custom])
        @include_uuid_metadata = "uuid" if !include[:uuid_metadata].nil? && ![0, '0', false].include?(include[:uuid_metadata])
        @include_uuid_custom = "uuid.custom" if !include[:uuid_custom].nil? && ![0, '0', false].include?(include[:uuid_custom])

        @include = [@include_custom, @include_uuid_metadata, @include_uuid_custom].reject { |flag| flag.to_s.empty? }
      end

      @uuids = options[:uuids] if options[:uuids] && !options[:uuids].empty?

      # Collections by default return number of available entries.
      @include_count = "1" if @include_count.nil?

      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::SetChannelMembers') { "Fired event #{self.class}" }

      members = @uuids.map do |member|
        member_object = { uuid: { id: member[:uuid] } }
        member_object[:custom] = member[:custom] if member[:custom] && !member[:custom].empty?

        member_object
      end

      body = Formatter.format_message({ set: members }, "", @random_iv, false)
      response = send_request(body)

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_SET_CHANNEL_MEMBERS
    end

    def parameters(signature = false)
      parameters = super(signature)
      parameters[:limit] = @limit unless @limit.nil?
      parameters[:sort] = @sort unless @sort.nil?
      parameters[:filter] = @filter unless @filter.nil?
      parameters[:start] = @start unless @start.nil?
      parameters[:end] = @end if @end && !@start
      parameters[:count] = @include_count unless @include_count.nil?
      parameters[:include] = @include.sort.join(",") if @include && !@include.empty?

      parameters
    end

    def path
      '/' + [
        'v2',
        'objects',
        @subscribe_key,
        'channels',
        Formatter.channels_for_url(@channel),
        'uuids'
      ].join('/')
    end

    def valid_envelope(parsed_response, req_res_objects)
      members = parsed_response['data'].map { |channel_member|
        member = Hash.new
        channel_member.each{ |k,v| member[k.to_sym] = v }

        unless member[:uuid].nil?
          uuid_metadata = Hash.new
          member[:uuid].each{ |k,v| uuid_metadata[k.to_sym] = v }
          uuid_metadata[:updated] = Date._parse(uuid_metadata[:updated]) unless uuid_metadata[:updated].nil?
          member[:uuid] = uuid_metadata
        end
        member[:updated] = Date._parse(member[:updated]) unless member[:updated].nil?

        member
      }

      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,

        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: {
            members: members,
            totalCount: parsed_response['totalCount'],
            next: parsed_response['next'],
            prev: parsed_response['prev']
          }
        },

        status: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          data: nil,
          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          config: get_config
        }
      )
    end
  end
end
