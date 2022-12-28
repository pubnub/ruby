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

    it "should remove message action" do
      VCR.use_cassette("lib/events/remove_message_action", record: :once) do
        envelope = @pubnub.remove_message_action(
          channel: 'chat',
          message_timetoken: 16702463528031534,
          action_timetoken: 16702463913845610
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it 'should return proper error in case of failure' do
      VCR.use_cassette("lib/events/remove_message_action-error", record: :once) do
        envelope = @pubnub.remove_message_action(
          channel: 'chat',
          message_timetoken: 16702463528031534,
          action_timetoken: 16702463913845610
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it 'should raise exception when channel is missing' do
      expect {
        @pubnub.remove_message_action(message_timetoken: 16702463528031534, action_timetoken: 16702463913845610).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when message timetoken is missing' do
      expect {
        @pubnub.remove_message_action(channel: 'chat', action_timetoken: 16702463913845610).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action timetoken is missing' do
      expect {
        @pubnub.remove_message_action(channel: 'chat', message_timetoken: 16702463528031534).value
      }.to raise_error(Pubnub::ArgumentError)
    end
  end
end