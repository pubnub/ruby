require "spec_helper"

describe Pubnub::ManageMemberships do
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
    it "get_members_works" do
      VCR.use_cassette("lib/events/get_members", record: :once) do
        envelope = @pubnub.get_members(space_id: "space-1", include: "custom", count: true).value
        puts "get_members_works"
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "get_space_memberships_works" do
      VCR.use_cassette("lib/events/get_space_memberships", record: :once) do
        envelope = @pubnub.get_space_memberships(user_id: "mg3", include: "custom", count: true).value
        puts "get_space_memberships_works"
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "manage_memberships_add_works" do
      VCR.use_cassette("lib/events/manage_memberships_add", record: :once) do
        envelope = @pubnub.manage_memberships(user_id: "mg3", data: {'add': [{'id': 'space-1'}]}, include: "custom").value
        puts "manage_memberships_add_works"
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
    it "manage_memberships_remove_works" do
      VCR.use_cassette("lib/events/manage_memberships_remove", record: :once) do
        envelope = @pubnub.manage_memberships(user_id: "mg3", data: {'remove': [{'id': 'space-1'}]}, include: "custom").value
        puts "manage_memberships_remove_works"
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it "manage_members_add_works" do
      VCR.use_cassette("lib/events/manage_members_add", record: :once) do
        envelope = @pubnub.manage_members(space_id: "space-1", data: {'add': [{'id': 'mg2'}]}, include: "custom").value
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
    it "manage_members_remove_works" do
      VCR.use_cassette("lib/events/manage_members_remove", record: :once) do
        envelope = @pubnub.manage_members(space_id: "space-1", data: {'remove': [{'id': 'mg2'}]}, include: "custom").value
        puts "manage_members_remove"
        puts envelope.inspect
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

  end

end
