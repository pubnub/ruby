require 'spec_helper'

describe Pubnub::Publish do
  around :each do |example|
    @fired = false

    @callback = ->(_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
      subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
      secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
      uuid: 'ruby-test-uuid-client-one',
      auth_key: 'ruby-test-auth-client-one'
    )

    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 100, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: 'string', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: ["ar", "ray"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo___message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: :demo, message: {:hash=>"it is"}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message__100___store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 100, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message___string____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: 'string', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____ar____ray_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: ["ar", "ray"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__true___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__false___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, store: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__true___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: true, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__false___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, compressed: false, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__true___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback__nil_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___block_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key' do
@pubnub = Pubnub.new(
  publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
  subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
  secret_key: 'sec-c-OWIyYmVlYWYtYWMxMS00OTcxLTlhZDAtZDBlYTM4ODE1MWUy',
  uuid: 'ruby-test-uuid-client-one',
  auth_key: 'ruby-test-auth-client-one',
cipher_key: 'super-secret-cipher-key')
VCR.use_cassette('examples/publish/__channel___demo____message____hash___it_is_____store__nil___compressed__nil___http_sync__false___callback___lambda_cipherkeysuper-secret-cipher-key', record: :none) do
envelope = @pubnub.publish(channel: 'demo', message: {:hash=>"it is"}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:publish)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


end

