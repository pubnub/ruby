require 'spec_helper'

describe Pubnub::Subscribe do
  it_behaves_like 'an event'

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
        message: ->(envelope) { @messages << envelope },
        presence: ->(_envelope) { },
        status: ->(envelope) { @statuses << envelope }
      )
    end

    context 'async' do
      it 'works' do
        VCR.use_cassette('lib/events/subscribe-async', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)

          eventually do
            envelope = @messages.first
            expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
            expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema
          end

        end
      end

      it 'fires status callback on error' do
        VCR.use_cassette('lib/events/subscribe-async-error', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.add_listener(callback: @callbacks)

          @pubnub.subscribe(channel: :demo)
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
        VCR.use_cassette('lib/events/subscribe-sync', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.subscribe(channel: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :demo, http_sync: true)


          envelope = envelopes.first
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema
          expect(envelope.result).to satisfies_schema Pubnub::Schemas::Envelope::ResultSchema

        end
      end

      it 'fires status callback on error' do
        VCR.use_cassette('lib/events/subscribe-sync-error', record: :once) do
          @pubnub = Pubnub::Client.new(
              subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
              publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
              secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
              auth_key: 'ruby-test-auth',
              uuid: 'ruby-test-uuid'
          )

          @pubnub.subscribe(channel: :demo, http_sync: true)
          envelopes = @pubnub.subscribe(channel: :demo, http_sync: true)

          envelope = envelopes.first
          expect(envelope).to be_a_kind_of Pubnub::ErrorEnvelope
          expect(envelope.status).to satisfies_schema Pubnub::Schemas::Envelope::StatusSchema

        end
      end
    end
  end
end