require 'spec_helper'

describe Pubnub::HereNow do
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

  it '__channel___demo___group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/29', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/27', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/28', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/26', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/24', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/25', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/23', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/21', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/22', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/20', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/18', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/19', record: :none) do
envelope = @pubnub.here_now(channel: :demo, group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo___group__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/35', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo___group__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/33', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo___group__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/34', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo___group__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/32', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo___group__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/30', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo___group__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/31', record: :none) do
envelope = @pubnub.here_now(channel: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/11', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/9', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/10', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/8', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/6', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/7', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: :demo, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/5', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/3', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/4', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/2', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/0', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/1', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', group: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>nil, :occupancy=>nil, :total_occupancy=>1, :total_channels=>1, :channels=>{"demo"=>{"uuids"=>["ruby-test-uuid-client-one"], "occupancy"=>1}}})

end
end


it '__channel___demo____group__nil___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/here_now/17', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group__nil___http_sync__true___callback___block_' do
VCR.use_cassette('examples/here_now/15', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group__nil___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/here_now/16', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group__nil___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/here_now/14', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group__nil___http_sync__false___callback___block_' do
VCR.use_cassette('examples/here_now/12', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


it '__channel___demo____group__nil___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/here_now/13', record: :none) do
envelope = @pubnub.here_now(channel: 'demo', http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelope.result[:code]).to eq(200)
expect(envelope.result[:operation]).to eq(:here_now)
expect(envelope.result[:data]).to eq({:uuids=>["ruby-test-uuid-client-one"], :occupancy=>1, :total_occupancy=>nil, :total_channels=>nil, :channels=>nil})

end
end


end

