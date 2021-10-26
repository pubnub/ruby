module Pubnub
  # Holds grant token functionality
  class GrantToken < PAM
    include Concurrent::Async
    include Pubnub::Validator::GrantToken

    def initialize(options, app)
      @event = current_operation
      @uuid_perms = options[:uuids] || {}
      @channel_perms = options[:channels] || {}
      @channel_group_perms = options[:channel_groups] || {}
      options[:channels] = []
      options[:channel_groups] = []
      super
    end

    def headers
      { "Content-Type": "application/json" }
    end

    def fire
      Pubnub.logger.debug('Pubnub::GrantToken') { "Fired event #{self.class}" }

      raw_body = {
        ttl: @ttl,
        permissions: {
          meta: @meta,
          uuid: @authorized_uuid,
          resources: prepare_permissions(:resource, @channel_perms, @channel_group_perms, @uuid_perms),
          patterns: prepare_permissions(:pattern, @channel_perms, @channel_group_perms, @uuid_perms)
        }.select { |_, v| v }
      }

      body = Formatter.format_message(raw_body, "", @random_iv, false)
      response = send_request(body, { "Content-Type": "application/json" })

      envelopes = fire_callbacks(handle(response, uri))
      finalize_event(envelopes)
      envelopes
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GRANT_TOKEN
    end

    def prepare_permissions(type, channels, groups, uuids)
      {
        channels: prepare_single_permissions(type, channels),
        groups: prepare_single_permissions(type, groups),
        uuids: prepare_single_permissions(type, uuids)
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

      if @read
        sum |= 1
      end

      if @write
        sum |= 2
      end

      if @manage
        sum |= 4
      end

      if @delete
        sum |= 8
      end

      if @create
        sum |= 16
      end

      if @get
        sum |= 32
      end

      if @update
        sum |= 64
      end

      if @join
        sum |= 128
      end
      sum
    end
  end
end
