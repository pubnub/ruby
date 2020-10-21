require "spec_helper"

describe Pubnub::SetMemberships do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
        )
    end

    it "get_channel_members_works" do
      VCR.use_cassette("lib/events/get_channel_members", record: :once) do
        envelope = @pubnub.get_channel_members(channel: "channel-1", include: { count: true, custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_memberships_works" do
      VCR.use_cassette("lib/events/get_memberships", record: :once) do
        envelope = @pubnub.get_memberships(uuid: "mg3", include: { count: true, custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "set_memberships_works" do
      VCR.use_cassette("lib/events/set_memberships", record: :once) do
        envelope = @pubnub.set_memberships(uuid: "mg3", channels: [{ 'channel': 'channel-1'}], include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "remove_memberships_works" do
      VCR.use_cassette("lib/events/remove_memberships", record: :once) do
        envelope = @pubnub.remove_memberships(uuid: "mg3", channels: [{ 'channel': 'channel-1'}], include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "set_channel_members_works" do
      VCR.use_cassette("lib/events/set_channel_members", record: :once) do
        envelope = @pubnub.set_channel_members(channel: "channel-1", uuids: [{'uuid': 'mg2'}], include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "remove_channel_members_works" do
      VCR.use_cassette("lib/events/remove_channel_members", record: :once) do
        envelope = @pubnub.remove_channel_members(channel: "channel-1", uuids: [{'uuid': 'mg2'}], include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

  end

end
