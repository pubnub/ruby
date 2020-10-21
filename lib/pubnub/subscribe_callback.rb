# Toplevel Pubnub module.
module Pubnub
  # SubscribeCallback class holds infrastructure for subscribe callbacks
  class SubscribeCallback
    attr_accessor :callbacks

    def initialize(options)
      @callbacks = {
        message: options[:message],
        status: options[:status],
        presence: options[:presence],
        signal: options[:signal],
        object: options[:object]
      }
      validate!
    end

    private

    def validate!
      # Check if each callback responds to call and accept one parameter.
      @callbacks.each do |type, callback|
        raise "#{type} callback is not valid in SubscribeCallback." unless (callback.respond_to?(:call) && callback.arity == 1) || callback.nil?
      end
    end
  end
end
