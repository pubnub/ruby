# Toplevel Pubnub module.
module Pubnub
  # Every message from server is formatted into easy to use Envelope object
  class Envelope
    attr_accessor :first, :last, :object, :response, :parsed_response, :status
    attr_accessor :channel, :message, :payload, :service, :timetoken
    attr_accessor :response_message, :error, :action, :uuid, :service, :uuids
    attr_accessor :timetoken_update, :group, :wildcard_channel, :id, :event_options
    attr_accessor :event

    # subscribe, presence specific
    attr_accessor :timetoken_update

    # history specific
    attr_accessor :history_start, :history_end

    # aliases
    alias_method 'msg', 'message'
    alias_method 'status_code', 'status'

    def initialize(parameters)
      @id = UUID.generate # internal usage only
      parameters.each do |parameter, value|
        instance_variable_set("@#{parameter}", value)
      end
    end

    def mark_as_timetoken
      if (@parsed_response[0].empty?) &&
         (@parsed_response[1].size == 17)
        @timetoken_update = true
      else
        @timetoken_update = false
      end
    rescue
      @timetoken_update = false
    end

    def repeat(client, changes = {})
      client.send @event, @event_options.merge(changes)
    end

    def error?
      error ? true : false
    end

    def last?
      last
    end

    def first?
      first
    end
  end
end
