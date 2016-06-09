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
VCR.use_cassette('examples/publish/538', record: :none) do
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
VCR.use_cassette('examples/publish/534', record: :none) do
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
VCR.use_cassette('examples/publish/536', record: :none) do
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
VCR.use_cassette('examples/publish/532', record: :none) do
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
VCR.use_cassette('examples/publish/528', record: :none) do
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
VCR.use_cassette('examples/publish/530', record: :none) do
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
VCR.use_cassette('examples/publish/514', record: :none) do
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
VCR.use_cassette('examples/publish/510', record: :none) do
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
VCR.use_cassette('examples/publish/512', record: :none) do
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
VCR.use_cassette('examples/publish/508', record: :none) do
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
VCR.use_cassette('examples/publish/504', record: :none) do
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
VCR.use_cassette('examples/publish/506', record: :none) do
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
VCR.use_cassette('examples/publish/526', record: :none) do
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
VCR.use_cassette('examples/publish/522', record: :none) do
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
VCR.use_cassette('examples/publish/524', record: :none) do
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
VCR.use_cassette('examples/publish/520', record: :none) do
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
VCR.use_cassette('examples/publish/516', record: :none) do
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
VCR.use_cassette('examples/publish/518', record: :none) do
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
VCR.use_cassette('examples/publish/466', record: :none) do
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
VCR.use_cassette('examples/publish/462', record: :none) do
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
VCR.use_cassette('examples/publish/464', record: :none) do
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
VCR.use_cassette('examples/publish/460', record: :none) do
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
VCR.use_cassette('examples/publish/456', record: :none) do
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
VCR.use_cassette('examples/publish/458', record: :none) do
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
VCR.use_cassette('examples/publish/442', record: :none) do
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
VCR.use_cassette('examples/publish/438', record: :none) do
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
VCR.use_cassette('examples/publish/440', record: :none) do
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
VCR.use_cassette('examples/publish/436', record: :none) do
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
VCR.use_cassette('examples/publish/432', record: :none) do
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
VCR.use_cassette('examples/publish/434', record: :none) do
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
VCR.use_cassette('examples/publish/454', record: :none) do
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
VCR.use_cassette('examples/publish/450', record: :none) do
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
VCR.use_cassette('examples/publish/452', record: :none) do
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
VCR.use_cassette('examples/publish/448', record: :none) do
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
VCR.use_cassette('examples/publish/444', record: :none) do
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
VCR.use_cassette('examples/publish/446', record: :none) do
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
VCR.use_cassette('examples/publish/502', record: :none) do
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
VCR.use_cassette('examples/publish/498', record: :none) do
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
VCR.use_cassette('examples/publish/500', record: :none) do
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
VCR.use_cassette('examples/publish/496', record: :none) do
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
VCR.use_cassette('examples/publish/492', record: :none) do
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
VCR.use_cassette('examples/publish/494', record: :none) do
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
VCR.use_cassette('examples/publish/478', record: :none) do
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
VCR.use_cassette('examples/publish/474', record: :none) do
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
VCR.use_cassette('examples/publish/476', record: :none) do
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
VCR.use_cassette('examples/publish/472', record: :none) do
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
VCR.use_cassette('examples/publish/468', record: :none) do
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
VCR.use_cassette('examples/publish/470', record: :none) do
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
VCR.use_cassette('examples/publish/490', record: :none) do
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
VCR.use_cassette('examples/publish/486', record: :none) do
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
VCR.use_cassette('examples/publish/488', record: :none) do
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
VCR.use_cassette('examples/publish/484', record: :none) do
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
VCR.use_cassette('examples/publish/480', record: :none) do
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
VCR.use_cassette('examples/publish/482', record: :none) do
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
VCR.use_cassette('examples/publish/862', record: :none) do
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
VCR.use_cassette('examples/publish/858', record: :none) do
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
VCR.use_cassette('examples/publish/860', record: :none) do
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
VCR.use_cassette('examples/publish/856', record: :none) do
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
VCR.use_cassette('examples/publish/852', record: :none) do
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
VCR.use_cassette('examples/publish/854', record: :none) do
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
VCR.use_cassette('examples/publish/838', record: :none) do
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
VCR.use_cassette('examples/publish/834', record: :none) do
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
VCR.use_cassette('examples/publish/836', record: :none) do
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
VCR.use_cassette('examples/publish/832', record: :none) do
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
VCR.use_cassette('examples/publish/828', record: :none) do
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
VCR.use_cassette('examples/publish/830', record: :none) do
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
VCR.use_cassette('examples/publish/850', record: :none) do
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
VCR.use_cassette('examples/publish/846', record: :none) do
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
VCR.use_cassette('examples/publish/848', record: :none) do
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
VCR.use_cassette('examples/publish/844', record: :none) do
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
VCR.use_cassette('examples/publish/840', record: :none) do
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
VCR.use_cassette('examples/publish/842', record: :none) do
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
VCR.use_cassette('examples/publish/790', record: :none) do
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
VCR.use_cassette('examples/publish/786', record: :none) do
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
VCR.use_cassette('examples/publish/788', record: :none) do
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
VCR.use_cassette('examples/publish/784', record: :none) do
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
VCR.use_cassette('examples/publish/780', record: :none) do
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
VCR.use_cassette('examples/publish/782', record: :none) do
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
VCR.use_cassette('examples/publish/766', record: :none) do
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
VCR.use_cassette('examples/publish/762', record: :none) do
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
VCR.use_cassette('examples/publish/764', record: :none) do
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
VCR.use_cassette('examples/publish/760', record: :none) do
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
VCR.use_cassette('examples/publish/756', record: :none) do
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
VCR.use_cassette('examples/publish/758', record: :none) do
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
VCR.use_cassette('examples/publish/778', record: :none) do
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
VCR.use_cassette('examples/publish/774', record: :none) do
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
VCR.use_cassette('examples/publish/776', record: :none) do
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
VCR.use_cassette('examples/publish/772', record: :none) do
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
VCR.use_cassette('examples/publish/768', record: :none) do
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
VCR.use_cassette('examples/publish/770', record: :none) do
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
VCR.use_cassette('examples/publish/826', record: :none) do
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
VCR.use_cassette('examples/publish/822', record: :none) do
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
VCR.use_cassette('examples/publish/824', record: :none) do
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
VCR.use_cassette('examples/publish/820', record: :none) do
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
VCR.use_cassette('examples/publish/816', record: :none) do
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
VCR.use_cassette('examples/publish/818', record: :none) do
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
VCR.use_cassette('examples/publish/802', record: :none) do
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
VCR.use_cassette('examples/publish/798', record: :none) do
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
VCR.use_cassette('examples/publish/800', record: :none) do
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
VCR.use_cassette('examples/publish/796', record: :none) do
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
VCR.use_cassette('examples/publish/792', record: :none) do
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
VCR.use_cassette('examples/publish/794', record: :none) do
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
VCR.use_cassette('examples/publish/814', record: :none) do
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
VCR.use_cassette('examples/publish/810', record: :none) do
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
VCR.use_cassette('examples/publish/812', record: :none) do
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
VCR.use_cassette('examples/publish/808', record: :none) do
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
VCR.use_cassette('examples/publish/804', record: :none) do
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
VCR.use_cassette('examples/publish/806', record: :none) do
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
VCR.use_cassette('examples/publish/646', record: :none) do
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
VCR.use_cassette('examples/publish/642', record: :none) do
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
VCR.use_cassette('examples/publish/644', record: :none) do
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
VCR.use_cassette('examples/publish/640', record: :none) do
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
VCR.use_cassette('examples/publish/636', record: :none) do
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
VCR.use_cassette('examples/publish/638', record: :none) do
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
VCR.use_cassette('examples/publish/622', record: :none) do
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
VCR.use_cassette('examples/publish/618', record: :none) do
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
VCR.use_cassette('examples/publish/620', record: :none) do
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
VCR.use_cassette('examples/publish/616', record: :none) do
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
VCR.use_cassette('examples/publish/612', record: :none) do
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
VCR.use_cassette('examples/publish/614', record: :none) do
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
VCR.use_cassette('examples/publish/634', record: :none) do
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
VCR.use_cassette('examples/publish/630', record: :none) do
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
VCR.use_cassette('examples/publish/632', record: :none) do
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
VCR.use_cassette('examples/publish/628', record: :none) do
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
VCR.use_cassette('examples/publish/624', record: :none) do
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
VCR.use_cassette('examples/publish/626', record: :none) do
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
VCR.use_cassette('examples/publish/574', record: :none) do
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
VCR.use_cassette('examples/publish/570', record: :none) do
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
VCR.use_cassette('examples/publish/572', record: :none) do
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
VCR.use_cassette('examples/publish/568', record: :none) do
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
VCR.use_cassette('examples/publish/564', record: :none) do
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
VCR.use_cassette('examples/publish/566', record: :none) do
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
VCR.use_cassette('examples/publish/550', record: :none) do
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
VCR.use_cassette('examples/publish/546', record: :none) do
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
VCR.use_cassette('examples/publish/548', record: :none) do
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
VCR.use_cassette('examples/publish/544', record: :none) do
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
VCR.use_cassette('examples/publish/540', record: :none) do
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
VCR.use_cassette('examples/publish/542', record: :none) do
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
VCR.use_cassette('examples/publish/562', record: :none) do
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
VCR.use_cassette('examples/publish/558', record: :none) do
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
VCR.use_cassette('examples/publish/560', record: :none) do
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
VCR.use_cassette('examples/publish/556', record: :none) do
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
VCR.use_cassette('examples/publish/552', record: :none) do
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
VCR.use_cassette('examples/publish/554', record: :none) do
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
VCR.use_cassette('examples/publish/610', record: :none) do
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
VCR.use_cassette('examples/publish/606', record: :none) do
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
VCR.use_cassette('examples/publish/608', record: :none) do
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
VCR.use_cassette('examples/publish/604', record: :none) do
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
VCR.use_cassette('examples/publish/600', record: :none) do
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
VCR.use_cassette('examples/publish/602', record: :none) do
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
VCR.use_cassette('examples/publish/586', record: :none) do
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
VCR.use_cassette('examples/publish/582', record: :none) do
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
VCR.use_cassette('examples/publish/584', record: :none) do
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
VCR.use_cassette('examples/publish/580', record: :none) do
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
VCR.use_cassette('examples/publish/576', record: :none) do
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
VCR.use_cassette('examples/publish/578', record: :none) do
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
VCR.use_cassette('examples/publish/598', record: :none) do
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
VCR.use_cassette('examples/publish/594', record: :none) do
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
VCR.use_cassette('examples/publish/596', record: :none) do
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
VCR.use_cassette('examples/publish/592', record: :none) do
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
VCR.use_cassette('examples/publish/588', record: :none) do
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
VCR.use_cassette('examples/publish/590', record: :none) do
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
VCR.use_cassette('examples/publish/754', record: :none) do
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
VCR.use_cassette('examples/publish/750', record: :none) do
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
VCR.use_cassette('examples/publish/752', record: :none) do
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
VCR.use_cassette('examples/publish/748', record: :none) do
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
VCR.use_cassette('examples/publish/744', record: :none) do
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
VCR.use_cassette('examples/publish/746', record: :none) do
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
VCR.use_cassette('examples/publish/730', record: :none) do
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
VCR.use_cassette('examples/publish/726', record: :none) do
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
VCR.use_cassette('examples/publish/728', record: :none) do
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
VCR.use_cassette('examples/publish/724', record: :none) do
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
VCR.use_cassette('examples/publish/720', record: :none) do
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
VCR.use_cassette('examples/publish/722', record: :none) do
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
VCR.use_cassette('examples/publish/742', record: :none) do
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
VCR.use_cassette('examples/publish/738', record: :none) do
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
VCR.use_cassette('examples/publish/740', record: :none) do
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
VCR.use_cassette('examples/publish/736', record: :none) do
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
VCR.use_cassette('examples/publish/732', record: :none) do
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
VCR.use_cassette('examples/publish/734', record: :none) do
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
VCR.use_cassette('examples/publish/682', record: :none) do
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
VCR.use_cassette('examples/publish/678', record: :none) do
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
VCR.use_cassette('examples/publish/680', record: :none) do
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
VCR.use_cassette('examples/publish/676', record: :none) do
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
VCR.use_cassette('examples/publish/672', record: :none) do
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
VCR.use_cassette('examples/publish/674', record: :none) do
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
VCR.use_cassette('examples/publish/658', record: :none) do
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
VCR.use_cassette('examples/publish/654', record: :none) do
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
VCR.use_cassette('examples/publish/656', record: :none) do
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
VCR.use_cassette('examples/publish/652', record: :none) do
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
VCR.use_cassette('examples/publish/648', record: :none) do
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
VCR.use_cassette('examples/publish/650', record: :none) do
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
VCR.use_cassette('examples/publish/670', record: :none) do
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
VCR.use_cassette('examples/publish/666', record: :none) do
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
VCR.use_cassette('examples/publish/668', record: :none) do
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
VCR.use_cassette('examples/publish/664', record: :none) do
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
VCR.use_cassette('examples/publish/660', record: :none) do
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
VCR.use_cassette('examples/publish/662', record: :none) do
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
VCR.use_cassette('examples/publish/718', record: :none) do
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
VCR.use_cassette('examples/publish/714', record: :none) do
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
VCR.use_cassette('examples/publish/716', record: :none) do
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
VCR.use_cassette('examples/publish/712', record: :none) do
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
VCR.use_cassette('examples/publish/708', record: :none) do
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
VCR.use_cassette('examples/publish/710', record: :none) do
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
VCR.use_cassette('examples/publish/694', record: :none) do
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
VCR.use_cassette('examples/publish/690', record: :none) do
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
VCR.use_cassette('examples/publish/692', record: :none) do
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
VCR.use_cassette('examples/publish/688', record: :none) do
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
VCR.use_cassette('examples/publish/684', record: :none) do
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
VCR.use_cassette('examples/publish/686', record: :none) do
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
VCR.use_cassette('examples/publish/706', record: :none) do
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
VCR.use_cassette('examples/publish/702', record: :none) do
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
VCR.use_cassette('examples/publish/704', record: :none) do
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
VCR.use_cassette('examples/publish/700', record: :none) do
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
VCR.use_cassette('examples/publish/696', record: :none) do
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
VCR.use_cassette('examples/publish/698', record: :none) do
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
VCR.use_cassette('examples/publish/106', record: :none) do
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
VCR.use_cassette('examples/publish/102', record: :none) do
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
VCR.use_cassette('examples/publish/104', record: :none) do
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
VCR.use_cassette('examples/publish/100', record: :none) do
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
VCR.use_cassette('examples/publish/96', record: :none) do
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
VCR.use_cassette('examples/publish/98', record: :none) do
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
VCR.use_cassette('examples/publish/82', record: :none) do
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
VCR.use_cassette('examples/publish/78', record: :none) do
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
VCR.use_cassette('examples/publish/80', record: :none) do
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
VCR.use_cassette('examples/publish/76', record: :none) do
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
VCR.use_cassette('examples/publish/72', record: :none) do
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
VCR.use_cassette('examples/publish/74', record: :none) do
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
VCR.use_cassette('examples/publish/94', record: :none) do
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
VCR.use_cassette('examples/publish/90', record: :none) do
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
VCR.use_cassette('examples/publish/92', record: :none) do
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
VCR.use_cassette('examples/publish/88', record: :none) do
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
VCR.use_cassette('examples/publish/84', record: :none) do
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
VCR.use_cassette('examples/publish/86', record: :none) do
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
VCR.use_cassette('examples/publish/34', record: :none) do
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
VCR.use_cassette('examples/publish/30', record: :none) do
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
VCR.use_cassette('examples/publish/32', record: :none) do
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
VCR.use_cassette('examples/publish/28', record: :none) do
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
VCR.use_cassette('examples/publish/24', record: :none) do
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
VCR.use_cassette('examples/publish/26', record: :none) do
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
VCR.use_cassette('examples/publish/10', record: :none) do
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
VCR.use_cassette('examples/publish/6', record: :none) do
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
VCR.use_cassette('examples/publish/8', record: :none) do
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
VCR.use_cassette('examples/publish/4', record: :none) do
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
VCR.use_cassette('examples/publish/0', record: :none) do
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
VCR.use_cassette('examples/publish/2', record: :none) do
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
VCR.use_cassette('examples/publish/22', record: :none) do
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
VCR.use_cassette('examples/publish/18', record: :none) do
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
VCR.use_cassette('examples/publish/20', record: :none) do
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
VCR.use_cassette('examples/publish/16', record: :none) do
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
VCR.use_cassette('examples/publish/12', record: :none) do
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
VCR.use_cassette('examples/publish/14', record: :none) do
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
VCR.use_cassette('examples/publish/70', record: :none) do
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
VCR.use_cassette('examples/publish/66', record: :none) do
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
VCR.use_cassette('examples/publish/68', record: :none) do
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
VCR.use_cassette('examples/publish/64', record: :none) do
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
VCR.use_cassette('examples/publish/60', record: :none) do
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
VCR.use_cassette('examples/publish/62', record: :none) do
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
VCR.use_cassette('examples/publish/46', record: :none) do
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
VCR.use_cassette('examples/publish/42', record: :none) do
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
VCR.use_cassette('examples/publish/44', record: :none) do
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
VCR.use_cassette('examples/publish/40', record: :none) do
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
VCR.use_cassette('examples/publish/36', record: :none) do
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
VCR.use_cassette('examples/publish/38', record: :none) do
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
VCR.use_cassette('examples/publish/58', record: :none) do
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
VCR.use_cassette('examples/publish/54', record: :none) do
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
VCR.use_cassette('examples/publish/56', record: :none) do
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
VCR.use_cassette('examples/publish/52', record: :none) do
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
VCR.use_cassette('examples/publish/48', record: :none) do
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
VCR.use_cassette('examples/publish/50', record: :none) do
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
VCR.use_cassette('examples/publish/430', record: :none) do
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
VCR.use_cassette('examples/publish/426', record: :none) do
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
VCR.use_cassette('examples/publish/428', record: :none) do
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
VCR.use_cassette('examples/publish/424', record: :none) do
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
VCR.use_cassette('examples/publish/420', record: :none) do
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
VCR.use_cassette('examples/publish/422', record: :none) do
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
VCR.use_cassette('examples/publish/406', record: :none) do
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
VCR.use_cassette('examples/publish/402', record: :none) do
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
VCR.use_cassette('examples/publish/404', record: :none) do
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
VCR.use_cassette('examples/publish/400', record: :none) do
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
VCR.use_cassette('examples/publish/396', record: :none) do
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
VCR.use_cassette('examples/publish/398', record: :none) do
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
VCR.use_cassette('examples/publish/418', record: :none) do
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
VCR.use_cassette('examples/publish/414', record: :none) do
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
VCR.use_cassette('examples/publish/416', record: :none) do
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
VCR.use_cassette('examples/publish/412', record: :none) do
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
VCR.use_cassette('examples/publish/408', record: :none) do
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
VCR.use_cassette('examples/publish/410', record: :none) do
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
VCR.use_cassette('examples/publish/358', record: :none) do
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
VCR.use_cassette('examples/publish/354', record: :none) do
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
VCR.use_cassette('examples/publish/356', record: :none) do
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
VCR.use_cassette('examples/publish/352', record: :none) do
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
VCR.use_cassette('examples/publish/348', record: :none) do
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
VCR.use_cassette('examples/publish/350', record: :none) do
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
VCR.use_cassette('examples/publish/334', record: :none) do
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
VCR.use_cassette('examples/publish/330', record: :none) do
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
VCR.use_cassette('examples/publish/332', record: :none) do
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
VCR.use_cassette('examples/publish/328', record: :none) do
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
VCR.use_cassette('examples/publish/324', record: :none) do
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
VCR.use_cassette('examples/publish/326', record: :none) do
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
VCR.use_cassette('examples/publish/346', record: :none) do
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
VCR.use_cassette('examples/publish/342', record: :none) do
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
VCR.use_cassette('examples/publish/344', record: :none) do
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
VCR.use_cassette('examples/publish/340', record: :none) do
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
VCR.use_cassette('examples/publish/336', record: :none) do
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
VCR.use_cassette('examples/publish/338', record: :none) do
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
VCR.use_cassette('examples/publish/394', record: :none) do
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
VCR.use_cassette('examples/publish/390', record: :none) do
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
VCR.use_cassette('examples/publish/392', record: :none) do
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
VCR.use_cassette('examples/publish/388', record: :none) do
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
VCR.use_cassette('examples/publish/384', record: :none) do
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
VCR.use_cassette('examples/publish/386', record: :none) do
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
VCR.use_cassette('examples/publish/370', record: :none) do
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
VCR.use_cassette('examples/publish/366', record: :none) do
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
VCR.use_cassette('examples/publish/368', record: :none) do
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
VCR.use_cassette('examples/publish/364', record: :none) do
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
VCR.use_cassette('examples/publish/360', record: :none) do
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
VCR.use_cassette('examples/publish/362', record: :none) do
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
VCR.use_cassette('examples/publish/382', record: :none) do
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
VCR.use_cassette('examples/publish/378', record: :none) do
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
VCR.use_cassette('examples/publish/380', record: :none) do
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
VCR.use_cassette('examples/publish/376', record: :none) do
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
VCR.use_cassette('examples/publish/372', record: :none) do
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
VCR.use_cassette('examples/publish/374', record: :none) do
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
VCR.use_cassette('examples/publish/214', record: :none) do
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
VCR.use_cassette('examples/publish/210', record: :none) do
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
VCR.use_cassette('examples/publish/212', record: :none) do
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
VCR.use_cassette('examples/publish/208', record: :none) do
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
VCR.use_cassette('examples/publish/204', record: :none) do
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
VCR.use_cassette('examples/publish/206', record: :none) do
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
VCR.use_cassette('examples/publish/190', record: :none) do
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
VCR.use_cassette('examples/publish/186', record: :none) do
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
VCR.use_cassette('examples/publish/188', record: :none) do
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
VCR.use_cassette('examples/publish/184', record: :none) do
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
VCR.use_cassette('examples/publish/180', record: :none) do
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
VCR.use_cassette('examples/publish/182', record: :none) do
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
VCR.use_cassette('examples/publish/202', record: :none) do
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
VCR.use_cassette('examples/publish/198', record: :none) do
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
VCR.use_cassette('examples/publish/200', record: :none) do
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
VCR.use_cassette('examples/publish/196', record: :none) do
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
VCR.use_cassette('examples/publish/192', record: :none) do
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
VCR.use_cassette('examples/publish/194', record: :none) do
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
VCR.use_cassette('examples/publish/142', record: :none) do
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
VCR.use_cassette('examples/publish/138', record: :none) do
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
VCR.use_cassette('examples/publish/140', record: :none) do
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
VCR.use_cassette('examples/publish/136', record: :none) do
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
VCR.use_cassette('examples/publish/132', record: :none) do
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
VCR.use_cassette('examples/publish/134', record: :none) do
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
VCR.use_cassette('examples/publish/118', record: :none) do
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
VCR.use_cassette('examples/publish/114', record: :none) do
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
VCR.use_cassette('examples/publish/116', record: :none) do
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
VCR.use_cassette('examples/publish/112', record: :none) do
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
VCR.use_cassette('examples/publish/108', record: :none) do
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
VCR.use_cassette('examples/publish/110', record: :none) do
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
VCR.use_cassette('examples/publish/130', record: :none) do
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
VCR.use_cassette('examples/publish/126', record: :none) do
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
VCR.use_cassette('examples/publish/128', record: :none) do
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
VCR.use_cassette('examples/publish/124', record: :none) do
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
VCR.use_cassette('examples/publish/120', record: :none) do
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
VCR.use_cassette('examples/publish/122', record: :none) do
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
VCR.use_cassette('examples/publish/178', record: :none) do
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
VCR.use_cassette('examples/publish/174', record: :none) do
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
VCR.use_cassette('examples/publish/176', record: :none) do
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
VCR.use_cassette('examples/publish/172', record: :none) do
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
VCR.use_cassette('examples/publish/168', record: :none) do
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
VCR.use_cassette('examples/publish/170', record: :none) do
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
VCR.use_cassette('examples/publish/154', record: :none) do
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
VCR.use_cassette('examples/publish/150', record: :none) do
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
VCR.use_cassette('examples/publish/152', record: :none) do
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
VCR.use_cassette('examples/publish/148', record: :none) do
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
VCR.use_cassette('examples/publish/144', record: :none) do
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
VCR.use_cassette('examples/publish/146', record: :none) do
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
VCR.use_cassette('examples/publish/166', record: :none) do
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
VCR.use_cassette('examples/publish/162', record: :none) do
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
VCR.use_cassette('examples/publish/164', record: :none) do
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
VCR.use_cassette('examples/publish/160', record: :none) do
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
VCR.use_cassette('examples/publish/156', record: :none) do
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
VCR.use_cassette('examples/publish/158', record: :none) do
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
VCR.use_cassette('examples/publish/322', record: :none) do
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
VCR.use_cassette('examples/publish/318', record: :none) do
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
VCR.use_cassette('examples/publish/320', record: :none) do
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
VCR.use_cassette('examples/publish/316', record: :none) do
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
VCR.use_cassette('examples/publish/312', record: :none) do
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
VCR.use_cassette('examples/publish/314', record: :none) do
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
VCR.use_cassette('examples/publish/298', record: :none) do
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
VCR.use_cassette('examples/publish/294', record: :none) do
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
VCR.use_cassette('examples/publish/296', record: :none) do
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
VCR.use_cassette('examples/publish/292', record: :none) do
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
VCR.use_cassette('examples/publish/288', record: :none) do
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
VCR.use_cassette('examples/publish/290', record: :none) do
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
VCR.use_cassette('examples/publish/310', record: :none) do
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
VCR.use_cassette('examples/publish/306', record: :none) do
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
VCR.use_cassette('examples/publish/308', record: :none) do
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
VCR.use_cassette('examples/publish/304', record: :none) do
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
VCR.use_cassette('examples/publish/300', record: :none) do
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
VCR.use_cassette('examples/publish/302', record: :none) do
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
VCR.use_cassette('examples/publish/250', record: :none) do
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
VCR.use_cassette('examples/publish/246', record: :none) do
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
VCR.use_cassette('examples/publish/248', record: :none) do
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
VCR.use_cassette('examples/publish/244', record: :none) do
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
VCR.use_cassette('examples/publish/240', record: :none) do
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
VCR.use_cassette('examples/publish/242', record: :none) do
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
VCR.use_cassette('examples/publish/226', record: :none) do
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
VCR.use_cassette('examples/publish/222', record: :none) do
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
VCR.use_cassette('examples/publish/224', record: :none) do
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
VCR.use_cassette('examples/publish/220', record: :none) do
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
VCR.use_cassette('examples/publish/216', record: :none) do
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
VCR.use_cassette('examples/publish/218', record: :none) do
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
VCR.use_cassette('examples/publish/238', record: :none) do
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
VCR.use_cassette('examples/publish/234', record: :none) do
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
VCR.use_cassette('examples/publish/236', record: :none) do
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
VCR.use_cassette('examples/publish/232', record: :none) do
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
VCR.use_cassette('examples/publish/228', record: :none) do
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
VCR.use_cassette('examples/publish/230', record: :none) do
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
VCR.use_cassette('examples/publish/286', record: :none) do
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
VCR.use_cassette('examples/publish/282', record: :none) do
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
VCR.use_cassette('examples/publish/284', record: :none) do
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
VCR.use_cassette('examples/publish/280', record: :none) do
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
VCR.use_cassette('examples/publish/276', record: :none) do
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
VCR.use_cassette('examples/publish/278', record: :none) do
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
VCR.use_cassette('examples/publish/262', record: :none) do
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
VCR.use_cassette('examples/publish/258', record: :none) do
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
VCR.use_cassette('examples/publish/260', record: :none) do
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
VCR.use_cassette('examples/publish/256', record: :none) do
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
VCR.use_cassette('examples/publish/252', record: :none) do
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
VCR.use_cassette('examples/publish/254', record: :none) do
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
VCR.use_cassette('examples/publish/274', record: :none) do
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
VCR.use_cassette('examples/publish/270', record: :none) do
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
VCR.use_cassette('examples/publish/272', record: :none) do
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
VCR.use_cassette('examples/publish/268', record: :none) do
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
VCR.use_cassette('examples/publish/264', record: :none) do
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
VCR.use_cassette('examples/publish/266', record: :none) do
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
VCR.use_cassette('examples/publish/539', record: :none) do
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
VCR.use_cassette('examples/publish/535', record: :none) do
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
VCR.use_cassette('examples/publish/537', record: :none) do
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
VCR.use_cassette('examples/publish/533', record: :none) do
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
VCR.use_cassette('examples/publish/529', record: :none) do
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
VCR.use_cassette('examples/publish/531', record: :none) do
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
VCR.use_cassette('examples/publish/515', record: :none) do
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
VCR.use_cassette('examples/publish/511', record: :none) do
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
VCR.use_cassette('examples/publish/513', record: :none) do
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
VCR.use_cassette('examples/publish/509', record: :none) do
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
VCR.use_cassette('examples/publish/505', record: :none) do
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
VCR.use_cassette('examples/publish/507', record: :none) do
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
VCR.use_cassette('examples/publish/527', record: :none) do
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
VCR.use_cassette('examples/publish/523', record: :none) do
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
VCR.use_cassette('examples/publish/525', record: :none) do
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
VCR.use_cassette('examples/publish/521', record: :none) do
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
VCR.use_cassette('examples/publish/517', record: :none) do
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
VCR.use_cassette('examples/publish/519', record: :none) do
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
VCR.use_cassette('examples/publish/467', record: :none) do
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
VCR.use_cassette('examples/publish/463', record: :none) do
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
VCR.use_cassette('examples/publish/465', record: :none) do
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
VCR.use_cassette('examples/publish/461', record: :none) do
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
VCR.use_cassette('examples/publish/457', record: :none) do
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
VCR.use_cassette('examples/publish/459', record: :none) do
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
VCR.use_cassette('examples/publish/443', record: :none) do
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
VCR.use_cassette('examples/publish/439', record: :none) do
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
VCR.use_cassette('examples/publish/441', record: :none) do
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
VCR.use_cassette('examples/publish/437', record: :none) do
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
VCR.use_cassette('examples/publish/433', record: :none) do
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
VCR.use_cassette('examples/publish/435', record: :none) do
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
VCR.use_cassette('examples/publish/455', record: :none) do
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
VCR.use_cassette('examples/publish/451', record: :none) do
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
VCR.use_cassette('examples/publish/453', record: :none) do
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
VCR.use_cassette('examples/publish/449', record: :none) do
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
VCR.use_cassette('examples/publish/445', record: :none) do
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
VCR.use_cassette('examples/publish/447', record: :none) do
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
VCR.use_cassette('examples/publish/503', record: :none) do
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
VCR.use_cassette('examples/publish/499', record: :none) do
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
VCR.use_cassette('examples/publish/501', record: :none) do
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
VCR.use_cassette('examples/publish/497', record: :none) do
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
VCR.use_cassette('examples/publish/493', record: :none) do
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
VCR.use_cassette('examples/publish/495', record: :none) do
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
VCR.use_cassette('examples/publish/479', record: :none) do
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
VCR.use_cassette('examples/publish/475', record: :none) do
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
VCR.use_cassette('examples/publish/477', record: :none) do
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
VCR.use_cassette('examples/publish/473', record: :none) do
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
VCR.use_cassette('examples/publish/469', record: :none) do
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
VCR.use_cassette('examples/publish/471', record: :none) do
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
VCR.use_cassette('examples/publish/491', record: :none) do
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
VCR.use_cassette('examples/publish/487', record: :none) do
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
VCR.use_cassette('examples/publish/489', record: :none) do
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
VCR.use_cassette('examples/publish/485', record: :none) do
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
VCR.use_cassette('examples/publish/481', record: :none) do
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
VCR.use_cassette('examples/publish/483', record: :none) do
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
VCR.use_cassette('examples/publish/863', record: :none) do
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
VCR.use_cassette('examples/publish/859', record: :none) do
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
VCR.use_cassette('examples/publish/861', record: :none) do
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
VCR.use_cassette('examples/publish/857', record: :none) do
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
VCR.use_cassette('examples/publish/853', record: :none) do
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
VCR.use_cassette('examples/publish/855', record: :none) do
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
VCR.use_cassette('examples/publish/839', record: :none) do
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
VCR.use_cassette('examples/publish/835', record: :none) do
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
VCR.use_cassette('examples/publish/837', record: :none) do
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
VCR.use_cassette('examples/publish/833', record: :none) do
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
VCR.use_cassette('examples/publish/829', record: :none) do
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
VCR.use_cassette('examples/publish/831', record: :none) do
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
VCR.use_cassette('examples/publish/851', record: :none) do
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
VCR.use_cassette('examples/publish/847', record: :none) do
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
VCR.use_cassette('examples/publish/849', record: :none) do
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
VCR.use_cassette('examples/publish/845', record: :none) do
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
VCR.use_cassette('examples/publish/841', record: :none) do
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
VCR.use_cassette('examples/publish/843', record: :none) do
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
VCR.use_cassette('examples/publish/791', record: :none) do
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
VCR.use_cassette('examples/publish/787', record: :none) do
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
VCR.use_cassette('examples/publish/789', record: :none) do
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
VCR.use_cassette('examples/publish/785', record: :none) do
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
VCR.use_cassette('examples/publish/781', record: :none) do
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
VCR.use_cassette('examples/publish/783', record: :none) do
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
VCR.use_cassette('examples/publish/767', record: :none) do
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
VCR.use_cassette('examples/publish/763', record: :none) do
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
VCR.use_cassette('examples/publish/765', record: :none) do
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
VCR.use_cassette('examples/publish/761', record: :none) do
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
VCR.use_cassette('examples/publish/757', record: :none) do
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
VCR.use_cassette('examples/publish/759', record: :none) do
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
VCR.use_cassette('examples/publish/779', record: :none) do
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
VCR.use_cassette('examples/publish/775', record: :none) do
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
VCR.use_cassette('examples/publish/777', record: :none) do
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
VCR.use_cassette('examples/publish/773', record: :none) do
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
VCR.use_cassette('examples/publish/769', record: :none) do
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
VCR.use_cassette('examples/publish/771', record: :none) do
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
VCR.use_cassette('examples/publish/827', record: :none) do
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
VCR.use_cassette('examples/publish/823', record: :none) do
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
VCR.use_cassette('examples/publish/825', record: :none) do
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
VCR.use_cassette('examples/publish/821', record: :none) do
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
VCR.use_cassette('examples/publish/817', record: :none) do
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
VCR.use_cassette('examples/publish/819', record: :none) do
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
VCR.use_cassette('examples/publish/803', record: :none) do
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
VCR.use_cassette('examples/publish/799', record: :none) do
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
VCR.use_cassette('examples/publish/801', record: :none) do
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
VCR.use_cassette('examples/publish/797', record: :none) do
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
VCR.use_cassette('examples/publish/793', record: :none) do
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
VCR.use_cassette('examples/publish/795', record: :none) do
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
VCR.use_cassette('examples/publish/815', record: :none) do
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
VCR.use_cassette('examples/publish/811', record: :none) do
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
VCR.use_cassette('examples/publish/813', record: :none) do
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
VCR.use_cassette('examples/publish/809', record: :none) do
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
VCR.use_cassette('examples/publish/805', record: :none) do
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
VCR.use_cassette('examples/publish/807', record: :none) do
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
VCR.use_cassette('examples/publish/647', record: :none) do
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
VCR.use_cassette('examples/publish/643', record: :none) do
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
VCR.use_cassette('examples/publish/645', record: :none) do
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
VCR.use_cassette('examples/publish/641', record: :none) do
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
VCR.use_cassette('examples/publish/637', record: :none) do
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
VCR.use_cassette('examples/publish/639', record: :none) do
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
VCR.use_cassette('examples/publish/623', record: :none) do
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
VCR.use_cassette('examples/publish/619', record: :none) do
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
VCR.use_cassette('examples/publish/621', record: :none) do
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
VCR.use_cassette('examples/publish/617', record: :none) do
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
VCR.use_cassette('examples/publish/613', record: :none) do
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
VCR.use_cassette('examples/publish/615', record: :none) do
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
VCR.use_cassette('examples/publish/635', record: :none) do
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
VCR.use_cassette('examples/publish/631', record: :none) do
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
VCR.use_cassette('examples/publish/633', record: :none) do
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
VCR.use_cassette('examples/publish/629', record: :none) do
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
VCR.use_cassette('examples/publish/625', record: :none) do
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
VCR.use_cassette('examples/publish/627', record: :none) do
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
VCR.use_cassette('examples/publish/575', record: :none) do
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
VCR.use_cassette('examples/publish/571', record: :none) do
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
VCR.use_cassette('examples/publish/573', record: :none) do
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
VCR.use_cassette('examples/publish/569', record: :none) do
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
VCR.use_cassette('examples/publish/565', record: :none) do
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
VCR.use_cassette('examples/publish/567', record: :none) do
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
VCR.use_cassette('examples/publish/551', record: :none) do
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
VCR.use_cassette('examples/publish/547', record: :none) do
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
VCR.use_cassette('examples/publish/549', record: :none) do
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
VCR.use_cassette('examples/publish/545', record: :none) do
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
VCR.use_cassette('examples/publish/541', record: :none) do
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
VCR.use_cassette('examples/publish/543', record: :none) do
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
VCR.use_cassette('examples/publish/563', record: :none) do
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
VCR.use_cassette('examples/publish/559', record: :none) do
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
VCR.use_cassette('examples/publish/561', record: :none) do
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
VCR.use_cassette('examples/publish/557', record: :none) do
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
VCR.use_cassette('examples/publish/553', record: :none) do
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
VCR.use_cassette('examples/publish/555', record: :none) do
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
VCR.use_cassette('examples/publish/611', record: :none) do
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
VCR.use_cassette('examples/publish/607', record: :none) do
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
VCR.use_cassette('examples/publish/609', record: :none) do
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
VCR.use_cassette('examples/publish/605', record: :none) do
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
VCR.use_cassette('examples/publish/601', record: :none) do
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
VCR.use_cassette('examples/publish/603', record: :none) do
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
VCR.use_cassette('examples/publish/587', record: :none) do
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
VCR.use_cassette('examples/publish/583', record: :none) do
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
VCR.use_cassette('examples/publish/585', record: :none) do
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
VCR.use_cassette('examples/publish/581', record: :none) do
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
VCR.use_cassette('examples/publish/577', record: :none) do
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
VCR.use_cassette('examples/publish/579', record: :none) do
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
VCR.use_cassette('examples/publish/599', record: :none) do
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
VCR.use_cassette('examples/publish/595', record: :none) do
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
VCR.use_cassette('examples/publish/597', record: :none) do
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
VCR.use_cassette('examples/publish/593', record: :none) do
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
VCR.use_cassette('examples/publish/589', record: :none) do
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
VCR.use_cassette('examples/publish/591', record: :none) do
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
VCR.use_cassette('examples/publish/755', record: :none) do
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
VCR.use_cassette('examples/publish/751', record: :none) do
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
VCR.use_cassette('examples/publish/753', record: :none) do
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
VCR.use_cassette('examples/publish/749', record: :none) do
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
VCR.use_cassette('examples/publish/745', record: :none) do
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
VCR.use_cassette('examples/publish/747', record: :none) do
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
VCR.use_cassette('examples/publish/731', record: :none) do
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
VCR.use_cassette('examples/publish/727', record: :none) do
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
VCR.use_cassette('examples/publish/729', record: :none) do
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
VCR.use_cassette('examples/publish/725', record: :none) do
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
VCR.use_cassette('examples/publish/721', record: :none) do
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
VCR.use_cassette('examples/publish/723', record: :none) do
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
VCR.use_cassette('examples/publish/743', record: :none) do
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
VCR.use_cassette('examples/publish/739', record: :none) do
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
VCR.use_cassette('examples/publish/741', record: :none) do
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
VCR.use_cassette('examples/publish/737', record: :none) do
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
VCR.use_cassette('examples/publish/733', record: :none) do
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
VCR.use_cassette('examples/publish/735', record: :none) do
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
VCR.use_cassette('examples/publish/683', record: :none) do
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
VCR.use_cassette('examples/publish/679', record: :none) do
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
VCR.use_cassette('examples/publish/681', record: :none) do
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
VCR.use_cassette('examples/publish/677', record: :none) do
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
VCR.use_cassette('examples/publish/673', record: :none) do
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
VCR.use_cassette('examples/publish/675', record: :none) do
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
VCR.use_cassette('examples/publish/659', record: :none) do
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
VCR.use_cassette('examples/publish/655', record: :none) do
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
VCR.use_cassette('examples/publish/657', record: :none) do
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
VCR.use_cassette('examples/publish/653', record: :none) do
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
VCR.use_cassette('examples/publish/649', record: :none) do
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
VCR.use_cassette('examples/publish/651', record: :none) do
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
VCR.use_cassette('examples/publish/671', record: :none) do
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
VCR.use_cassette('examples/publish/667', record: :none) do
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
VCR.use_cassette('examples/publish/669', record: :none) do
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
VCR.use_cassette('examples/publish/665', record: :none) do
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
VCR.use_cassette('examples/publish/661', record: :none) do
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
VCR.use_cassette('examples/publish/663', record: :none) do
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
VCR.use_cassette('examples/publish/719', record: :none) do
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
VCR.use_cassette('examples/publish/715', record: :none) do
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
VCR.use_cassette('examples/publish/717', record: :none) do
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
VCR.use_cassette('examples/publish/713', record: :none) do
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
VCR.use_cassette('examples/publish/709', record: :none) do
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
VCR.use_cassette('examples/publish/711', record: :none) do
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
VCR.use_cassette('examples/publish/695', record: :none) do
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
VCR.use_cassette('examples/publish/691', record: :none) do
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
VCR.use_cassette('examples/publish/693', record: :none) do
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
VCR.use_cassette('examples/publish/689', record: :none) do
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
VCR.use_cassette('examples/publish/685', record: :none) do
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
VCR.use_cassette('examples/publish/687', record: :none) do
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
VCR.use_cassette('examples/publish/707', record: :none) do
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
VCR.use_cassette('examples/publish/703', record: :none) do
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
VCR.use_cassette('examples/publish/705', record: :none) do
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
VCR.use_cassette('examples/publish/701', record: :none) do
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
VCR.use_cassette('examples/publish/697', record: :none) do
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
VCR.use_cassette('examples/publish/699', record: :none) do
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
VCR.use_cassette('examples/publish/107', record: :none) do
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
VCR.use_cassette('examples/publish/103', record: :none) do
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
VCR.use_cassette('examples/publish/105', record: :none) do
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
VCR.use_cassette('examples/publish/101', record: :none) do
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
VCR.use_cassette('examples/publish/97', record: :none) do
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
VCR.use_cassette('examples/publish/99', record: :none) do
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
VCR.use_cassette('examples/publish/83', record: :none) do
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
VCR.use_cassette('examples/publish/79', record: :none) do
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
VCR.use_cassette('examples/publish/81', record: :none) do
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
VCR.use_cassette('examples/publish/77', record: :none) do
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
VCR.use_cassette('examples/publish/73', record: :none) do
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
VCR.use_cassette('examples/publish/75', record: :none) do
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
VCR.use_cassette('examples/publish/95', record: :none) do
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
VCR.use_cassette('examples/publish/91', record: :none) do
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
VCR.use_cassette('examples/publish/93', record: :none) do
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
VCR.use_cassette('examples/publish/89', record: :none) do
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
VCR.use_cassette('examples/publish/85', record: :none) do
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
VCR.use_cassette('examples/publish/87', record: :none) do
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
VCR.use_cassette('examples/publish/35', record: :none) do
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
VCR.use_cassette('examples/publish/31', record: :none) do
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
VCR.use_cassette('examples/publish/33', record: :none) do
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
VCR.use_cassette('examples/publish/29', record: :none) do
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
VCR.use_cassette('examples/publish/25', record: :none) do
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
VCR.use_cassette('examples/publish/27', record: :none) do
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
VCR.use_cassette('examples/publish/11', record: :none) do
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
VCR.use_cassette('examples/publish/7', record: :none) do
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
VCR.use_cassette('examples/publish/9', record: :none) do
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
VCR.use_cassette('examples/publish/5', record: :none) do
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
VCR.use_cassette('examples/publish/1', record: :none) do
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
VCR.use_cassette('examples/publish/3', record: :none) do
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
VCR.use_cassette('examples/publish/23', record: :none) do
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
VCR.use_cassette('examples/publish/19', record: :none) do
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
VCR.use_cassette('examples/publish/21', record: :none) do
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
VCR.use_cassette('examples/publish/17', record: :none) do
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
VCR.use_cassette('examples/publish/13', record: :none) do
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
VCR.use_cassette('examples/publish/15', record: :none) do
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
VCR.use_cassette('examples/publish/71', record: :none) do
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
VCR.use_cassette('examples/publish/67', record: :none) do
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
VCR.use_cassette('examples/publish/69', record: :none) do
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
VCR.use_cassette('examples/publish/65', record: :none) do
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
VCR.use_cassette('examples/publish/61', record: :none) do
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
VCR.use_cassette('examples/publish/63', record: :none) do
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
VCR.use_cassette('examples/publish/47', record: :none) do
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
VCR.use_cassette('examples/publish/43', record: :none) do
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
VCR.use_cassette('examples/publish/45', record: :none) do
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
VCR.use_cassette('examples/publish/41', record: :none) do
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
VCR.use_cassette('examples/publish/37', record: :none) do
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
VCR.use_cassette('examples/publish/39', record: :none) do
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
VCR.use_cassette('examples/publish/59', record: :none) do
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
VCR.use_cassette('examples/publish/55', record: :none) do
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
VCR.use_cassette('examples/publish/57', record: :none) do
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
VCR.use_cassette('examples/publish/53', record: :none) do
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
VCR.use_cassette('examples/publish/49', record: :none) do
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
VCR.use_cassette('examples/publish/51', record: :none) do
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
VCR.use_cassette('examples/publish/431', record: :none) do
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
VCR.use_cassette('examples/publish/427', record: :none) do
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
VCR.use_cassette('examples/publish/429', record: :none) do
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
VCR.use_cassette('examples/publish/425', record: :none) do
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
VCR.use_cassette('examples/publish/421', record: :none) do
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
VCR.use_cassette('examples/publish/423', record: :none) do
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
VCR.use_cassette('examples/publish/407', record: :none) do
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
VCR.use_cassette('examples/publish/403', record: :none) do
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
VCR.use_cassette('examples/publish/405', record: :none) do
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
VCR.use_cassette('examples/publish/401', record: :none) do
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
VCR.use_cassette('examples/publish/397', record: :none) do
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
VCR.use_cassette('examples/publish/399', record: :none) do
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
VCR.use_cassette('examples/publish/419', record: :none) do
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
VCR.use_cassette('examples/publish/415', record: :none) do
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
VCR.use_cassette('examples/publish/417', record: :none) do
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
VCR.use_cassette('examples/publish/413', record: :none) do
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
VCR.use_cassette('examples/publish/409', record: :none) do
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
VCR.use_cassette('examples/publish/411', record: :none) do
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
VCR.use_cassette('examples/publish/359', record: :none) do
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
VCR.use_cassette('examples/publish/355', record: :none) do
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
VCR.use_cassette('examples/publish/357', record: :none) do
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
VCR.use_cassette('examples/publish/353', record: :none) do
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
VCR.use_cassette('examples/publish/349', record: :none) do
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
VCR.use_cassette('examples/publish/351', record: :none) do
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
VCR.use_cassette('examples/publish/335', record: :none) do
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
VCR.use_cassette('examples/publish/331', record: :none) do
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
VCR.use_cassette('examples/publish/333', record: :none) do
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
VCR.use_cassette('examples/publish/329', record: :none) do
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
VCR.use_cassette('examples/publish/325', record: :none) do
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
VCR.use_cassette('examples/publish/327', record: :none) do
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
VCR.use_cassette('examples/publish/347', record: :none) do
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
VCR.use_cassette('examples/publish/343', record: :none) do
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
VCR.use_cassette('examples/publish/345', record: :none) do
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
VCR.use_cassette('examples/publish/341', record: :none) do
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
VCR.use_cassette('examples/publish/337', record: :none) do
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
VCR.use_cassette('examples/publish/339', record: :none) do
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
VCR.use_cassette('examples/publish/395', record: :none) do
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
VCR.use_cassette('examples/publish/391', record: :none) do
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
VCR.use_cassette('examples/publish/393', record: :none) do
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
VCR.use_cassette('examples/publish/389', record: :none) do
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
VCR.use_cassette('examples/publish/385', record: :none) do
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
VCR.use_cassette('examples/publish/387', record: :none) do
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
VCR.use_cassette('examples/publish/371', record: :none) do
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
VCR.use_cassette('examples/publish/367', record: :none) do
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
VCR.use_cassette('examples/publish/369', record: :none) do
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
VCR.use_cassette('examples/publish/365', record: :none) do
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
VCR.use_cassette('examples/publish/361', record: :none) do
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
VCR.use_cassette('examples/publish/363', record: :none) do
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
VCR.use_cassette('examples/publish/383', record: :none) do
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
VCR.use_cassette('examples/publish/379', record: :none) do
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
VCR.use_cassette('examples/publish/381', record: :none) do
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
VCR.use_cassette('examples/publish/377', record: :none) do
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
VCR.use_cassette('examples/publish/373', record: :none) do
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
VCR.use_cassette('examples/publish/375', record: :none) do
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
VCR.use_cassette('examples/publish/215', record: :none) do
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
VCR.use_cassette('examples/publish/211', record: :none) do
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
VCR.use_cassette('examples/publish/213', record: :none) do
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
VCR.use_cassette('examples/publish/209', record: :none) do
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
VCR.use_cassette('examples/publish/205', record: :none) do
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
VCR.use_cassette('examples/publish/207', record: :none) do
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
VCR.use_cassette('examples/publish/191', record: :none) do
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
VCR.use_cassette('examples/publish/187', record: :none) do
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
VCR.use_cassette('examples/publish/189', record: :none) do
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
VCR.use_cassette('examples/publish/185', record: :none) do
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
VCR.use_cassette('examples/publish/181', record: :none) do
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
VCR.use_cassette('examples/publish/183', record: :none) do
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
VCR.use_cassette('examples/publish/203', record: :none) do
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
VCR.use_cassette('examples/publish/199', record: :none) do
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
VCR.use_cassette('examples/publish/201', record: :none) do
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
VCR.use_cassette('examples/publish/197', record: :none) do
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
VCR.use_cassette('examples/publish/193', record: :none) do
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
VCR.use_cassette('examples/publish/195', record: :none) do
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
VCR.use_cassette('examples/publish/143', record: :none) do
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
VCR.use_cassette('examples/publish/139', record: :none) do
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
VCR.use_cassette('examples/publish/141', record: :none) do
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
VCR.use_cassette('examples/publish/137', record: :none) do
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
VCR.use_cassette('examples/publish/133', record: :none) do
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
VCR.use_cassette('examples/publish/135', record: :none) do
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
VCR.use_cassette('examples/publish/119', record: :none) do
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
VCR.use_cassette('examples/publish/115', record: :none) do
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
VCR.use_cassette('examples/publish/117', record: :none) do
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
VCR.use_cassette('examples/publish/113', record: :none) do
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
VCR.use_cassette('examples/publish/109', record: :none) do
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
VCR.use_cassette('examples/publish/111', record: :none) do
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
VCR.use_cassette('examples/publish/131', record: :none) do
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
VCR.use_cassette('examples/publish/127', record: :none) do
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
VCR.use_cassette('examples/publish/129', record: :none) do
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
VCR.use_cassette('examples/publish/125', record: :none) do
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
VCR.use_cassette('examples/publish/121', record: :none) do
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
VCR.use_cassette('examples/publish/123', record: :none) do
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
VCR.use_cassette('examples/publish/179', record: :none) do
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
VCR.use_cassette('examples/publish/175', record: :none) do
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
VCR.use_cassette('examples/publish/177', record: :none) do
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
VCR.use_cassette('examples/publish/173', record: :none) do
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
VCR.use_cassette('examples/publish/169', record: :none) do
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
VCR.use_cassette('examples/publish/171', record: :none) do
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
VCR.use_cassette('examples/publish/155', record: :none) do
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
VCR.use_cassette('examples/publish/151', record: :none) do
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
VCR.use_cassette('examples/publish/153', record: :none) do
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
VCR.use_cassette('examples/publish/149', record: :none) do
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
VCR.use_cassette('examples/publish/145', record: :none) do
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
VCR.use_cassette('examples/publish/147', record: :none) do
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
VCR.use_cassette('examples/publish/167', record: :none) do
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
VCR.use_cassette('examples/publish/163', record: :none) do
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
VCR.use_cassette('examples/publish/165', record: :none) do
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
VCR.use_cassette('examples/publish/161', record: :none) do
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
VCR.use_cassette('examples/publish/157', record: :none) do
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
VCR.use_cassette('examples/publish/159', record: :none) do
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
VCR.use_cassette('examples/publish/323', record: :none) do
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
VCR.use_cassette('examples/publish/319', record: :none) do
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
VCR.use_cassette('examples/publish/321', record: :none) do
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
VCR.use_cassette('examples/publish/317', record: :none) do
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
VCR.use_cassette('examples/publish/313', record: :none) do
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
VCR.use_cassette('examples/publish/315', record: :none) do
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
VCR.use_cassette('examples/publish/299', record: :none) do
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
VCR.use_cassette('examples/publish/295', record: :none) do
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
VCR.use_cassette('examples/publish/297', record: :none) do
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
VCR.use_cassette('examples/publish/293', record: :none) do
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
VCR.use_cassette('examples/publish/289', record: :none) do
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
VCR.use_cassette('examples/publish/291', record: :none) do
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
VCR.use_cassette('examples/publish/311', record: :none) do
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
VCR.use_cassette('examples/publish/307', record: :none) do
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
VCR.use_cassette('examples/publish/309', record: :none) do
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
VCR.use_cassette('examples/publish/305', record: :none) do
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
VCR.use_cassette('examples/publish/301', record: :none) do
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
VCR.use_cassette('examples/publish/303', record: :none) do
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
VCR.use_cassette('examples/publish/251', record: :none) do
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
VCR.use_cassette('examples/publish/247', record: :none) do
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
VCR.use_cassette('examples/publish/249', record: :none) do
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
VCR.use_cassette('examples/publish/245', record: :none) do
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
VCR.use_cassette('examples/publish/241', record: :none) do
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
VCR.use_cassette('examples/publish/243', record: :none) do
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
VCR.use_cassette('examples/publish/227', record: :none) do
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
VCR.use_cassette('examples/publish/223', record: :none) do
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
VCR.use_cassette('examples/publish/225', record: :none) do
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
VCR.use_cassette('examples/publish/221', record: :none) do
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
VCR.use_cassette('examples/publish/217', record: :none) do
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
VCR.use_cassette('examples/publish/219', record: :none) do
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
VCR.use_cassette('examples/publish/239', record: :none) do
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
VCR.use_cassette('examples/publish/235', record: :none) do
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
VCR.use_cassette('examples/publish/237', record: :none) do
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
VCR.use_cassette('examples/publish/233', record: :none) do
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
VCR.use_cassette('examples/publish/229', record: :none) do
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
VCR.use_cassette('examples/publish/231', record: :none) do
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
VCR.use_cassette('examples/publish/287', record: :none) do
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
VCR.use_cassette('examples/publish/283', record: :none) do
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
VCR.use_cassette('examples/publish/285', record: :none) do
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
VCR.use_cassette('examples/publish/281', record: :none) do
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
VCR.use_cassette('examples/publish/277', record: :none) do
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
VCR.use_cassette('examples/publish/279', record: :none) do
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
VCR.use_cassette('examples/publish/263', record: :none) do
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
VCR.use_cassette('examples/publish/259', record: :none) do
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
VCR.use_cassette('examples/publish/261', record: :none) do
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
VCR.use_cassette('examples/publish/257', record: :none) do
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
VCR.use_cassette('examples/publish/253', record: :none) do
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
VCR.use_cassette('examples/publish/255', record: :none) do
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
VCR.use_cassette('examples/publish/275', record: :none) do
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
VCR.use_cassette('examples/publish/271', record: :none) do
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
VCR.use_cassette('examples/publish/273', record: :none) do
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
VCR.use_cassette('examples/publish/269', record: :none) do
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
VCR.use_cassette('examples/publish/265', record: :none) do
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
VCR.use_cassette('examples/publish/267', record: :none) do
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

