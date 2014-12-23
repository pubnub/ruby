require 'spec_helper'

describe Pubnub::Error do
  context '#initialize' do
    it 'builds correct message from parameter if given' do

      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 env: 'eenv',
                 app: 'eapp',
                 response: 'eresponse',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       APP:\seapp\nRESPONSE:\seresponse\nERROR\s
                                       TYPE:\sStandardError\nERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'logs itself as error if Pubnub initialized' do
      rd, wr = IO.pipe

      logger = Logger.new(wr)

      _pubnub = Pubnub.new(subscribe_key: :key, logger: logger)

      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('backtrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'operation',
                 request: 'request',
                 env: 'env',
                 app: 'app',
                 response: 'response',
                 error: StandardError.new,
                 message: 'message'
             )
      rescue
      end

      wr.close

      messages = rd.read
      error_message = messages.slice(/ERROR -- Pubnub(.|\s)*/)

      expect(error_message).to match(/\AERROR\s--\sPubnub:\sOPERATION:\s.+\n
                                       REQUEST:\s.+\nENV:\s.+\n
                                       APP:\s.+\nRESPONSE:\s.+\nERROR\s
                                       TYPE:\s.+\nERROR\sMESSAGE:\smessage\n
                                       ERROR\sBACKTRACE:\sbacktrace$/x)
    end

    it 'fails if @env is not a hash' do
      _pubnub = Pubnub.new(subscribe_key: :key)

      expect { Pubnub::Error.new('String') }
      .to raise_error(
              ArgumentError,
              'Env passed to Pubnub::Error must be a hash'
          )
    end

    it 'sets proper @env as hash' do
      _pubnub = Pubnub.new(subscribe_key: :key)

      error = Pubnub::Error.new(
          operation: 'operation',
          request: 'request',
          env: 'env',
          app: 'app',
          response: 'response',
          error: Pubnub::Error.new,
          message: 'message'
      )

      expect(error.env.class).to eq(Hash)
      expect(error.env).to eq(
                                operation: 'operation',
                                request: 'request',
                                env: 'env',
                                app: 'app',
                                response: 'response',
                                error: Pubnub::Error.new,
                                message: 'message'
                              )
    end

    it 'doesn\'t add operation if no operation is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 request: 'erequest',
                 env: 'eenv',
                 app: 'eapp',
                 response: 'eresponse',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       APP:\seapp\nRESPONSE:\seresponse\nERROR\s
                                       TYPE:\sStandardError\nERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add request if no request is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 env: 'eenv',
                 app: 'eapp',
                 response: 'eresponse',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\n
                                       ENV:\seenv\n
                                       APP:\seapp\n
                                       RESPONSE:\seresponse\n
                                       ERROR\sTYPE:\sStandardError\n
                                       ERROR\sMESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add env if no env is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 app: 'eapp',
                 response: 'eresponse',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\n
                                       APP:\seapp\nRESPONSE:\seresponse\nERROR\s
                                       TYPE:\sStandardError\nERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add app if no app is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 env: 'eenv',
                 response: 'eresponse',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       RESPONSE:\seresponse\nERROR\s
                                       TYPE:\sStandardError\nERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add response if no response is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 env: 'eenv',
                 app: 'eapp',
                 error: StandardError.new,
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       APP:\seapp\nERROR\s
                                       TYPE:\sStandardError\nERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add operation if no operation is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 env: 'eenv',
                 app: 'eapp',
                 response: 'eresponse',
                 message: 'emessage'
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       APP:\seapp\nRESPONSE:\seresponse\n
                                       ERROR\s
                                       MESSAGE:\semessage\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end

    it 'doesn\'t add message if no message is set' do
      allow_any_instance_of(Pubnub::Error).to receive(:backtrace)
                                              .and_return('ebacktrace')

      begin
        fail Pubnub::Error.new(
                 operation: 'eoperation',
                 request: 'erequest',
                 env: 'eenv',
                 app: 'eapp',
                 response: 'eresponse',
                 error: StandardError.new
             )
      rescue => e
        error = e
      end

      expect(error.message).to match(/\AOPERATION:\seoperation\nREQUEST:\s
                                       erequest\nENV:\seenv\n
                                       APP:\seapp\nRESPONSE:\seresponse\nERROR\s
                                       TYPE:\sStandardError\n
                                       ERROR\sBACKTRACE:\sebacktrace$/x)
    end
  end
end
