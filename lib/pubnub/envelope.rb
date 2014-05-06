module Pubnub
  class Envelope

    INSTANCE_VARIABLES = [
        :channel,
        :error,
        :error_message,
        :first,
        :history_end,
        :history_start,
        :last,
        :message,
        :object,
        :payload,
        :response,
        :response_message,
        :service,
        :status,
        :timetoken,
        :timetoken_update
    ]

    INSTANCE_VARIABLES.each do |var_name|
      attr_accessor var_name
    end

    alias_method 'msg', 'message'
    alias_method 'status_code', 'status'

    def initialize(parameters, app)
      INSTANCE_VARIABLES.each do |var_name|
        instance_variable_set("@#{var_name.to_s}", parameters[var_name])
      end
    end

    def is_last?
      @last ? true : false
    end

    def is_first?
      @first ? true : false
    end

  end
end