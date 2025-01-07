require 'helpers/spec_helper'

describe Pubnub::FetchMessages do
  around :each do |example|
    @fired_count = 0
    @fired = false

    @callbacks = -> (_envelope) do
      @fired = true
      @fired_count += 1
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one"
    )

    example.run_with_retry retry: 10
  end

  it "fetch_encrypted_messages_and_decrypt_with_same_key" do
    VCR.use_cassette("examples/fetch_messages/crypto_1", :record => :once) do
      client = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: "sub-a-mock-key",
        user_id: "ruby-test-uuid-client-one",
        cipher_key: "enigma",
        random_iv: false
      )

      client.publish(channel: 'crypto_channel_11', message: 'Hello world', http_sync: true)
      envelope = client.fetch_messages(channel: 'crypto_channel_11', include_meta: true, http_sync: true)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "crypto_channel_11" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello world",
                                                   "timetoken" => "17349935060951245",
                                                   "meta" => "",
                                                   "uuid" => "ruby-test-uuid-client-one"
                                                 }
                                               ] } })
      expect(envelope.result[:data][:channels]["crypto_channel_11"][0]['decrypt_error']).to be_nil
    end
  end

  it "fetch_encrypted_messages_and_decrypt_with_different_key" do
    VCR.use_cassette("examples/fetch_messages/crypto_2", :record => :once) do
      client = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: "sub-a-mock-key",
        user_id: "ruby-test-uuid-client-one",
        cipher_key: "enigma",
        random_iv: false
      )

      client.publish(channel: 'crypto_channel_12', message: 'Hello world', http_sync: true)
      envelope = client.fetch_messages(channel: 'crypto_channel_12', include_meta: true, cipher_key: "some-key", http_sync: true)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "crypto_channel_12" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "8vAFZgup2Ejp2Ny0d1iFlA==",
                                                   "timetoken" => "17349962808689637",
                                                   "meta" => "",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                   "decrypt_error" => true
                                                 }
                                               ] } })
      expect(envelope.result[:data][:channels]["crypto_channel_12"][0]['decrypt_error']).not_to be_nil
      expect(envelope.result[:data][:channels]["crypto_channel_12"][0]['decrypt_error']).to eq true
    end
  end

  it "fetch_decrypted_messages_and_decrypt_with_some_key" do
    VCR.use_cassette("examples/fetch_messages/crypto_3", :record => :none) do
      client = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: "sub-a-mock-key",
        user_id: "ruby-test-uuid-client-one",
      )
      client.publish(channel: 'crypto_channel_13', message: 'Hello world', http_sync: true)

      client = Pubnub.new(
        publish_key: "pub-a-mock-key",
        subscribe_key: "sub-a-mock-key",
        user_id: "ruby-test-uuid-client-one",
        cipher_key: "enigma",
        random_iv: false
      )
      envelope = client.fetch_messages(channel: 'crypto_channel_13', include_meta: true, http_sync: true)

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "crypto_channel_13" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello world",
                                                   "timetoken" => "17349965578958470",
                                                   "meta" => "",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                   "decrypt_error" => true
                                                 }
                                               ] } })
      expect(envelope.result[:data][:channels]["crypto_channel_13"][0]['decrypt_error']).not_to be_nil
      expect(envelope.result[:data][:channels]["crypto_channel_13"][0]['decrypt_error']).to eq true
    end
  end

  it "__channel__demo1___max__5__start__nil___end__nil___include_uuid__false___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__nil___encrypted__true___random_iv__false_" do
    client = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "enigma",
      random_iv: false
    )

    VCR.use_cassette("examples/fetch_messages/includes_timetoken__encrypted", :record => :once) do
      envelope = client.fetch_messages(channel: :demo1, max: 5, include_uuid: false, include_message_type: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo1" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358219988967436",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo2___max__5__start__nil___end__nil___include_uuid__false___include_meta__true___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__nil___encrypted__true___random_iv__false_" do
    client = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "enigma",
      random_iv: false
    )

    VCR.use_cassette("examples/fetch_messages/includes_timetoken_meta__encrypted", :record => :once) do
      envelope = client.fetch_messages(channel: :demo2, max: 5, include_meta: true, include_message_type: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(client.env[:random_iv]).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo2" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358225492756148",
                                                   "meta" => "",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo3___max__5__start__nil___end__nil___include_uuid__false___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__nil___encrypted__true___random_iv__true_" do
    client = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "enigma"
    )

    VCR.use_cassette("examples/fetch_messages/includes_timetoken__encrypted_random_iv", :record => :once) do
      envelope = client.fetch_messages(channel: :demo3, max: 5, include_uuid: false, include_message_type: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(client.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo3" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358231927702305",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo4___max__5__start__nil___end__nil___include_uuid__false___include_meta__true___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__nil___encrypted__true___random_iv__true_" do
    client = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
      cipher_key: "enigma"
    )

    VCR.use_cassette("examples/fetch_messages/includes_timetoken_meta__encrypted_random_iv", :record => :once) do
      envelope = client.fetch_messages(channel: :demo4, max: 5, include_meta: true, include_message_type: false, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false
      expect(client.env[:random_iv]).to eq true

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo4" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358232426883204",
                                                   "meta" => "",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo5___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__block_" do
    VCR.use_cassette("examples/fetch_messages/001", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo5, max: 5, include_message_type: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo5" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358238908727372",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo6___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__lambda_" do
    VCR.use_cassette("examples/fetch_messages/002", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo6, max: 5, include_message_type: false, http_sync: true, callback: @callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo6" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358241251780089",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo7___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__false___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/003", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo7, max: 5, include_message_type: false, http_sync: false)
      envelope = envelope.value
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo7" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358243458698960",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo5___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__false___include_custom_message_type__false__http_sync__true___callback__block_" do
    VCR.use_cassette("examples/fetch_messages/001", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo5, max: 5, include_message_type: false, http_sync: true, &@callback)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo5" => [
                                                 {
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358238908727372",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo8___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/004", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo8, max: 5, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo8" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358245492878895",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channels__demo81__demo82___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/012", :record => :once) do
      envelope = @pubnub.fetch_messages(channels: [:demo81, :demo82], max: 5, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo81" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world #1",
                                                   "timetoken" => "17358270444202300",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ],
                                               "demo82" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world #2",
                                                   "timetoken" => "17358270446282208",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo9___max__5__start__17358247130477500___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/005", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo9, max: 5, start: 17358247130477500, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo9" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358247130477497",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo9___max__5__start__nil___end__17358247130477497___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/006", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo9, max: 5, end: 17358247130477497, http_sync:
        true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo9" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358247130477497",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo9___max__5__start__17358247130477500___end__17358247130477497___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/007", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo9, max: 5, start: 17358247130477500, end: 17358247130477497, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo9" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358247130477497",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  # Should be empty because message is outside of time frame
  it "__channel__demo9___max__5__start__17358247130477500___end__17358247130477499___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/008", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo9, max: 5, start: 17358247130477500, end: 17358247130477499, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({ :channels => {} })
    end
  end

  it "__channel__demo10___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__false___include_message_type__true___include_custom_message_type__true__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/009", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo10, max: 5, include_custom_message_type: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo10" => [
                                                 {
                                                   "message_type" => nil,
                                                   "custom_message_type" => "test-message",
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358258318114737",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo11___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__true___include_message_type__true___include_custom_message_type__false__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/010", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo11, max: 5, include_message_actions: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages_with_actions)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo11" => [
                                                 {
                                                   "message_type" => nil,
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358260843589976",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                   "actions" => {
                                                     "emotion" => {
                                                       "smile" => [
                                                         {
                                                           "uuid" => "ruby-test-uuid-client-one",
                                                           "actionTimetoken" => "17358261688855020"
                                                         }
                                                       ]
                                                     }
                                                   }
                                                 }
                                               ] } })
    end
  end

  it "__channel__demo12___max__5__start__nil___end__nil___include_uuid__true___include_meta__false___include_message_actions__true___include_message_type__true___include_custom_message_type__true__http_sync__true___callback__nil_" do
    VCR.use_cassette("examples/fetch_messages/011", :record => :once) do
      envelope = @pubnub.fetch_messages(channel: :demo12, max: 5, include_custom_message_type: true, include_message_actions: true, http_sync: true)
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({ :tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com" })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:fetch_messages_with_actions)
      expect(envelope.result[:data]).to eq({
                                             :channels => {
                                               "demo12" => [
                                                 {
                                                   "message_type" => nil,
                                                   "custom_message_type" => "test-message",
                                                   "message" => "Hello test world",
                                                   "timetoken" => "17358267017319817",
                                                   "uuid" => "ruby-test-uuid-client-one",
                                                   "actions" => {
                                                     "emotion" => {
                                                       "smile" => [
                                                         {
                                                           "uuid" => "ruby-test-uuid-client-one",
                                                           "actionTimetoken" => "17358267466158610"
                                                         }
                                                       ]
                                                     }
                                                   }
                                                 }
                                               ] } })
    end
  end
end