module Pubnub
  class Grant
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator
    include Pubnub::PAM

    def initialize(options, app)
      super
      @event = 'grant'
      @allow_multiple_channels = true
      @timestamp = current_time

      @ttl    = options[:ttl]   || Pubnub::Configuration::DEFAULT_TTL
    end

    def validate!
      super

      raise ArgumentError.new(:object => self, :message => 'publish_key is required by Grant') unless @publish_key
      raise ArgumentError.new(:object => self, :message => 'Parameter secret_key is required by Grant') if !@secret_key || @secret_key == 0

      raise ArgumentError.new(:object => self, :message => 'write parameter accept only one of: 1, "1", 0, "0", true, false values') unless [nil, 1, '1', 0, '0', true, false].include?(@write)
      raise ArgumentError.new(:object => self, :message => 'read parameter accept only: 1, "1", 0, "0", true, false values') unless [nil, 1, '1', 0, '0', true, false].include?(@read)
      raise ArgumentError.new(:object => self, :message => 'manage parameter accept only: 1, "1", 0, "0", true, false values') unless [nil, 1, '1', 0, '0', true, false].include?(@manage)

      raise ArgumentError.new(:object => self, :message => 'ttl parameter is too big, max value is: 525600') unless @ttl.to_i <= 525600 || @ttl.nil?
      raise ArgumentError.new(:object => self, :message => 'ttl parameter can\'t be negative')               unless @ttl.to_i >= 0      || @ttl.nil?

      # Channel group
      if @channel_group.class == Array
        @channel_group.each do |cg|
          # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if cg.count(':') != 1
        end
      elsif !@channel_group.blank?
        number_of_groups = @channel_group.to_s.split(',').size # In case it will be given as csv
        # raise ArgumentError.new(:object => self, :message => ':group argument has to be in format "ns:cg", "ns:" or ":cg"') if @channel_group.to_s.count(':') != number_of_groups
      end

    end

    private

    def parameters(app, signature = false)
      write  = [0, '0', false].include?(@write)  ? 0 : 1
      read   = [0, '0', false].include?(@read)   ? 0 : 1
      manage = [0, '0', false].include?(@manage) ? 0 : 1 unless @channel_group.blank?

      {
          :timestamp => @timestamp,
          :w         => write,
          :r         => read,
          :m         => manage,
          :ttl       => @ttl
      }.delete_if {|k, v| v.nil? }.merge(super(app, signature))
    end

    def path(app)
      '/' + [
          'v1',
          'auth',
          'grant',
          'sub-key',
          @subscribe_key
      ].join('/')
    end
  end
end
