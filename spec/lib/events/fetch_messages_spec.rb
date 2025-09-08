require 'helpers/spec_helper'

describe Pubnub::FetchMessages do
  # it_behaves_like "an event"

  context 'given basic parameters' do
    before :each do
      @pubnub = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end

    it 'should not crash with secret key' do
      pubnub_sec = Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        secret_key: "sec-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
        )
      VCR.use_cassette("lib/events/fetch_messages_with_secret", record: :once) do
        expect {
          pubnub_sec.fetch_messages(
            channels: %w[channel-1 channel-2],
            :http_sync => true
          )
        }.to_not raise_error(ArgumentError)
      end
    end

    it 'works with channels list' do
      VCR.use_cassette("lib/events/fetch_messages", record: :once) do
        envelope = @pubnub.fetch_messages(
          channels: %w[channel-1 channel-2],
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it 'works with message actions' do
      VCR.use_cassette("lib/events/fetch_messages_with_actions", record: :once) do
        envelope = @pubnub.fetch_messages(
          channel: 'channel-1',
          include_message_actions: true
        ).value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it 'use channel when channels is missing' do
      VCR.use_cassette("lib/events/fetch_messages_for_channel_channels_missing", record: :once) do
        envelope = @pubnub.fetch_messages(channel: 'channel-1').value

        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it 'use channel when channel is missing' do
      VCR.use_cassette("lib/events/fetch_messages_with_actions_no_channel_error", record: :once) do
        expect { @pubnub.fetch_messages(include_message_actions: true).value }.to raise_error(Pubnub::ArgumentError)
      end
    end

    it 'raise exception when channels is missing' do
      VCR.use_cassette("lib/events/fetch_messages_no_channels", record: :once) do
        expect { @pubnub.fetch_messages.value }.to raise_error(Pubnub::ArgumentError)
      end
    end

    it 'forms valid ErrorEnvelope on error with message actions' do
      VCR.use_cassette("lib/events/fetch_messages_with_actions_error", record: :once) do
        envelope = @pubnub.fetch_messages(
          channel: 'channel-1',
          include_message_actions: true,
        ).value

        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
      end
    end
  end
end