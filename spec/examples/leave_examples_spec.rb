require 'spec_helper'

describe Pubnub::Leave do
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

  it '__channel___demo___channel_group__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/17', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___channel_group__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/15', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___channel_group__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/16', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___channel_group__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/14', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___channel_group__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/12', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo___channel_group__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/13', record: :none) do
envelope = @pubnub.leave(channel: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/11', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/9', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/10', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/8', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/6', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel___demo____channel_group__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/7', record: :none) do
envelope = @pubnub.leave(channel: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/5', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/3', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/4', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/2', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/0', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel____demo___demo_____channel_group__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/1', record: :none) do
envelope = @pubnub.leave(channel: [:demo, "demo"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/35', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/33', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/34', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/32', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/30', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/31', record: :none) do
envelope = @pubnub.leave(channel_group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/29', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/27', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/28', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/26', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/24', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/25', record: :none) do
envelope = @pubnub.leave(channel_group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/leave/23', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__true___callback___block_' do
VCR.use_cassette('examples/leave/21', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/leave/22', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/leave/20', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__false___callback___block_' do
VCR.use_cassette('examples/leave/18', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


it '__channel__nil___channel_group____demo___demo_____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/leave/19', record: :none) do
envelope = @pubnub.leave(channel_group: [:demo, "demo"], http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:leave)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"pubsub.pubnub.com"})


end
end


end

