require 'helpers/spec_helper'

describe Pubnub::AddMessageAction do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      subscribe_key: "sub-a-mock-key",
      publish_key: "pub-a-mock-key",
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one"
    )

    example.run_with_retry retry: 1
  end

  # Should succeed with new message.
  it "001_channel___chat1___type___emotion___value___emotion____message_timetoken___valid___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/add_001", record: :once) do
      message_timetoken = @pubnub.publish(channel: 'chat1', message:'Hello world', http_sync: true).timetoken.to_i
      envelope = @pubnub.add_message_action(
        channel: 'chat1',
        type: 'emotion',
        value: 'smile',
        message_timetoken: message_timetoken,
        http_sync: true
      )

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end

  # Should fail with message, which already have same action from same user.
  it "002_channel___chat1___type___emotion___value___emotion____message_timetoken___previous_timetoken___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/add_002", record: :once) do
      message_timetoken = @pubnub.publish(channel: 'chat1', message:'Hello world', http_sync: true).timetoken.to_i
      @pubnub.add_message_action(
        channel: 'chat1',
        type: 'emotion',
        value: 'smile',
        message_timetoken: message_timetoken,
        http_sync: true
      )

      envelope = @pubnub.add_message_action(
        channel: 'chat1',
        type: 'emotion',
        value: 'smile',
        message_timetoken: message_timetoken,
        http_sync: true
      )

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq true

      expect(envelope.status[:code]).to eq(409)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:error)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })
    end
  end

  it "003_channel___chat2___type___emotion___value___emotion____message_timetoken___valid___http_sync___true___callback___block__" do
    VCR.use_cassette("examples/message_actions/add_003", record: :once) do
      publish_envelope = @pubnub.publish(channel: 'chat2', message:'Hello world', http_sync: true)
      envelope = @pubnub.add_message_action(
        channel: 'chat2',
        type: 'emotion',
        value: 'smile',
        message_timetoken: publish_envelope.timetoken.to_i,
        http_sync: true,
        &@callback
      )

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end

  it "004_channel___chat3___type___emotion___value___emotion____message_timetoken___valid___http_sync___true___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/add_004", record: :once) do
      publish_envelope = @pubnub.publish(channel: 'chat3', message:'Hello world', http_sync: true)
      envelope = @pubnub.add_message_action(
        channel: 'chat3',
        type: 'emotion',
        value: 'smile',
        message_timetoken: publish_envelope.timetoken.to_i,
        http_sync: true,
        callback: @callback
      )

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end

  it "005_channel___chat1___type___emotion___value___emotion____message_timetoken___valid___http_sync___false___callback___nil__" do
    VCR.use_cassette("examples/message_actions/add_005", record: :once) do
      publish_envelope = @pubnub.publish(channel: 'chat1', message:'Hello world', http_sync: true)
      envelope = @pubnub.add_message_action(
        channel: 'chat1',
        type: 'emotion',
        value: 'smile',
        message_timetoken: publish_envelope.timetoken.to_i,
        http_sync: false
      )
      envelope = envelope.value

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end

  it "006_channel___chat2___type___emotion___value___emotion____message_timetoken___valid___http_sync___true___callback___block__" do
    VCR.use_cassette("examples/message_actions/add_006", record: :once) do
      publish_envelope = @pubnub.publish(channel: 'chat2', message:'Hello world', http_sync: true)
      envelope = @pubnub.add_message_action(
        channel: 'chat2',
        type: 'emotion',
        value: 'smile',
        message_timetoken: publish_envelope.timetoken.to_i,
        http_sync: false,
        &@callback
      )
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end

  it "007_channel___chat3___type___emotion___value___emotion____message_timetoken___valid___http_sync___false___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/add_007", record: :once) do
      publish_envelope = @pubnub.publish(channel: 'chat3', message:'Hello world', http_sync: true)
      envelope = @pubnub.add_message_action(
        channel: 'chat3',
        type: 'emotion',
        value: 'smile',
        message_timetoken: publish_envelope.timetoken.to_i,
        http_sync: false,
        callback: @callback
      )
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:add_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:add_message_action)
    end
  end
end