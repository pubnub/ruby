require 'spec_helper'

describe Pubnub::ChannelRegistration do
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

    example.run

  end

  it '__action___add___channel___demo___channel_group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/23', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/21', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/22', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/20', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/18', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/19', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/17', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/15', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/16', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/14', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/12', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo___channel_group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/13', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: :demo, channel_group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/11', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/9', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/10', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/8', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/6', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/7', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/5', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/3', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/4', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/2', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/0', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___add___channel___demo____channel_group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/1', record: :none) do
envelope = @pubnub.channel_registration(action: :add, channel: 'demo', channel_group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_add)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_add)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/47', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/45', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/46', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/44', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/42', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/43', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/41', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/39', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/40', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/38', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/36', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo___channel_group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/37', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: :demo, channel_group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/35', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/33', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/34', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/32', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/30', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/31', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/channel_registration/29', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/channel_registration/27', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/28', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/channel_registration/26', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/channel_registration/24', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


it '__action___remove___channel___demo____channel_group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/channel_registration/25', record: :none) do
envelope = @pubnub.channel_registration(action: :remove, channel: 'demo', channel_group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:channel_group_remove)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:channel_group_remove)

end
end


end

