# Toplevel Pubnub module.
module Pubnub
  # Some custom pubnub errors
  class Error < StandardError
    attr_reader :env, :message

    def initialize(env = {})
      raise ::ArgumentError, 'Env passed to Pubnub::Error must be a hash' unless env.instance_of? Hash

      @env = env
      @message = ''

      build_message

      log_error
    end

    private

    def build_message
      insert_value 'operation', @env[:operation]
      insert_value 'request', @env[:request]
      insert_value 'env', @env[:env]
      insert_value 'app', @env[:app]
      insert_value 'response', @env[:response]
      insert_value 'error type', @env[:error]
      insert_value 'error message', @env[:message]
      insert_value 'error backtrace', backtrace
    end

    def insert_value(key, val)
      @message << "#{key.upcase}: #{val}\n" if val
    end

    def log_error
      Pubnub.logger.error('Pubnub') { @message } if Pubnub.logger
    end
  end

  class JSONParseError < Error
  end

  class InitializationError < Error
  end

  class ArgumentError < Error
  end

  class RequestError < Error
  end

  class ResponseError < Error
  end

  class UnknownCryptorError < Error
  end
end
