# Toplevel Pubnub module.
module Pubnub
  # Holds grant functionality
  class Grant < PAM
    include Concurrent::Async
    include Pubnub::Validator::Grant

    def initialize(options, app)
      @event = current_operation
      @categories = format_categories(options[:categories])
      super
      @uuids = Formatter::format_uuid(options[:uuids]) unless options[:uuids].nil?
      @ttl ||= Pubnub::Constants::DEFAULT_TTL
    end

    private

    def current_operation
      Pubnub::Constants::OPERATION_GRANT
    end

    def format_categories(categories)
      formatted = case categories
                  when NilClass then return nil
                  when Array then categories.map { |category| category.to_s.strip }
                  when String, Symbol then categories.to_s.split(',').map(&:strip)
                  else return categories
                  end

      formatted.empty? ? nil : formatted
    end

    def parameters(signature = false)
      category_grant = !@categories.nil?
      write = (category_grant && @write.nil?) || [0, '0', false].include?(@write) ? 0 : 1
      read = (category_grant && @read.nil?) || [0, '0', false].include?(@read) ? 0 : 1
      manage = (category_grant && @manage.nil?) || [0, '0', false].include?(@manage) ? 0 : 1 # unless @group.blank?
      delete = [0, '0', false].include?(@delete) ? 0 : 1 unless @delete.nil?
      get = [0, '0', false].include?(@get) ? 0 : 1 unless @get.nil?
      update = [0, '0', false].include?(@update) ? 0 : 1 unless @update.nil?
      join = [0, '0', false].include?(@join) ? 0 : 1 unless @join.nil?

      { timestamp: @timestamp,
        w: write,
        r: read,
        m: manage,
        d: delete,
        g: get,
        u: update,
        j: join,
        ttl: @ttl,
        category: (@categories.join(',') unless @categories.nil?) }.delete_if { |_k, v| v.nil? }.merge(super(signature))
    end

    def path
      '/' + [
        'v2',
        'auth',
        'grant',
        'sub-key',
        @subscribe_key
      ].join('/')
    end
  end
end
