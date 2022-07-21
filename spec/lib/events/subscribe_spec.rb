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
      @uuid_metadata_events = []
      @channel_metadata_events = []
      @membership_events = []

      @callbacks = Pubnub::SubscribeCallback.new(
        message: -> (envelope) { @messages << envelope },
        presence: -> (_envelope) { },
        status: -> (envelope) { @statuses << envelope },
        signal: -> (envelope) { @signals << envelope },
        object: -> (envelope) {
          case envelope.result[:operation]
          when Pubnub::Constants::OPERATION_SET_UUID_METADATA, Pubnub::Constants::OPERATION_REMOVE_UUID_METADATA
            @uuid_metadata_events << envelope
          when Pubnub::Constants::OPERATION_SET_CHANNEL_METADATA, Pubnub::Constants::OPERATION_REMOVE_CHANNEL_METADATA
            @channel_metadata_events << envelope
          when Pubnub::Constants::OPERATION_SET_CHANNEL_MEMBERS, Pubnub::Constants::OPERATION_REMOVE_CHANNEL_MEMBERS,
               Pubnub::Constants::OPERATION_SET_MEMBERSHIPS, Pubnub::Constants::OPERATION_REMOVE_MEMBERSHIPS
            @membership_events << envelope
          else
            puts "Unexpected operation"
          end
        }
      )
    end

    context "async" do
      it "works" do
        VCR.use_cassette("lib/events/subscribe-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)

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

      it "works with cipher key" do
        @pubnub = Pubnub::Client.new(
          subscribe_key: "demo",
          publish_key: "demo",
          user_id: "ruby-test-uuid",
          cipher_key: "demo",
          random_iv: false
        )

        @pubnub.add_listener(callback: @callbacks)

        VCR.use_cassette("lib/events/subscribe-cipher-async", record: :once) do
          @pubnub.subscribe(channel: :whatever)

          eventually do
            if @messages.length > 0
              expect(@messages.first.result[:data][:message]).to eq("text" => "hey")
              true
            end
          end
        end
      end

      it "allows subscribing additional channels" do
        @pubnub = Pubnub::Client.new(
          subscribe_key: "demo",
          publish_key: "demo",
          user_id: "ruby-test-uuid",
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
            user_id: "ruby-test-uuid",
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)
          sleep 0.1

          eventually do
            if @statuses.length > 0
              envelope = @statuses.first
              expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              true
            end
          end
        end
      end

      it "uuid metadata update works" do
        VCR.use_cassette("lib/events/subscribe-uuid-metadata-set-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :uuid_mg3)

          eventually do
            if @uuid_metadata_events.length > 0
              envelope = @uuid_metadata_events.first
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
              expect(envelope.result[:data][:message]['event']).to eq 'set'
              expect(envelope.result[:data][:message]['type']).to eq 'uuid'
              expect(envelope.result[:data][:message]['data']['id']).to eq 'uuid_mg3'
              true
            end
          end
        end
      end

      it "channel metadata update works" do
        VCR.use_cassette("lib/events/subscribe-channel-metadata-set-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :rb_channel_3)

          eventually do
            if @channel_metadata_events.length > 0
              envelope = @channel_metadata_events.first
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
              expect(envelope.result[:data][:message]['event']).to eq 'set'
              expect(envelope.result[:data][:message]['type']).to eq 'channel'
              # expect(envelope.result[:data][:message]['data']['id']).to eq 'rb_channel_3'
              true
            end
          end
        end
      end

      it "member set works" do
        VCR.use_cassette("lib/events/subscribe-member-set-async", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :rb_channel_3)

          eventually do
            if @membership_events.length > 0
              envelope = @membership_events.first
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
              expect(envelope.result[:data][:message]['event']).to eq 'set'
              expect(envelope.result[:data][:message]['type']).to eq 'membership'
              expect(envelope.result[:data][:message]['data']['uuid']['id']).to eq 'uuid_mg3'
              true
            end
          end
        end
      end

      it "membership set works" do
        VCR.use_cassette("lib/events/subscribe-membership-set-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              user_id: "ruby-test-uuid"
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :uuid_mg5)

          eventually do
            if @membership_events.length > 0
              envelope = @membership_events.first
              expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
              expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
              expect(envelope.result[:data][:message]['event']).to eq 'set'
              expect(envelope.result[:data][:message]['type']).to eq 'membership'
              expect(envelope.result[:data][:message]['data']['channel']['id']).to eq 'rb_channel_5'
              true
            end
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
          user_id: "ruby-test-uuid",
          cipher_key: "demo",
          random_iv: false
        )

        VCR.use_cassette("lib/events/subscribe-cipher-async", record: :once) do
          @pubnub.subscribe(channel: :whatever, http_sync: true)
          @messages = @pubnub.subscribe(channel: :whatever, http_sync: true)
          eventually do
            if @messages.length > 0
              expect(@messages.first.result[:data][:message]).to eq("text" => "hey")
              true
            end
          end
        end
      end

      it "works" do
        VCR.use_cassette("lib/events/subscribe-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
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
            user_id: "ruby-test-uuid",
          )

          @pubnub.subscribe(channel: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
        end
      end

      it "uuid metadata remove works" do
        VCR.use_cassette("lib/events/subscribe-uuid-metadata-remove-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              user_id: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :uuid_mg3, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :uuid_mg3, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'uuid'
          expect(envelope.result[:data][:message]['data']['id']).to eq 'uuid_mg3'
        end
      end

      it "channel metadata remove works" do
        VCR.use_cassette("lib/events/subscribe-channel-metadata-remove-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              user_id: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :rb_channel_1, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :rb_channel_1, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'channel'
          expect(envelope.result[:data][:message]['data']['id']).to eq 'rb_channel_1'
        end
      end

      it "member remove works" do
        VCR.use_cassette("lib/events/subscribe-member-remove-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              user_id: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :rb_channel_1, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :rb_channel_1, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'membership'
          expect(envelope.result[:data][:message]['data']['uuid']['id']).to eq 'uuid_mg1'
        end
      end

      it "membership remove works" do
        VCR.use_cassette("lib/events/subscribe-membership-remove-async", record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: "sub-a-mock-key",
              publish_key: "pub-a-mock-key",
              auth_key: "ruby-test-auth",
              user_id: "ruby-test-uuid"
          )

          @pubnub.subscribe(channel: :uuid_mg1, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :uuid_mg1, http_sync: true)

          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema.new
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema.new
          expect(envelope.result[:data][:message]['event']).to eq 'delete'
          expect(envelope.result[:data][:message]['type']).to eq 'membership'
          expect(envelope.result[:data][:message]['data']['channel']['id']).to eq 'rb_channel_1'
        end

    end

    context "aliases" do
      it "pass channels to channel" do
        VCR.use_cassette("lib/events/subscribe-sync", record: :once) do
          @pubnub = Pubnub::Client.new(
            subscribe_key: "sub-a-mock-key",
            publish_key: "pub-a-mock-key",
            auth_key: "ruby-test-auth",
            user_id: "ruby-test-uuid",
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
            user_id: "ruby-test-uuid",
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
            user_id: "ruby-test-uuid",
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
