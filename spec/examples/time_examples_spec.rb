require 'spec_helper'

describe Pubnub::Time do
  around :each do |example|
    @fired = false

    @callback = ->(_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
      subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
      uuid: 'ruby-test-uuid-client-one',
      auth_key: 'ruby-test-auth-client-one'
    )

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it '__http_sync__true___callback__nil_' do
VCR.use_cassette('examples/time/5', record: :none) do
envelope = @pubnub.time(http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


it '__http_sync__true___callback___block_' do
VCR.use_cassette('examples/time/3', record: :none) do
envelope = @pubnub.time(http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


it '__http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/time/4', record: :none) do
envelope = @pubnub.time(http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


it '__http_sync__false___callback__nil_' do
VCR.use_cassette('examples/time/2', record: :none) do
envelope = @pubnub.time(http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


it '__http_sync__false___callback___block_' do
VCR.use_cassette('examples/time/0', record: :none) do
envelope = @pubnub.time(http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


it '__http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/time/1', record: :none) do
envelope = @pubnub.time(http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:time)

end
end


end

