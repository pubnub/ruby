require 'helpers/spec_helper'

describe Pubnub::AddMessageAction do
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

    it "should get message actions" do
      VCR.use_cassette("lib/events/get_message_action", record: :once) do
        envelope = @pubnub.get_message_actions(
          channel: 'chat',
          start: 16702324246781850,
          limit: 100
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it 'should return proper error in case of failure' do
      VCR.use_cassette("lib/events/get_message_action-error", record: :once) do
        envelope = @pubnub.get_message_actions(
          channel: 'chat',
          limit: 100
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it 'should raise exception when channel is missing' do
      expect {
        @pubnub.add_message_action(type: 'emotion', value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end
  end
end