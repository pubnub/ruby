module Pubnub
  class History
    include Pubnub::Event
    include Pubnub::SingleEvent
    include Pubnub::Formatter
    include Pubnub::Validator


    def initialize(options, app)
      super
      @start = options[:start]
      @end   = options[:end]
      @count = options[:count]
      @event = 'history'
      @allow_multiple_channels = false

    end

    def validate!
      super

      # check channel
      raise ArgumentError.new(:object => self, :message => 'History requires :channel argument') unless @channel
      raise ArgumentError.new(:object => self, :message => 'Invalid channel format! Should be type of: String, Symbol') unless [String, Symbol].include?(@channel.class)

      # check if history parameters are valid

      # start
      raise ArgumentError.new(:object => self, :message => 'Invalid :start parameter, should be type of Integer, Fixnum or String') unless [String, Fixnum, Integer, NilClass].include?(@start.class)
      raise ArgumentError.new(:object => self, :message => 'Invalid :start parameter, should be positive integer number') if !@start.to_i.integer? && @start.to_i <= 0

      # end
      raise ArgumentError.new(:object => self, :message => 'Invalid :end parameter, should be type of Integer, Fixnum or String') unless [String, Fixnum, Integer, NilClass].include?(@end.class)
      raise ArgumentError.new(:object => self, :message => 'Invalid :end parameter, should be positive integer number') if !@end.to_i.integer? && @end.to_i <= 0
      raise ArgumentError.new(:object => self, :message => 'Invalid :end parameter, should be bigger than :start parameter. If you want to get messages in reverse order, use :reverse => true at call.') if @start.to_i >= @end.to_i && !@start.nil? && @end.nil?
      # count
      raise ArgumentError.new(:object => self, :message => 'Invalid :count parameter, should be type of Integer, Fixnum or String') unless [String, Fixnum, Integer, NilClass].include?(@count.class)
      raise ArgumentError.new(:object => self, :message => 'Invalid :count parameter, should be positive integer number') if !@count.to_i.integer? && @count.to_i <= 0
    end

    private

    def path(app)
      '/' + [
          'v2',
          'history',
          'sub-key',
          @subscribe_key,
          'channel',
          @channel
      ].join('/')
    end

    def parameters(app)
      params = super(app)
      params.merge!({ :start => @start }) if @start
      params.merge!({ :end   => @end })   if @end
      params.merge!({ :count => @count }) if @count
      params
    end

    def timetoken(parsed_response)
      parsed_response[2] if parsed_response.is_a? Array
    end

    def response_message(parsed_response)
      parsed_response[1] if parsed_response.is_a? Array
    end

    def format_envelopes(response, app, error)

      parsed_response = Parser.parse_json(response.body) if Parser.valid_json?(response.body)

      envelopes = Array.new
      if error
        envelopes << Envelope.new(
            {
                :channel           => @channel,
                :timetoken         => timetoken(parsed_response),
                :history_start     => @start,
                :history_end       => @end
            },
            app
        )
      else
        parsed_response.first.each do |message|
          envelopes << Envelope.new(
              {
                  :message           => message,
                  :channel           => @channel.first,
                  :response_message  => response_message(parsed_response),
                  :timetoken         => timetoken(parsed_response),
                  :history_start     => parsed_response[1],
                  :history_end       => parsed_response[2]
              },
              app
          )
        end
      end


      envelopes = add_common_data_to_envelopes(envelopes, response, app, error)

      envelopes

    end
  end
end