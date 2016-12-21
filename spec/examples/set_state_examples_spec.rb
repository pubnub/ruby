require 'spec_helper'

describe Pubnub::SetState do
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

  it '__channel___demo___state____some___state____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/set_state/23', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some___state____http_sync__true___callback___block_' do
VCR.use_cassette('examples/set_state/21', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some___state____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/set_state/22', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some___state____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/set_state/20', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some___state____http_sync__false___callback___block_' do
VCR.use_cassette('examples/set_state/18', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some___state____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/set_state/19', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>:state}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__true___callback__nil_' do
VCR.use_cassette('examples/set_state/17', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__true___callback___block_' do
VCR.use_cassette('examples/set_state/15', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/set_state/16', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__false___callback__nil_' do
VCR.use_cassette('examples/set_state/14', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__false___callback___block_' do
VCR.use_cassette('examples/set_state/12', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo___state____some____more___complexe___state____it____is_______http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/set_state/13', record: :none) do
envelope = @pubnub.set_state(channel: :demo, state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/set_state/11', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__true___callback___block_' do
VCR.use_cassette('examples/set_state/9', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/set_state/10', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/set_state/8', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__false___callback___block_' do
VCR.use_cassette('examples/set_state/6', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some___state____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/set_state/7', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>:state}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__true___callback__nil_' do
VCR.use_cassette('examples/set_state/5', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__true___callback___block_' do
VCR.use_cassette('examples/set_state/3', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true, &@callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/set_state/4', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: true, callback: @callback)
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__false___callback__nil_' do
VCR.use_cassette('examples/set_state/2', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__false___callback___block_' do
VCR.use_cassette('examples/set_state/0', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false, &@callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


it '__channel___demo____state____some____more___complexe___state____it____is_______http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/set_state/1', record: :none) do
envelope = @pubnub.set_state(channel: 'demo', state: {:some=>{:more=>:complexe, :state=>["it", "is"]}}, http_sync: false, callback: @callback)
envelope = envelope.value
expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false

expect(envelope.status[:code]).to eq(200)
expect(envelope.status[:operation]).to eq(:set_state)
expect(envelope.status[:category]).to eq(:ack)
expect(envelope.status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end
end


end

