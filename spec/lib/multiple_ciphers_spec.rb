require 'spec_helper'

describe 'Using multiple cipher keys' do

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
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

  context 'with history' do

  end

end