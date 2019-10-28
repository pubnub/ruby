require "spec_helper"

describe Pubnub::Subscribe do
  # it_behaves_like 'an event'

  around :each do |example|
    example.run_with_retry retry: 10
  end


  context "given basic parameters" do
    before :each do
      @messages = []
      @statuses = []
      @signals = []
      @user_events = []
      @space_events = []
      @membership_events = []

      @callbacks = Pubnub::SubscribeCallback.new(
        message: -> (envelope) { @messages << envelope },
        presence: -> (_envelope) { },
        status: -> (envelope) { @statuses << envelope },
        signal: -> (envelope) { @signals << envelope },
        user: -> (envelope) { @user_events << envelope },
        space: -> (envelope) { @space_events << envelope },
        membership: -> (envelope) { @membership_events << envelope }
      )
    end

    context "async" do
      it "works" do
        VCR.use_cassette("lib/events/subscribe-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)

          eventually do
            envelope = @messages.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          end
        end
      end

      it "works with cipher key" do
        @pubnub = Pubnub::Client.new(
          subscribe_key: "demo",
          publish_key: "demo",
          uuid: "ruby-test-uuid",
          cipher_key: "demo",
        )

        @pubnub.add_listener(callback: @callbacks)

        VCR.use_cassette("lib/events/subscribe-cipher-async", record: :once) do
          @pubnub.subscribe(channel: :whatever)

          eventually do
            expect(@messages.first.result[:data][:message]).to eq("text" => "hey")
          end
        end
      end

      it "allows subscribing additional channels" do
        @pubnub = Pubnub::Client.new(
          subscribe_key: "demo",
          publish_key: "demo",
          uuid: "ruby-test-uuid",
        )

        VCR.use_cassette("lib/events/subscribe-playing-async", record: :once) do
          @pubnub.subscribe(channel: :demo)
          #sleep(0.1)
          @pubnub.subscribe(channel: :whatever)
          #sleep(0.1)
          @pubnub.leave(channel: [:whatever, :demo])
        end
      end

      it "fires status callback on error" do
        VCR.use_cassette("lib/events/subscribe-async-error", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)
          sleep 0.1

          eventually do
            envelope = @statuses.first
            expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          end
        end
      end

      it "user update works" do
        VCR.use_cassette("lib/events/subscribe-user-update-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :user_mg3)

          eventually do
            envelope = @user_events.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
            expect(envelope.result[:data][:message]['event']).to eq 'update'
            expect(envelope.result[:data][:message]['type']).to eq 'user'
          end
        end
      end

      it "space update works" do
        VCR.use_cassette("lib/events/subscribe-space-update-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :rb_space_3)

          eventually do
            envelope = @space_events.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
            expect(envelope.result[:data][:message]['event']).to eq 'update'
            expect(envelope.result[:data][:message]['type']).to eq 'space'
          end
        end
      end

      it "member add works" do
        VCR.use_cassette("lib/events/subscribe-member-add-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :rb_space_4)

          eventually do
            envelope = @membership_events.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
            expect(envelope.result[:data][:message]['event']).to eq 'create'
            expect(envelope.result[:data][:message]['type']).to eq 'membership'
            expect(envelope.result[:data][:message]['data']['userId']).to eq 'user_mg4'
          end
        end
      end

      it "membership add works" do
        VCR.use_cassette("lib/events/subscribe-membership-add-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              uuid: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :user_mg4)

          eventually do
            envelope = @membership_events.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
            expect(envelope.result[:data][:message]['event']).to eq 'create'
            expect(envelope.result[:data][:message]['type']).to eq 'membership'
            expect(envelope.result[:data][:message]['data']['spaceId']).to eq 'rb_space_4'
          end
        end
      end

      end
    end

    context "sync" do
      it "works with cipher key" do
        @pubnub = Pubnub::Client.new(
          subscribe_key: "demo",
          publish_key: "demo",
          uuid: "ruby-test-uuid",
          cipher_key: "demo",
        )

        VCR.use_cassette("lib/events/subscribe-cipher-async", record: :once) do
          @pubnub.subscribe(channel: :whatever, http_sync: true)
          @messages = @pubnub.subscribe(channel: :whatever, http_sync: true)
          eventually do
            expect(@messages.first.result[:data][:message]).to eq("text" => "hey")
          end
        end
      end

      it "works" do
        VCR.use_cassette("lib/events/subscribe-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.subscribe(channel: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "fires status callback on error" do
        VCR.use_cassette("lib/events/subscribe-sync-error", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.subscribe(channel: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        end
      end

      it "user delete works" do
        VCR.use_cassette("lib/events/subscribe-user-delete-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              uuid: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :user_mg3, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :user_mg3, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'user'
        end
      end

      it "space delete works" do
        VCR.use_cassette("lib/events/subscribe-space-delete-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              uuid: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :rb_space_3, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :rb_space_3, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'space'
          expect(envelope.result[:data][:message]['data']['id']).to eq 'rb_space_3'
        end
      end

      it "member remove works" do
        VCR.use_cassette("lib/events/subscribe-member-remove-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              uuid: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :rb_space_4, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :rb_space_4, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'membership'
          expect(envelope.result[:data][:message]['data']['userId']).to eq 'user_mg4'
        end
      end

      it "membership remove works" do
        VCR.use_cassette("lib/events/subscribe-membership-remove-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              uuid: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :user_mg4, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :user_mg4, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'membership'
          expect(envelope.result[:data][:message]['data']['spaceId']).to eq 'rb_space_4'
        end

    end

    context "aliases" do
      it "pass channels to channel" do
        VCR.use_cassette("lib/events/subscribe-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.subscribe(channels: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channels: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end

      it "pass channel_groups to channel_group" do
        VCR.use_cassette("lib/events/subscribe-channel-groups", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.subscribe(channel_groups: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel_groups: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end
    end

    context "flags" do
      it "with with_presence" do
        VCR.use_cassette("lib/events/subscribe-with-presence", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            uuid: "ruby-test-uuid",
          )

          @pubnub.subscribe(channels: [:demo, :demo1, "demo.*"], with_presence: true, http_sync: true)
          envelopes = @pubnub.subscribe(channels: [:demo, :demo1, "demo.*"], with_presence: true, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
        end
      end
    end

  end
end
