require "spec_helper"

describe Pubnub::SetUuidMetadata do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end

    it "set_uuid_metadata_works_1" do
      VCR.use_cassette("lib/events/set_uuid_metadata1", record: :once) do
        envelope = @pubnub.set_uuid_metadata(
          uuid: "mg",
          metadata: { name: "magnum", custom: { XXX: "YYYY" } },
          include: { custom: true }
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "set_uuid_metadata_works_2" do
      VCR.use_cassette("lib/events/set_uuid_metadata2", record: :once) do
        envelope = @pubnub.set_uuid_metadata(
          metadata: { name: "magnum", custom: { XXX: "YYYY" } },
          include: { custom: true }
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_uuid_metadata_works_1" do
      VCR.use_cassette("lib/events/get_uuid_metadata1", record: :once) do
        envelope = @pubnub.get_uuid_metadata(uuid: "mg", include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_uuid_metadata_works_2" do
      VCR.use_cassette("lib/events/get_uuid_metadata2", record: :once) do
        envelope = @pubnub.get_uuid_metadata(include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_all_uuid_metadata_works" do
      VCR.use_cassette("lib/events/get_all_uuid_metadata", record: :once) do
        envelope = @pubnub.get_all_uuid_metadata(limit: 5, include: { custom: true }).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "remove_uuid_metadata_works_1" do
      VCR.use_cassette("lib/events/remove_uuid_metadata1", record: :once) do
        envelope = @pubnub.remove_uuid_metadata(uuid: "mg").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "remove_uuid_metadata_works_2" do
      VCR.use_cassette("lib/events/remove_uuid_metadata2", record: :once) do
        envelope = @pubnub.remove_uuid_metadata.value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end
