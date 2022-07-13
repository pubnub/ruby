require "spec_helper"

describe Pubnub::GrantToken do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: "pub-a-mock-key",
      subscribe_key: "sub-a-mock-key",
      secret_key: "sec-a-mock-key",
      uuid: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one",
    )

    example.run_with_retry retry: 10
  end

  it "__channel___demo____group__nil___read__false___write__false___manage__false___ttl__300___auth_key__nil___http_sync__true___callback___block_" do
    VCR.use_cassette("examples/grant_token/1", record: :none) do
      Pubnub::Grant.any_instance.stub(:current_time).and_return "1657795717"
      Pubnub::Grant.any_instance.stub(:signature).and_return "v2.dOOoWVBHwrRw3kXQ37gWR1De6TlufWW_ccWaLFMhaSw"
      envelope = @pubnub.grant_token(
        ttl: 60,
        authorized_user_id: "authorized_user_id",
        spaces_permissions: {
          "id": Pubnub::Permissions.res(read: true),
          "whatever.*": Pubnub::Permissions.pat(read: true, write: true)
        },
        users_permissions: {
          "user1": Pubnub::Permissions.res(update: true),
          "users.*": Pubnub::Permissions.pat(create: true, delete: true),
        },
        http_sync: true,
        &@callback
      )
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({:tls => false, :uuid => "ruby-test-uuid-client-one", :auth_key => "ruby-test-auth-client-one", :origin => "ps.pndsn.com"})

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:grant_token)
    end
  end

end
