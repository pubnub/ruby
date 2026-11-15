# frozen_string_literal: true

require 'concurrent'
require_relative '../../lib/pubnub/client/paged_history'

RSpec.describe Pubnub::Client::PagedHistory do
  let(:client) { Class.new { include Pubnub::Client::PagedHistory }.new }
  let(:envelope) do
    double(status: { category: :ack },
           result: { data: { messages: ['message'], start: '1', end: '2' } })
  end

  before do
    allow(client).to receive(:history).and_return(envelope)
    allow(client).to receive(:envelope_with_messages).and_return(envelope)
  end

  [:paged_history, :all_history_messages].each do |method|
    [true, false].each do |sync|
      it "delivers #{method} results to a block with http_sync=#{sync}" do
        received = []
        options = { channel: 'demo', http_sync: sync }.freeze
        result = client.public_send(method, options) { |value| received << value }
        result.value! if result.is_a?(Concurrent::Future)

        expect(received).to eq([envelope])
      end
    end

    it "prefers the explicit #{method} callback over a block asynchronously" do
      received = []
      callback = ->(value) { received << value }
      result = client.public_send(method, channel: 'demo', callback: callback) do
        raise 'The explicit callback should take precedence'
      end
      result.value!

      expect(received).to eq([envelope])
    end

    it "respects an explicit nil #{method} callback asynchronously" do
      result = client.public_send(method, channel: 'demo', callback: nil) do
        raise 'An explicit nil callback should suppress the block'
      end

      expect { result.value! }.not_to raise_error
    end
  end
end
