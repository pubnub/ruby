require 'helpers/spec_helper'

describe Pubnub::Presence do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      @messages = []
      @statuses = []

      @callbacks = Pubnub::SubscribeCallback.new(
        message: -> (_envelope) { },
        presence: -> (envelope) { @messages << envelope },
        status: -> (envelope) { @statuses << envelope },
      )
    end

    context "async" do
      it "works" do
        VCR.use_cassette("lib/events/presence-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.presence(channel: :demo)

          eventually do
            if @messages.length > 0
              envelope = @messages.first
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
              true
            end
          end
        end
      end

      it "fires status callback on error" do
        VCR.use_cassette("lib/events/presence-async-error", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.presence(channel: :demo)
          sleep 0.1

          eventually do
            if @statuses.length > 0
              envelope = @statuses.first
              expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
              # expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
              true
            end
          end
        end
      end
    end

    context "sync" do
      it "works" do
        VCR.use_cassette("lib/events/presence-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
          )

          @pubnub.presence(channel: :demo, http_sync: true)
          envelopes = @pubnub.presence(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "fires status callback on error" do
        VCR.use_cassette("lib/events/presence-sync-error", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
          )

          @pubnub.presence(channel: :demo, http_sync: true)
          envelopes = @pubnub.presence(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        end
      end
    end
  end
end
