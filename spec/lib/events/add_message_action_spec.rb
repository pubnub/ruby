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

    it "should add message action" do
      VCR.use_cassette("lib/events/add_message_action", record: :once) do
        envelope = @pubnub.add_message_action(
          channel: 'chat',
          type: 'emotion',
          value: 'smile',
          message_timetoken: 16701562382648731
        ).value

        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end

    it 'should return proper error in case of failure' do
      VCR.use_cassette("lib/events/add_message_action-error", record: :once) do
        envelope = @pubnub.add_message_action(
          channel: 'chat',
          type: 'emotion',
          value: 'smile',
          message_timetoken: 16701562382648730
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

    it 'should raise exception when channel is empty' do
      expect {
        @pubnub.add_message_action(channel:'', type: 'emotion', value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action type is missing' do
      expect {
        @pubnub.add_message_action(channel:'chat', value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action type is empty' do
      expect {
        @pubnub.add_message_action(channel:'chat', type: '', value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action type is not a string' do
      expect {
        @pubnub.add_message_action(channel:'chat', type: 16, value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action type is longer than 15' do
      expect {
        @pubnub.add_message_action(channel:'chat', type: '1234512345123456', value: 'smile', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action value is missing' do
      expect {
        @pubnub.add_message_action(channel:'chat', type: 'emotion', message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end

    it 'should raise exception when action value is not a string' do
      expect {
        @pubnub.add_message_action(channel:'chat', type: 'emotion', value: 12345, message_timetoken: 14630568408440592).value
      }.to raise_error(Pubnub::ArgumentError)
    end
  end
end