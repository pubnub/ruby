require 'spec_helper'

describe Pubnub::Publish do
  it_behaves_like 'an event'

  around(:each) do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context '#start_event' do
    let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo', publish_key: 'demo') }
    let(:callback)      { ->(_e) {} }

    it 'fires https request if set' do
      pubnub_client = Pubnub.new(subscribe_key: 'demo', publish_key: 'demo', ssl: true)

      event = Pubnub::Publish.new(
          {
              channel: 'custom_channel',
              origin: 'pubsub.pubnub.com',
              message: 'msg',
              callback: callback
          }, pubnub_client)

      VCR.use_cassette('publish/basic-ssl', :record => :once) do
        expect { event.fire }.to_not raise_error
      end
    end

    it 'fires http request if set' do
      event = Pubnub::Publish.new(
          {
              channel: 'custom_channel',
              origin: 'pubsub.pubnub.com',
              message: 'msg',
              callback: callback
          }, pubnub_client)

      VCR.use_cassette('publish/basic', :record => :once) do
        expect { event.fire }.to_not raise_error
      end
    end

    it 'returns array with exactly one envelope' do
      event = Pubnub::Publish.new(
          {
              channel: 'custom_channel',
              origin: 'pubsub.pubnub.com',
              message: 'msg',
              callback: callback
          }, pubnub_client)

      VCR.use_cassette('publish/basic', :record => :once) do
        result = event.fire

        expect(result.class.to_s).to eq 'Array'
        expect(result.count).to eq 1
        result.each do |envelope|
          expect(envelope.class.to_s).to eq 'Pubnub::Envelope'
        end
      end
    end

    it 'returned envelope is well formatted' do
      event = Pubnub::Publish.new(
          {
              channel: 'custom_channel',
              origin: 'pubsub.pubnub.com',
              message: 'msg',
              callback: callback
          }, pubnub_client)

      VCR.use_cassette('publish/basic', :record => :once) do
        result = event.fire

        result.each do |envelope|
          expect(envelope.class.to_s).to       eq 'Pubnub::Envelope'
          expect(envelope.message).to          eq 'msg'
          expect(envelope.channel).to          eq 'custom_channel'
          expect(envelope.first).to            eq true
          expect(envelope.last).to             eq true
          expect(envelope.parsed_response).to  eq [1, 'Sent', '14138972684946929']
          expect(envelope.response).to         eq '[1,"Sent","14138972684946929"]'
          expect(envelope.response_message).to eq 'Sent'
          expect(envelope.status).to           eq 200
          expect(envelope.timetoken).to        eq '14138972684946929'
        end
      end
    end
  end
end
