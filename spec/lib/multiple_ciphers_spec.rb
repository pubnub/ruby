require 'spec_helper'

describe 'Using multiple cipher keys' do

  around :each do |example|
    example.run
  end

  it 'works with publish' do
    @pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo, cipher_key: 'this_doesnt_fit_anywhere')

    VCR.use_cassette('lib/multiple_ciphers', record: :once) do
      # Fetch current timestamp
      @pubnub.subscribe(channel: :multiple_cipher_test, http_sync: true)

      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Some test message',
        cipher_key: 'super_secret',
        http_sync: true
      )

      e0 = @pubnub.subscribe(
        channel: :multiple_cipher_test,
        cipher_key: 'super_secret',
        http_sync: true
      ).first

      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Another test message',
        cipher_key: 'another_secret',
        http_sync: true
      )

      e1 = @pubnub.subscribe(
        channel: :multiple_cipher_test,
        cipher_key: 'another_secret',
        http_sync: true
      ).first

      expect(e0.result[:data][:message]).to eq 'Some test message'
      expect(e1.result[:data][:message]).to eq 'Another test message'
    end
  end

  it 'works with history' do
    @pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo, cipher_key: 'this_doesnt_fit_anywhere')

    VCR.use_cassette('lib/multiple_ciphers_history', record: :once) do
      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Some test message',
        cipher_key: 'super_secret',
        http_sync: true
      )

      e0 = @pubnub.history(
        channel: :multiple_cipher_test,
        cipher_key: 'super_secret',
        count: 1,
        http_sync: true
      )

      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Another test message',
        cipher_key: 'another_secret',
        http_sync: true
      )

      e1 = @pubnub.history(
        channel: :multiple_cipher_test,
        cipher_key: 'another_secret',
        count: 1,
        http_sync: true
      )

      expect(e0.result[:data][:messages].first).to eq 'Some test message'
      expect(e1.result[:data][:messages].first).to eq 'Another test message'
    end
  end

  it 'works with async history' do
    @pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo, cipher_key: 'this_doesnt_fit_anywhere')

    VCR.use_cassette('lib/multiple_ciphers_history', record: :once) do
      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Some test message',
        cipher_key: 'super_secret',
        http_sync: true
      )

      e0 = @pubnub.history(
        channel: :multiple_cipher_test,
        cipher_key: 'super_secret',
        count: 1
      ).value

      @pubnub.publish(
        channel: :multiple_cipher_test,
        message: 'Another test message',
        cipher_key: 'another_secret',
        http_sync: true
      )

      e1 = @pubnub.history(
        channel: :multiple_cipher_test,
        cipher_key: 'another_secret',
        count: 1
      ).value

      expect(e0.result[:data][:messages].first).to eq 'Some test message'
      expect(e1.result[:data][:messages].first).to eq 'Another test message'
    end
  end
  
  it 'works with asynchronous subscribe and callable cipher key argument' do
    @message = nil
    cb = Pubnub::SubscribeCallback.new(
      message: ->(envelope){ @message = envelope.result[:data][:message] }
    )

    ciphers = {
      'some-uuid' => 'secret'
    }

    lambda_cipher_key = ->(data) do
      ciphers[data[:issuing_client_id]]
    end

    @pubnub = Pubnub.new(subscribe_key: :demo, publish_key: :demo, cipher_key_selector: lambda_cipher_key)
    @pubnub.add_listener(callback: cb)

    VCR.use_cassette('lib/callable_cipher_key', record: :once) do
      @pubnub.subscribe(channel: :multiple_cipher_test)
      sleep(1)
      expect(@message).to eq('hello ruby!')
    end
  end

end