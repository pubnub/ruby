require 'spec_helper'

describe Pubnub::Presence do
  # it_behaves_like 'an event'

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'given basic parameters' do
    before :each do
      @messages = []
      @statuses = []

      @callbacks = Pubnub::SubscribeCallback.new(
          message: ->(_envelope) {  },
          presence: ->(envelope) { @messages << envelope },
          status: ->(envelope) { @statuses << envelope }
      )
    end

    context 'async' do
      it 'works' do
        VCR.use_cassette('lib/events/presence-async', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.presence(channel: :demo)

          

          eventually do
            envelope = @messages.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
          end

        end
      end

      it 'fires status callback on error' do
        VCR.use_cassette('lib/events/presence-async-error', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.presence(channel: :demo)
          sleep 0.1

          eventually do
            envelope = @statuses.first
            expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
          end

        end
      end
    end

    context 'sync' do
      it 'works' do
        VCR.use_cassette('lib/events/presence-sync', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.presence(channel: :demo, http_sync: true)
          envelopes = @pubnub.presence(channel: :demo, http_sync: true)


          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema

        end
      end

      it 'fires status callback on error' do
        VCR.use_cassette('lib/events/presence-sync-error', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.presence(channel: :demo, http_sync: true)
          envelopes = @pubnub.presence(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema

        end
      end
    end
  end
end