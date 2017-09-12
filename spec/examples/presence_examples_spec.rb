require 'spec_helper'

describe Pubnub::Presence do
  around :each do |example|
    Celluloid.boot

    @fired = false

    @callback = ->(_envelope) do
      @fired = true
    end

    @pubnub = Pubnub.new(
      publish_key: 'pub-c-b42cec2f-f468-4784-8833-dd2b074538c4',
      subscribe_key: 'sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f',
      uuid: 'ruby-test-uuid-client-one',
      auth_key: 'ruby-test-auth-client-one',
      reconnect_interval: 0
    )

    example.run
    Celluloid.shutdown
  end

  it '__channel___demo____http_sync__true___callback__nil_' do
VCR.use_cassette('examples/presence/8', record: :none) do
@pubnub.presence(channel: 'demo', http_sync: true)
envelopes = @pubnub.presence(channel: 'demo', http_sync: true)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465403696, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654036961172863", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654036961931472)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036098003799)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403696, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654036961172863", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403696, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo____http_sync__true___callback___block_' do
VCR.use_cassette('examples/presence/6', record: :none) do
@pubnub.presence(channel: 'demo', http_sync: true)
envelopes = @pubnub.presence(channel: 'demo', http_sync: true, &@callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"leave", "timestamp"=>1465403696, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654036965065315", :region_code=>2}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654036965469160)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036961931472)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"leave", "timestamp"=>1465403696, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654036965065315", :region_code=>2}, :message_meta_data=>nil, :presence_event=>"leave", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403696, :state=>nil, :occupancy=>0}})

end
end


it '__channel___demo____http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/presence/7', record: :none) do
@pubnub.presence(channel: 'demo', http_sync: true, callback: @callback)
envelopes = @pubnub.presence(channel: 'demo', http_sync: true, callback: @callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465403698, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654036986516448", :region_code=>2}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654036986900265)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036965469160)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403698, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654036986516448", :region_code=>2}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403698, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo____http_sync__false___callback__nil_' do
VCR.use_cassette('examples/presence/__channel___demo____http_sync__false___callback__nil_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo', http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo____http_sync__false___callback___block_' do
VCR.use_cassette('examples/presence/__channel___demo____http_sync__false___callback___block_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo', http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo____http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/presence/__channel___demo____http_sync__false___callback___lambda_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo', http_sync: false, callback: @callback)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo______http_sync__true___callback__nil_' do
VCR.use_cassette('examples/presence/5', record: :none) do
@pubnub.presence(channel: 'demo.*', http_sync: true)
envelopes = @pubnub.presence(channel: 'demo.*', http_sync: true)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo.*-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465403699, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654036996668692", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654036997432530)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036987376596)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403699, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo.*-pnpres", :actual_channel=>"demo.*-pnpres", :publish_time_object=>{:timetoken=>"14654036996668692", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403699, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo______http_sync__true___callback___block_' do
VCR.use_cassette('examples/presence/3', record: :none) do
@pubnub.presence(channel: 'demo.*', http_sync: true)
envelopes = @pubnub.presence(channel: 'demo.*', http_sync: true, &@callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo.*-pnpres", :subscription_match=>nil, :payload=>{"action"=>"leave", "timestamp"=>1465403700, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654037002398263", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654037003110327)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036997432530)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"leave", "timestamp"=>1465403700, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :subscribed_channel=>"demo.*-pnpres", :actual_channel=>"demo.*-pnpres", :publish_time_object=>{:timetoken=>"14654037002398263", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"leave", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403700, :state=>nil, :occupancy=>0}})

end
end


it '__channel___demo______http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/presence/4', record: :none) do
@pubnub.presence(channel: 'demo.*', http_sync: true, callback: @callback)
envelopes = @pubnub.presence(channel: 'demo.*', http_sync: true, callback: @callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo.*-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465403702, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654037023404890", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654037024165554)
expect(envelopes[0].status[:last_timetoken]).to eq(14654037003110327)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403702, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo.*-pnpres", :actual_channel=>"demo.*-pnpres", :publish_time_object=>{:timetoken=>"14654037023404890", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403702, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo______http_sync__false___callback__nil_' do
VCR.use_cassette('examples/presence/__channel___demo______http_sync__false___callback__nil_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo.*', http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo______http_sync__false___callback___block_' do
VCR.use_cassette('examples/presence/__channel___demo______http_sync__false___callback___block_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo.*', http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo.*-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo______http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/presence/__channel___demo______http_sync__false___callback___lambda_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: 'demo.*', http_sync: false, callback: @callback)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo.*-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo___http_sync__true___callback__nil_' do
VCR.use_cassette('examples/presence/11', record: :none) do
@pubnub.presence(channel: :demo, http_sync: true)
envelopes = @pubnub.presence(channel: :demo, http_sync: true)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"leave", "timestamp"=>1465403703, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654037039766378", :region_code=>2}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654037040157428)
expect(envelopes[0].status[:last_timetoken]).to eq(14654036986900265)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"leave", "timestamp"=>1465403703, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654037039766378", :region_code=>2}, :message_meta_data=>nil, :presence_event=>"leave", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403703, :state=>nil, :occupancy=>0}})

end
end


it '__channel___demo___http_sync__true___callback___block_' do
VCR.use_cassette('examples/presence/9', record: :none) do
@pubnub.presence(channel: :demo, http_sync: true)
envelopes = @pubnub.presence(channel: :demo, http_sync: true, &@callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465405069, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654050693824272", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654050694555754)
expect(envelopes[0].status[:last_timetoken]).to eq(14654042961245025)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465405069, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654050693824272", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465405069, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo___http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/presence/10', record: :none) do
@pubnub.presence(channel: :demo, http_sync: true, callback: @callback)
envelopes = @pubnub.presence(channel: :demo, http_sync: true, callback: @callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>nil, :payload=>{"action"=>"join", "timestamp"=>1465403890, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654038904558577", :region_code=>2}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654038904954461)
expect(envelopes[0].status[:last_timetoken]).to eq(14654037040157428)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403890, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654038904558577", :region_code=>2}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403890, :state=>nil, :occupancy=>1}})

end
end


it '__channel___demo___http_sync__false___callback__nil_' do
VCR.use_cassette('examples/presence/__channel___demo___http_sync__false___callback__nil_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: :demo, http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo___http_sync__false___callback___block_' do
VCR.use_cassette('examples/presence/__channel___demo___http_sync__false___callback___block_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: :demo, http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel___demo___http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/presence/__channel___demo___http_sync__false___callback___lambda_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: :demo, http_sync: false, callback: @callback)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel____demo___demo____demo_______http_sync__true___callback__nil_' do
VCR.use_cassette('examples/presence/2', record: :none) do
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true)
envelopes = @pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>"demo-pnpres", :payload=>{"action"=>"leave", "timestamp"=>1465403891, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654038913084722", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654038913920232)
expect(envelopes[0].status[:last_timetoken]).to eq(14654038905501214)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"leave", "timestamp"=>1465403891, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654038913084722", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"leave", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403891, :state=>nil, :occupancy=>0}})

end
end


it '__channel____demo___demo____demo_______http_sync__true___callback___block_' do
VCR.use_cassette('examples/presence/0', record: :none) do
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true)
envelopes = @pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true, &@callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo.*-pnpres", :subscription_match=>"demo.*-pnpres", :payload=>{"action"=>"leave", "timestamp"=>1465403892, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654038929920942", :region_code=>1}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654038931856126)
expect(envelopes[0].status[:last_timetoken]).to eq(14654038913920233)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"leave", "timestamp"=>1465403892, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>0}, :subscribed_channel=>"demo.*-pnpres", :actual_channel=>"demo.*-pnpres", :publish_time_object=>{:timetoken=>"14654038929920942", :region_code=>1}, :message_meta_data=>nil, :presence_event=>"leave", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403892, :state=>nil, :occupancy=>0}})

end
end


it '__channel____demo___demo____demo_______http_sync__true___callback___lambda_' do
VCR.use_cassette('examples/presence/1', record: :none) do
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true, callback: @callback)
envelopes = @pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: true, callback: @callback)
envelopes.each do |envelope|

expect(envelope.is_a?(Pubnub::Envelope)).to eq true
expect(envelope.error?).to eq false
end


expect(envelopes[0].status[:code]).to eq(200)
expect(envelopes[0].status[:data]).to eq({:shard=>"5", :channel=>"demo-pnpres", :subscription_match=>"demo-pnpres", :payload=>{"action"=>"join", "timestamp"=>1465403893, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :flags=>0, :issuing_client_id=>nil, :subscribe_key=>"sub-c-b7fb805a-1777-11e6-be83-0619f8945a4f", :sequence_number=>nil, :user_meta_data=>nil, :replication_map=>nil, :eat_after_reading=>nil, :waypoint_list=>nil, :origination_time_token=>nil, :publish_timetoken=>{:timetoken=>"14654038934962157", :region_code=>2}})
expect(envelopes[0].status[:category]).to eq(:ack)
expect(envelopes[0].status[:auto_retried]).to eq(true)
expect(envelopes[0].status[:current_timetoken]).to eq(14654038935342617)
expect(envelopes[0].status[:last_timetoken]).to eq(14654038931856126)
expect(envelopes[0].status[:subscribed_channels]).to eq([])
expect(envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})

expect(envelopes[0].result[:code]).to eq(200)
expect(envelopes[0].result[:operation]).to eq(:presence)
expect(envelopes[0].result[:data]).to eq({:message=>{"action"=>"join", "timestamp"=>1465403893, "uuid"=>"ruby-test-uuid-client-two", "occupancy"=>1}, :subscribed_channel=>"demo-pnpres", :actual_channel=>"demo-pnpres", :publish_time_object=>{:timetoken=>"14654038934962157", :region_code=>2}, :message_meta_data=>nil, :presence_event=>"join", :presence=>{:uuid=>"ruby-test-uuid-client-two", :timestamp=>1465403893, :state=>nil, :occupancy=>1}})

end
end


it '__channel____demo___demo____demo_______http_sync__false___callback__nil_' do
VCR.use_cassette('examples/presence/__channel____demo___demo____demo_______http_sync__false___callback__nil_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel____demo___demo____demo_______http_sync__false___callback___block_' do
VCR.use_cassette('examples/presence/__channel____demo___demo____demo_______http_sync__false___callback___block_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: false)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[2].status[:category]).to eq(:timeout)
expect(@status_envelopes[2].status[:error]).to eq(true)
expect(@status_envelopes[2].status[:auto_retried]).to eq(true)
expect(@status_envelopes[2].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[2].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[2].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[2].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[2].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


it '__channel____demo___demo____demo_______http_sync__false___callback___lambda_' do
VCR.use_cassette('examples/presence/__channel____demo___demo____demo_______http_sync__false___callback___lambda_', record: :none) do
@msg_envelopes = []
@presence_envelopes = []
@status_envelopes = []
          callbacks = Pubnub::SubscribeCallback.new(
                                                   message:  ->(envelope) { @msg_envelopes      << envelope },
                                                   presence: ->(envelope) { @presence_envelopes << envelope },
                                                   status:   ->(envelope) { @status_envelopes   << envelope }
          )

@pubnub.add_listener(callback: callbacks)
@pubnub.presence(channel: [:demo, "demo", "demo.*"], http_sync: false, callback: @callback)
end

eventually do


expect(@status_envelopes[0].status[:category]).to eq(:timeout)
expect(@status_envelopes[0].status[:error]).to eq(true)
expect(@status_envelopes[0].status[:auto_retried]).to eq(true)
expect(@status_envelopes[0].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[0].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[0].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[0].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[1].status[:category]).to eq(:timeout)
expect(@status_envelopes[1].status[:error]).to eq(true)
expect(@status_envelopes[1].status[:auto_retried]).to eq(true)
expect(@status_envelopes[1].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[1].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[1].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[1].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})



expect(@status_envelopes[2].status[:category]).to eq(:timeout)
expect(@status_envelopes[2].status[:error]).to eq(true)
expect(@status_envelopes[2].status[:auto_retried]).to eq(true)
expect(@status_envelopes[2].status[:current_timetoken]).to eq(0)
expect(@status_envelopes[2].status[:last_timetoken]).to eq(0)
expect(@status_envelopes[2].status[:subscribed_channels]).to eq(["demo-pnpres", "demo.*-pnpres"])
expect(@status_envelopes[2].status[:subscribed_channel_groups]).to eq([])
expect(@status_envelopes[2].status[:config]).to eq({:tls=>false, :uuid=>"ruby-test-uuid-client-one", :auth_key=>"ruby-test-auth-client-one", :origin=>"ps.pndsn.com"})


end

end


end
