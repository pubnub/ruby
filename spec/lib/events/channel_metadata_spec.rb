require 'helpers/spec_helper'

describe Pubnub::SetChannelMetadata do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid"
      )
    end

    it "set_channel_metadata_works" do
      VCR.use_cassette("lib/events/set_channel_metadata", record: :once) do
        envelope = @pubnub.set_channel_metadata(
          channel: "rb_channel",
          metadata: { name: "some_name", custom: { XXX: "YYYY" } },
          include: { custom: true }
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_channel_metadata_works" do
      VCR.use_cassette("lib/events/get_channel_metadata", record: :once) do
        envelope = @pubnub.get_channel_metadata(channel: "rb_channel", include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_all_channels_metadata_works" do
      VCR.use_cassette("lib/events/get_all_channels_metadata", record: :once) do
        envelope = @pubnub.get_all_channels_metadata(limit: 5, include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "remove_channel_metadata_works" do
      VCR.use_cassette("lib/events/remove_channel_metadata", record: :once) do
        envelope = @pubnub.remove_channel_metadata(channel: "rb_channel").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

  end

end
