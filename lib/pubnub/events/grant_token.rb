module Pubnub
  # Holds grant token functionality
  class GrantToken < SingleEvent
    include Concurrent::Async
    include Pubnub::Validator::GrantToken

    def initialize(options, app)
      @event = current_operation
      @telemetry_name = :l_pamv3
      @uuids = options[:uuids] || {}
      options[:channels] = options[:channels] || {}
      options[:channel_groups] = options[:channel_groups] || {}
      @spaces_permissions = options[:spaces_permissions] || {}
      @users_permissions = options[:users_permissions] || {}
      super
    end

    def fire
      Pubnub.logger.debug('Pubnub::GrantToken') { "Fired event #{self.class}" }
      if @authorized_user_id != nil
        uuid = @authorized_user_id
      elsif @authorized_uuid != nil
        uuid = @authorized_uuid
      else
        uuid = nil
      end

      raw_body = {
        ttl: @ttl,
        permissions: {
          meta: @meta,
          uuid: uuid,
          resources: prepare_permissions(:resource, @channels, @channel_groups, @uuids, @spaces_permissions, @users_permissions),
          patterns: prepare_permissions(:pattern, @channels, @channel_groups, @uuids, @spaces_permissions, @users_permissions)
        }.select { |_, v| v }
      }
      body = Formatter.format_message(raw_body, "", false, false)
      response = send_request(body, { "Content-Type": "application/json" })

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def enable_format_channels?
      false
    end

    def enable_format_group?
      false
    end

    def current_operation
      Pubnub::Constants::OPERATION_GRANT_TOKEN
    end

    def prepare_permissions(type, channels, groups, uuids, spaces_permissions, users_permissions)
      {
        channels: prepare_single_permissions(type, channels).merge!(prepare_single_permissions(type, spaces_permissions)),
        groups: prepare_single_permissions(type, groups),
        uuids: prepare_single_permissions(type, uuids).merge!(prepare_single_permissions(type, users_permissions))
      }
    end

    def prepare_single_permissions(type, resources)
      resources
        .select { |_, v| v.type == type }
        .to_h { |k, v| [k, v.calculate_bitmask] }
    end

    def valid_envelope(parsed_response, req_res_objects)
      Pubnub::Envelope.new(
        event: @event,
        event_options: @given_options,
        timetoken: nil,
        status: {
          code: req_res_objects[:response].code,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],
          category: Pubnub::Constants::STATUS_ACK,
          error: false,
          auto_retried: false,

          current_timetoken: nil,
          last_timetoken: nil,
          subscribed_channels: nil,
          subscribed_channel_groups: nil,

          data: nil,

          config: get_config

        },
        result: {
          code: req_res_objects[:response].code,
          operation: current_operation,
          client_request: req_res_objects[:request],
          server_response: req_res_objects[:response],

          data: parsed_response['data']
        }
      )
    end

    def path
      '/' + [
        'v3',
        'pam',
        @subscribe_key,
        'grant'
      ].join('/')
    end
  end

  class Permissions
    attr_reader :type

    class << Permissions
      def pat(read: false, write: false, manage: false, delete: false,
              create: false, get: false, update: false, join: false)
        Permissions.new(
          type: :pattern,
          read: read,
          write: write,
          manage: manage,
          delete: delete,
          create: create,
          get: get,
          update: update,
          join: join
        )
      end

      def res(read: false, write: false, manage: false, delete: false, create: false, get: false, update: false, join: false)
        Permissions.new(
          type: :resource,
          read: read,
          write: write,
          manage: manage,
          delete: delete,
          create: create,
          get: get,
          update: update,
          join: join
        )
      end
    end

    def initialize(options)
      @type = options[:type]
      @read = options[:read] || false
      @write = options[:write] || false
      @manage = options[:manage] || false
      @delete = options[:delete] || false
      @create = options[:create] || false
      @get = options[:get] || false
      @update = options[:update] || false
      @join = options[:join] || false
    end

    def to_s
      "Permissions: {:read => #{@read}, :write => #{@write}, :manage => #{@manage} , :delete => #{@delete}, :create => #{@create}, :get => #{@get}, :update => #{@update}, :join => #{@join}}"
    end

    def calculate_bitmask
      sum = 0

      sum |= 1 if @read
      sum |= 2 if @write
      sum |= 4 if @manage
      sum |= 8 if @delete
      sum |= 16 if @create
      sum |= 32 if @get
      sum |= 64 if @update
      sum |= 128 if @join
      sum
    end
  end
end
