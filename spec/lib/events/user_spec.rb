require "spec_helper"

describe Pubnub::CreateUser do
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
    it "create_user_works" do
      VCR.use_cassette("lib/events/create_user", record: :once) do
        envelope = @pubnub.create_user(data:{
          id: "mg",
          name: "magnum",
          custom: {
            XXX: "YYYY"
          }
        }, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "update_user_works" do
      VCR.use_cassette("lib/events/update_user", record: :once) do
        envelope = @pubnub.update_user(user_id: "mg",
        data:{
          id: "mg",
          name: "magnum_1",
          custom: {
            XXX: "YYYY"
          }
        }, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_user_works" do
      VCR.use_cassette("lib/events/get_user", record: :once) do
        envelope = @pubnub.get_user(user_id: "mg", include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_users_works", :focus => true do
      VCR.use_cassette("lib/events/get_users", record: :once) do
        envelope = @pubnub.get_users(limit: 5, include: "custom").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "delete_user_works" do
      VCR.use_cassette("lib/events/delete_user", record: :once) do
        envelope = @pubnub.delete_user(user_id: "mg").value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

  end

end
