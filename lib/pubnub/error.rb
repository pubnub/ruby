module Pubnub
  module Error
    class PresenceError  < RuntimeError;
    end
    class PublishError   < RuntimeError;
    end
    class SubscribeError < RuntimeError;
    end
    class InitError      < RuntimeError;
    end
    class PublishError   < RuntimeError;
    end
    class OperationError < RuntimeError
      def operation_exception
        #if @operation.present?
        #  ("Pubnub::" + @operation.to_s.capitalize + "Error").constantize
        #else
          PubnubRequest::RequestError
        #end
      end
    end
  end
end