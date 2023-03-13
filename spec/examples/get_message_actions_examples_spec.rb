require 'helpers/message_actions/message_actions_helper'
require 'yaml'

describe Pubnub::GetMessageActions do
  around :each do |example|
    @fired = false

    @callback = -> (_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: 'pub-a-mock-key',
      subscribe_key: 'sub-a-mock-key',
      user_id: "ruby-test-uuid-client-one",
      auth_key: "ruby-test-auth-client-one"
    )

    example.run_with_retry retry: 1
  end

  it "should_not_crash_when_secret_key_is_set" do
    VCR.use_cassette("examples/message_actions/get_000", record: :once) do
      offset_from_start = 2
      offset_from_end = 3
      pubnub = Pubnub.new(
        publish_key: 'pub-a-mock-key',
        subscribe_key: 'sub-a-mock-key',
        secret_key: 'sec-a-mock-key',
        user_id: "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one"
      )

      _publish_timetokens, action_timetokens = prepare_message_actions_test pubnub, 'get-chat0', 3, 8, VCR.current_cassette.recording?
      envelope = nil

      expect {
        puts 'Call it!'
        envelope = pubnub.get_message_actions(
          channel: 'get-chat0',
          start: action_timetokens[-offset_from_end],
          end: action_timetokens[offset_from_start],
          http_sync: true
        )
      }.not_to raise_error

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
    end
  end

  it "001_channel___get-chat1___start___nil___end___nil____limit___nil___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/get_001", record: :once) do
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat1', 3, 8, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(channel: 'get-chat1', http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(action_timetokens.length)
      expect(envelope.result[:data][:more]).to be_nil
    end
  end

  # This test allow to test 'more' feature when not all. Actual check for new cassette will be on second run.
  it "002_channel___get-chat2___start___nil___end___nil____limit___3___http_sync___true___callback___nil__" do
    maximum_number_of_actions = 3
    cassette_just_recorded = false
    action_timetokens = []
    cassette_path = nil

    VCR.use_cassette("examples/message_actions/get_002", record: :once) do
      cassette_just_recorded = VCR.current_cassette.recording?
      cassette_path = VCR.current_cassette.file
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat2', 3, 8, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(channel: 'get-chat2', limit: maximum_number_of_actions, http_sync: true)

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(maximum_number_of_actions)

      unless VCR.current_cassette.recording?
        expect(envelope.result[:data][:more]).not_to be_nil
        expect(envelope.result[:data][:more][:url]).to be_nil
        expect(envelope.result[:data][:more][:start]).to eq(action_timetokens[-maximum_number_of_actions-1])
        expect(envelope.result[:data][:more][:end]).to eq(action_timetokens[0])
        expect(envelope.result[:data][:more][:limit]).to eq(action_timetokens.length - maximum_number_of_actions)
      end
    end

    # Modify recently recorded cassette to simulate 'more' in response (hard to get real value).
    if cassette_just_recorded
      cassette = YAML.load_file cassette_path
      last_response = JSON.parse(cassette['http_interactions'].last['response']['body']['string']).transform_keys(&:to_sym)
      unless last_response.key?(:more)
        puts 'Add \'more\' key with information'
        last_response[:more] = {
          url: 'https://pubnub.com',
          end: action_timetokens[0],
          start: action_timetokens[-maximum_number_of_actions-1],
          limit: action_timetokens.length - maximum_number_of_actions
        }
        cassette['http_interactions'].last['response']['body']['string'] = last_response.to_json
        File.open(cassette_path, 'w') { |file| YAML.dump(cassette, file) }
      end
    end
  end

  # Use timetoken of one of message actions as start.
  it "003_channel___get-chat3___start___valid___end___nil____limit___nil___http_sync___true___callback___block__" do
    VCR.use_cassette("examples/message_actions/get_003", record: :once) do
      offset_from_end = 3
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat3', 3, 8, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat3',
        start: action_timetokens[-offset_from_end],
        http_sync: true,
        &@callback
      )

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(action_timetokens.length - offset_from_end)
      expect(envelope.result[:data][:more]).to be_nil
    end
  end

  # Use timetoken of one of message actions as end.
  it "004_channel___get-chat4___start___nil___end___valid____limit___nil___http_sync___true___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/get_004", record: :once) do
      offset_from_start = 2
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat4', 3, 8, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat4',
        end: action_timetokens[offset_from_start],
        http_sync: true,
        callback: @callback
      )

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(action_timetokens.length - offset_from_start)
      expect(envelope.result[:data][:more]).to be_nil
    end
  end

  # Use timetoken of few of message actions as range for start..end.
  it "005_channel___get-chat5___start___valid___end___valid____limit___nil___http_sync___false___callback___nil__" do
    VCR.use_cassette("examples/message_actions/get_005", record: :once) do
      offset_from_start = 2
      offset_from_end = 3
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat5', 3, 8, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat5',
        start: action_timetokens[-offset_from_end],
        end: action_timetokens[offset_from_start],
        http_sync: false
      )
      envelope = envelope.value

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(action_timetokens.length - (offset_from_start + offset_from_end))
      expect(envelope.result[:data][:more]).to be_nil
    end
  end

  it "006_channel___get-chat5___start___nil___end___nil____limit___6___http_sync___false___callback___block__" do
    VCR.use_cassette("examples/message_actions/get_006", record: :once) do
      maximum_number_of_actions = 6
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat6', 3, 12, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(channel: 'get-chat6', limit: maximum_number_of_actions, http_sync: false, &@callback)
      envelope = envelope.value

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(maximum_number_of_actions)
      expect(envelope.result[:data][:message_actions][0][:action_timetoken]).to eq(action_timetokens[-maximum_number_of_actions])
      expect(envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens.last)
      expect(envelope.result[:data][:more]).to be_nil

    end
  end

  # Use timetoken of one of message actions as start.
  it "007_channel___get-chat7___start___valid___end___nil____limit___3___http_sync___false___callback___lambda__" do
    VCR.use_cassette("examples/message_actions/get_007", record: :once) do
      maximum_number_of_actions = 3
      offset_from_end = 7
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat7', 4, 14, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat7',
        start: action_timetokens[-offset_from_end],
        limit: maximum_number_of_actions,
        http_sync: false,
        callback: @callback
      )
      envelope = envelope.value

      # Ensure that limit is smaller than expected actions count with start query parameter set.
      expect(action_timetokens.length - offset_from_end).to satisfy { |n| n > maximum_number_of_actions }

      expect(@fired).to eq true
      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(maximum_number_of_actions)
      expect(envelope.result[:data][:message_actions][0][:action_timetoken]).to eq(action_timetokens[-offset_from_end-maximum_number_of_actions])
      expect(envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens[-offset_from_end-1])
      expect(envelope.result[:data][:more]).to be_nil
    end
  end


  # Use timetoken of one of message actions as end.
  xit "008_channel___get-chat8___start___valid___end___nil____limit___2___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/get_008", record: :once) do
      maximum_number_of_actions = 2
      offset_from_start = 8
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat8', 4, 14, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat8',
        end: action_timetokens[offset_from_start],
        limit: maximum_number_of_actions,
        http_sync: true
      )

      # Ensure that limit is smaller than expected actions count with end query parameter set.
      expect(action_timetokens.length - offset_from_start).to satisfy { |n| n > maximum_number_of_actions }

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(maximum_number_of_actions)
      expect(envelope.result[:data][:message_actions][0][:action_timetoken]).to eq(action_timetokens[offset_from_start])
      expect(envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens[offset_from_start + maximum_number_of_actions])
      expect(envelope.result[:data][:more]).to be_nil
    end
  end


  # Use timetoken of few of message actions as range for start..end.
  it "009_channel___get-chat9___start___valid___end___valid____limit___5___http_sync___true___callback___nil__" do
    VCR.use_cassette("examples/message_actions/get_009", record: :once) do
      maximum_number_of_actions = 5
      offset_from_start = 4
      offset_from_end = 3
      _publish_timetokens, action_timetokens = prepare_message_actions_test @pubnub, 'get-chat9', 4, 16, VCR.current_cassette.recording?
      envelope = @pubnub.get_message_actions(
        channel: 'get-chat9',
        start: action_timetokens[-offset_from_end],
        end: action_timetokens[offset_from_start],
        limit: maximum_number_of_actions,
        http_sync: true
      )

      # Ensure that limit is smaller than expected actions count with end query parameter set.
      expect(action_timetokens.length - (offset_from_start + offset_from_end)).to satisfy { |n| n > maximum_number_of_actions }

      expect(envelope.is_a?(Pubnub::Envelope)).to eq true
      expect(envelope.error?).to eq false

      expect(envelope.status[:code]).to eq(200)
      expect(envelope.status[:operation]).to eq(:get_message_actions)
      expect(envelope.status[:category]).to eq(:ack)
      expect(envelope.status[:config]).to eq({
        :tls => false,
        :uuid => "ruby-test-uuid-client-one",
        auth_key: "ruby-test-auth-client-one",
        :origin => "ps.pndsn.com"
      })

      expect(envelope.result[:code]).to eq(200)
      expect(envelope.result[:operation]).to eq(:get_message_actions)
      expect(envelope.result[:data][:message_actions].length).to eq(maximum_number_of_actions)
      expect(envelope.result[:data][:message_actions][0][:action_timetoken]).to eq(action_timetokens[-offset_from_end - maximum_number_of_actions])
      expect(envelope.result[:data][:message_actions].last[:action_timetoken]).to eq(action_timetokens[-offset_from_end - 1])
      expect(envelope.result[:data][:more]).to be_nil
    end
  end
end