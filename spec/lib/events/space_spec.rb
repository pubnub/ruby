require "spec_helper"

describe Pubnub::CreateSpace do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "demo",
        publish_key: "demo",
        auth_key: "ruby-test-auth",
        uuid: "ruby-test-uuid",
      )
    end
    it "create_space_works" do
      VCR.use_cassette("lib/events/create_space", record: :once) do
        envelope = @pubnub.create_space(data:{
          id: "rb_space",
          name: "some_name",
          custom: {
            XXX: "YYYY"
          }
        }, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "update_space_works" do
      VCR.use_cassette("lib/events/update_space", record: :once) do
        envelope = @pubnub.update_space(space_id: "rb_space",
         data:{
           id: "rb_space",
           name: "new_name",
           custom: {
             XXX: "YYYY"
           }
         }, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_space_works" do
      VCR.use_cassette("lib/events/get_space", record: :once) do
        envelope = @pubnub.get_space(space_id: "rb_space", include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_spaces_works" do
      VCR.use_cassette("lib/events/get_spaces", record: :once) do
        envelope = @pubnub.get_spaces(limit: 5, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "delete_space_works" do
      VCR.use_cassette("lib/events/delete_space", record: :once) do
        envelope = @pubnub.delete_space(space_id: "rb_space").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

  end

end
