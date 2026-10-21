require 'helpers/spec_helper'

describe Pubnub::Grant do
  it_behaves_like "an event"

  context "given basic parameters" do
    before :each do
      allow_any_instance_of(Pubnub::Grant).to receive(:current_time).and_return 1602537897
      allow_any_instance_of(Pubnub::Grant).to receive(:signature).and_return "v2.OdCTZXne_jEBewh3yY8iNDWcMCHC6BXNrg1Er9JoSTQ"
    end

    let(:pubnub) do
      Pubnub::Client.new(
        subscribe_key: "sub-a-mock-key",
        publish_key: "pub-a-mock-key",
        secret_key: "sec-a-mock-key",
        auth_key: "ruby-test-auth",
        user_id: "ruby-test-uuid",
      )
    end
    let(:envelope) do
      pubnub.grant(
        channel: :demo,
      ).value
    end

    it "works" do
      VCR.use_cassette("lib/events/grant", record: :once) do
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    it "forms valid ErrorEnvelope on error" do
      VCR.use_cassette("lib/events/grant-error", record: :once) do
        expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
        expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
      end
    end

    context "with categories" do
      it "grants category permissions with r/w/m defaulted to 0" do
        VCR.use_cassette("lib/events/grant-categories", record: :none) do
          envelope = pubnub.grant(
            auth_key: "category-auth",
            categories: [:channels, :uuids],
            get: true
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data]["categories"]["channels"]["auths"]["category-auth"]["g"]).to eq 1
        end
      end

      it "grants category permissions along with a channel" do
        VCR.use_cassette("lib/events/grant-categories", record: :none) do
          envelope = pubnub.grant(
            auth_key: "category-auth",
            channel: :demo,
            categories: "uuids",
            get: true
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq false
          expect(envelope.result[:data]["categories"]["uuids"]).not_to be_nil
        end
      end

      it "sends explicit permissions and forms ErrorEnvelope on server rejection" do
        VCR.use_cassette("lib/events/grant-categories", record: :none) do
          envelope = pubnub.grant(
            auth_key: "category-auth",
            categories: :channels,
            get: true,
            read: true
          ).value

          expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
          expect(envelope.status[:code]).to eq 400
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        end
      end

      it "raises error for unsupported category" do
        expect { pubnub.grant(
          auth_key: "category-auth",
          categories: [:users],
          get: true
        ).value }.to raise_error(Pubnub::ArgumentError)
      end

      it "raises error for unsupported categories type" do
        expect { pubnub.grant(
          auth_key: "category-auth",
          categories: 123,
          get: true
        ).value }.to raise_error(Pubnub::ArgumentError)
      end

      it "raises error when auth_key is not passed with the call" do
        expect { pubnub.grant(
          categories: [:channels],
          get: true
        ).value }.to raise_error(Pubnub::ArgumentError)
      end
    end

    it "forms valid ErrorEnvelope on HTTPX::TimeoutError" do
      allow_any_instance_of(Pubnub::HttpDispatcher).to receive(:get).and_raise(HTTPX::TimeoutError.new(nil, "timeout"))

      expect(envelope.is_a?(Pubnub::ErrorEnvelope)).to eq true
      expect(envelope.status[:code]).to eq 408
      expect(envelope.status[:category]).to eq Pubnub::Constants::STATUS_TIMEOUT
      expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
    end
  end
end
