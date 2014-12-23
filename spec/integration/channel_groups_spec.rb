# require 'spec_helper'
#
# describe 'channel groups specific events' do
#
#   around(:each) do |example|
#     Celluloid.boot
#     example.run
#     Celluloid.shutdown
#   end
#
#   let(:callback) { lambda { |envelope| @envelopes = [envelope] } }
#
#   context '#subscribe' do
#
#     before :each do
#       @pubnub_client = Pubnub.new(subscribe_key: 'demo', publish_key: 'demo')
#     end
#
#     it 'allows us to subscribe to cg and channel' do
#       VCR.use_cassette('integration/channel_groups/subscribe-cg-and-channel', :record => :once) do
#         @pubnub_client.subscribe(channel: :bot, group: 'foo:foo', callback: callback)
#         eventually do
#           expect(@envelopes.first.message).to eq '*****.......... 3520 - 2014-11-05 03:49:35'
#         end
#       end
#     end
#
#     it 'allows us to subscribe to cg only' do
#       VCR.use_cassette('integration/channel_groups/subscribe-cg-only', :record => :once) do
#         @pubnub_client.subscribe(group: 'foo:foo', callback: callback)
#         eventually do
#           expect(@envelopes.first.message).to eq '*****.......... 4495 - 2014-11-05 04:08:46'
#         end
#       end
#     end
#   end
#
#   context '#leave' do
#     before :each do
#       @pubnub_client = Pubnub.new(subscribe_key: 'demo', publish_key: 'demo')
#     end
#
#     it 'leaves cg' do
#       VCR.use_cassette('integration/channel_groups/leave-cg', :record => :once) do
#         @pubnub_client.subscribe(channel: :bot, group: 'foo:foo', callback: callback)
#         sleep(1)
#         @pubnub_client.leave(channel: :bot, group: 'foo:foo', callback: callback)
#         sleep(1)
#         expect(@pubnub_client.env[:subscriptions].empty?).to eq true
#       end
#     end
#
#     it 'leaves cg and channel' do
#       VCR.use_cassette('integration/channel_groups/leave-cg-c', :record => :once) do
#         @pubnub_client.subscribe(group: 'foo:foo', callback: callback)
#         sleep(1)
#         @pubnub_client.leave(group: 'foo:foo', callback: callback)
#         sleep(1)
#         expect(@pubnub_client.env[:subscriptions].empty?).to eq true
#       end
#     end
#   end
#
#   context '#here_now' do
#     before :each do
#       @pubnub_client = Pubnub.new(subscribe_key: 'demo', publish_key: 'demo')
#     end
#
#     it 'can check cg' do
#       VCR.use_cassette('integration/channel_groups/here_now-cg', :record => :once) do
#         envelopes = @pubnub_client.here_now(group: 'foo:', http_sync: true)
#         expect(envelopes.first.message).to eq 'OK'
#
#       end
#     end
#   end
#
#   context 'PAM' do
#
#     before :each do
#       @pubnub_client = Pubnub.new(:subscribe_key => 'sub-c-53c3d30a-4135-11e3-9970-02ee2ddab7fe', :publish_key => 'pub-c-15d6fd3c-05de-4abc-8eba-6595a441959d', :secret_key => 'sec-c-ZWYwMGJiZTYtMTQwMC00NDQ5LWI0NmEtMzZiM2M5NThlOTJh')
#       Pubnub::Grant.any_instance.stub(:current_time).and_return 1234567890
#       Pubnub::Grant.any_instance.stub(:signature).and_return 'sig'
#       Pubnub::Audit.any_instance.stub(:current_time).and_return 1234567890
#       Pubnub::Audit.any_instance.stub(:signature).and_return 'sig'
#     end
#
#     context '#grant' do
#       it 'grants all permissions on cg' do
#         VCR.use_cassette('integration/channel_groups/grant-cg', :record => :once) do
#           envelopes = @pubnub_client.grant(group: 'foo:foo', http_sync: true)
#           expect(envelopes.first.message).to eq 'Success'
#         end
#         end
#
#       it 'grants all permissions on ns' do
#         VCR.use_cassette('integration/channel_groups/grant-ns', :record => :once) do
#           envelopes = @pubnub_client.grant(group: 'foo:', http_sync: true)
#           expect(envelopes.first.message).to eq 'Success'
#         end
#       end
#     end
#
#     context '#audit' do
#       it 'audits permissions on cg' do
#         VCR.use_cassette('integration/channel_groups/audit-cg', :record => :once) do
#           envelopes = @pubnub_client.audit(group: 'foo:foo', http_sync: true)
#           expect(envelopes.first.message).to eq 'Success'
#         end
#       end
#
#       it 'audits permissions on ns' do
#         VCR.use_cassette('integration/channel_groups/audit-ns', :record => :once) do
#           envelopes = @pubnub_client.audit(group: 'foo:', http_sync: true)
#           expect(envelopes.first.message).to eq 'Success'
#         end
#       end
#     end
#   end
# end