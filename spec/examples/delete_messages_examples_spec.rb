require "spec_helper"

describe Pubnub::ChannelRegistration do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  context "whatever" do
    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end

    it "works with just channel specified" do
      VCR.use_cassette("examples/delete_messages_channel", record: :once) do
        envelope = pubnub.delete_messages(channel: :demo)
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it "works with channel which contains non-URL friendly characters" do
      VCR.use_cassette("examples/delete_messages_channel_non_url_friendly_name", record: :once) do
        envelope = pubnub.delete_messages(channel: 'demo@pubnub')
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it "works with channel and start specified" do
      VCR.use_cassette("examples/delete_messages_channel_start", record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, start: "15040071432538531")
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it "works with channel, start and end specified" do
      VCR.use_cassette("examples/delete_messages_channel_start_end", record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, start: "1504003597000", end: "1504007197000")
        expect(envelope.value.status[:code]).to eq 200
      end
    end

    it "works with channel and end specified" do
      VCR.use_cassette("examples/delete_messages_channel_end", record: :once) do
        envelope = pubnub.delete_messages(channel: :demo, end: "15040071432538531")
        expect(envelope.value.status[:code]).to eq 200
      end
    end
  end
end
