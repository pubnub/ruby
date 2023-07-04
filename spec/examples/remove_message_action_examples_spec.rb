require 'helpers/message_actions/message_actions_helper'

describe Pubnub::RemoveMessageAction do
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

  it "001_channel___remove-chat11___message_timetoken___valid___action_timetoken___valid___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/remove_001", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat11', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat11',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens.last,
        http_sync: true
      )
      message_actions_envelope = @pubnub.get_message_actions(channel: 'remove-chat11', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
      expect(message_actions_envelope.result[:data][:message_actions].length).to eq(2)
      expect(message_actions_envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens[-2])
    end
  end

  it "002_channel___remove-chat21___message_timetoken___valid___action_timetoken___valid___http_sync___true___callback___block__" do
    VCR.use_cassette("examples/message_actions/remove_002", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat21', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat21',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens[0],
        http_sync: true,
        &@callback
      )
      message_actions_envelope = @pubnub.get_message_actions(channel: 'remove-chat21', http_sync: true)

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
      expect(message_actions_envelope.result[:data][:message_actions].length).to eq(2)
      expect(message_actions_envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens.last)
    end
  end

  it "003_channel___remove-chat31___message_timetoken___valid___action_timetoken___valid___http_sync___true___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/remove_003", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat31', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat31',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens[1],
        http_sync: true,
        callback: @callback
      )

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
    end
  end

  it "004_channel___remove-chat41___message_timetoken___valid___action_timetoken___valid___http_sync___false___callback___nil__" do
    VCR.use_cassette("examples/message_actions/remove_004", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat41', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat41',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens.last,
        http_sync: false
      )
      envelope = envelope.value
      message_actions_envelope = @pubnub.get_message_actions(channel: 'remove-chat41', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
      expect(message_actions_envelope.result[:data][:message_actions].length).to eq(2)
      expect(message_actions_envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens[-2])
    end
  end

  it "005_channel___remove-chat51___message_timetoken___valid___action_timetoken___valid___http_sync___false___callback___block__" do
    VCR.use_cassette("examples/message_actions/remove_005", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat51', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat51',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens[0],
        http_sync: false,
        &@callback
      )
      envelope = envelope.value
      message_actions_envelope = @pubnub.get_message_actions(channel: 'remove-chat51', http_sync: true)

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
      expect(message_actions_envelope.result[:data][:message_actions].length).to eq(2)
      expect(message_actions_envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens.last)
    end
  end

  it "006_channel___remove-chat61___message_timetoken___valid___action_timetoken___valid___http_sync___false___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/remove_006", record: :once) do
      publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'remove-chat61', 1, 3, VCR.current_cassette.recording?
      envelope = @pubnub.remove_message_action(
        channel: 'remove-chat61',
        message_timetoken: publish_timetokens[0],
        action_timetoken: action_timetokens[0],
        http_sync: false,
        callback: @callback
      )
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:remove_message_action)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:remove_message_action)
    end
  end
end