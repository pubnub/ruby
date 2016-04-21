# require 'spec_helper'
#
# describe 'Connect, disconnect and reconnect callbacks' do
#
#   around(:each) do |example|
#     Celluloid.boot
#     example.run
#     Celluloid.shutdown
#   end
#
#   before(:each) do
#     @connect_messages, @reconnect_messages, @disconnect_messages = [], [], []
#
#     connect_callback    = ->(msg) { @connect_messages << msg }
#     reconnect_callback  = ->(msg) { @reconnect_messages << msg }
#     disconnect_callback = ->(msg) { @disconnect_messages << msg }
#
#     @pubnub = Pubnub.new(
#                        subscribe_key: :demo,
#                        publish_key: :demo,
#                        connect_callback: connect_callback,
#                        disconnect_callback: disconnect_callback,
#                        reconnect_callback: reconnect_callback,
#                        reconnect_interval: 0
#     )
#   end
#
#   it 'fire connect callback when connection is made' do
#     VCR.use_cassette('client/connection_callbacks_0', :record => :once) do
#       @pubnub.subscribe(channel: :demo, http_sync: true){ |_e| }
#       eventually do
#         expect(@connect_messages.size).to eq 1
#       end
#     end
#   end
#
#   it 'fire disconnect callback when connection is lost' do
#
#     Pubnub::SubscribeEvent.any_instance.stub(:request_dispatcher) { Pubnub::SubscribeEvent.any_instance.unstub(:request_dispatcher); raise 'error' }
#
#     VCR.use_cassette('client/connection_callbacks_1', :record => :once) do
#       @pubnub.subscribe(channel: :demo, http_sync: true){ |_e| }
#       eventually do
#         expect(@disconnect_messages.size).to eq 1
#       end
#     end
#   end
#
#   it 'fire reconnect callback when connection is reestablished' do
#     Pubnub::SubscribeEvent.any_instance.stub(:request_dispatcher) { Pubnub::SubscribeEvent.any_instance.unstub(:request_dispatcher); raise 'error' }
#
#     VCR.use_cassette('client/connection_callbacks_2', :record => :once) do
#       @pubnub.subscribe(channel: :demo, http_sync: true){ |_e| }
#       eventually do
#         expect(@reconnect_messages.size).to eq 1
#       end
#     end
#   end
#
# end